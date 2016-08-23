json.extract! favorite_artist, :id, :user_id, :artist_id, :created_at, :updated_at
json.url favorite_artist_url(favorite_artist, format: :json)