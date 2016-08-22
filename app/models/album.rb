class Album < ApplicationRecord
  belongs_to :artist

  has_many :songs
  accepts_nested_attributes_for :songs
  delegate :user, :to => :artist
end
