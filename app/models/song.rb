class Song < ApplicationRecord
  after_initialize :set_preview_url, unless: :persisted?

  belongs_to :album
  has_many :favorite_songs, :dependent => :destroy
  delegate :user, :to => :album
  validates :title, presence: true, uniqueness: { allow_blank: false, case_sensitive: false }

  def set_preview_url
    begin
      songs = RSpotify::Track.search(self.title)
      songs.each do |song|
        if song.album.name.casecmp(self.album.title) == 0
          preview_url = song.preview_url
          self.preview_url = preview_url
          self.title = song.name
        end
      end
    rescue
      self.preview_url  ||= nil
    end
  end
end
