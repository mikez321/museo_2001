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

end
