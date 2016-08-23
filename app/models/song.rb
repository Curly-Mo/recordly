class Song < ApplicationRecord
  after_initialize :set_preview_url, unless: :persisted?

  belongs_to :album
  has_many :favorite_songs, :dependent => :destroy
  delegate :user, :to => :album

  def set_preview_url
    begin
      songs = RSpotify::Track.search(self.title)
      preview_url = songs.first.preview_url
      self.preview_url = preview_url
    rescue
      self.preview_url  ||= nil
    end
  end
end
