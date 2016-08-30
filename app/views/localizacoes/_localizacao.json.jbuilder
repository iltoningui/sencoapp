json.extract! localizacao, :id, :latitude, :longitude, :created_at, :updated_at
json.url localizacao_url(localizacao, format: :json)