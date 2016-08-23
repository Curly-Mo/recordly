json.extract! favorite_song, :id, :user_id, :song_id, :created_at, :updated_at
json.url favorite_song_url(favorite_song, format: :json)