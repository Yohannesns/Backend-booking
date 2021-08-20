json.extract! hotel, :id, :name, :star_rating, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
