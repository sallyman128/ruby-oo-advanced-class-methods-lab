require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_details = file_name.split(" - ")
    artist = song_details[0]
    song_title = song_details[1].split(".mp3")[0]

    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist
    new_song   
  end

  def self.create_from_filename(file_name)
    song_details = file_name.split(" - ")
    artist = song_details[0]
    song_title = song_details[1].split(".mp3")[0]

    new_song = self.create
    new_song.name = song_title
    new_song.artist_name = artist
    new_song  
  end

  def self.destroy_all
    self.all.clear
  end

end

Song.create
