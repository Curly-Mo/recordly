class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :artists
  has_many :albums, through: :artists
  has_many :songs, through: :albums

  has_many :favorite_artists
  has_many :favorite_albums
  has_many :favorite_songs
end
