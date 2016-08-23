class Album < ApplicationRecord
  after_initialize :set_image, unless: :persisted?

  belongs_to :artist
  has_many :songs, :dependent => :destroy
  has_many :favorite_albums, :dependent => :destroy
  accepts_nested_attributes_for :songs
  delegate :user, :to => :artist

  def set_image
    begin
      albums = RSpotify::Album.search(self.title)
      image = albums.first.images.first
      self.image = image['url']
    rescue
      self.image  ||= nil
    end
  end
end
