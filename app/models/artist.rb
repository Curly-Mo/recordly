require 'rspotify'
class Artist < ApplicationRecord
  after_initialize :set_image, unless: :persisted?

  belongs_to :user
  has_many :albums, :dependent => :destroy
  has_many :favorite_artists, :dependent => :destroy
  accepts_nested_attributes_for :albums

  def set_image
    begin
      artists = RSpotify::Artist.search(self.name)
      artists.each do |artist|
        if artist.name.casecmp(self.name) == 0
          image = artist.images.first
          self.image = image['url']
          self.name = artist.name
        end
      end
    rescue
      self.image  ||= nil
    end
  end
end
