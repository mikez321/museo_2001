require 'csv'
class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def photo_by_artist_id(id)
    @photographs.find_all do |photo|
      photo.artist_id == id
    end
  end

  def photographs_by_artist
    artist_photos = {}
    artists.each do |artist|
      artist_photos[artist] = photo_by_artist_id(artist.id)
    end
    artist_photos
  end

  def artists_with_multiple_photographs
    artists = []
    photographs_by_artist.each do |artist, photos|
      artists << artist.name if photos.length > 1
    end
    artists
  end

  def photographs_taken_by_artist_from(country)
    artists_in_country = @artists.find_all do |artist|
      artist.country == country
    end

    ids_in_country = artists_in_country.map do |artist|
      artist.id
    end

    ids_in_country.flat_map do |id|
     @photographs.find_all do |photo|
        photo.artist_id == id
      end
    end
  end

  def load_photographs(file)
    data = CSV.readlines(file, headers: true, header_converters: :symbol)
    data.each do |line|
      photograph = Photograph.new(line.to_h)
      @photographs << photograph
    end
  end

  def load_artists(file)
    data = CSV.readlines(file, headers: true, header_converters: :symbol)
    data.each do |line|
      artist = Artist.new(line.to_h)
      @artists << artist
    end
  end

  def photographs_taken_between(range)
    years = range.to_a.map { |year| year.to_s }
    @photographs.find_all do |photo|
      years.include?(photo.year)
    end.map { |photo| photo.name }
  end

end
