class Album < ApplicationRecord
  after_initialize :set_image, unless: :persisted?

  belongs_to :artist
  has_many :songs, :dependent => :destroy
  has_many :favorite_albums, :dependent => :destroy
  accepts_nested_attributes_for :songs
  delegate :user, :to => :artist
  validates :title, presence: true, uniqueness: { allow_blank: false, case_sensitive: false }

  def set_image
    begin
      albums = RSpotify::Album.search(self.title)
      albums.each do |album|
        if album.artists[0].name.casecmp(self.artist.name) == 0
          image = album.images.first
          self.image = image['url']
          self.title = album.name
        end
      end
    rescue
      self.image  ||= nil
    end
  end
end
