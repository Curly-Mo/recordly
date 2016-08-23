class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :artists, :dependent => :destroy
  has_many :albums, through: :artists
  has_many :songs, through: :albums

  has_many :favorite_artists, :dependent => :destroy
  has_many :favorite_albums, :dependent => :destroy
  has_many :favorite_songs, :dependent => :destroy
end
