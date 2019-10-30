class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    new= self.create
    new.name = name
    new
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    parsed = file.split(" ")
    artist = parsed[0]
    title = parsed[2..-1]
    title = title.join(" ").split('.')
    title = title[0]
    new = self.new_by_name(title)
    new.artist_name = artist

    return new
  end

  def self.create_from_filename(file)
    parsed = file.split(" ")
    artist = parsed[0]
    title = parsed[2..-1]
    title = title.join(" ").split('.')
    title = title[0]
    new = self.create_by_name(title)
    new.artist_name = artist
    return new
  end

  def self.destroy_all
    @@all = []
  end
end


