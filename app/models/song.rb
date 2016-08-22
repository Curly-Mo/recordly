class Song < ApplicationRecord
  belongs_to :album
  delegate :user, :to => :album
end
