class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new(name).tap { |a| a.save}
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artists
    self.songs.collect { |s| s.artist}.uniq
  end
  
  def to_s
    self.name
  end
  
  def save
    @@all << self
  end
  
end