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
      image = artists.first.images.first
      self.image = image['url']
    rescue
      self.image  ||= nil
    end
  end
end
