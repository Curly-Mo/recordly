json.extract! favorite_album, :id, :user_id, :album_id, :created_at, :updated_at
json.url favorite_album_url(favorite_album, format: :json)