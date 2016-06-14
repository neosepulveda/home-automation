json.array!(@lamps) do |lamp|
  json.extract! lamp, :id, :name, :description, :calendar, :status
  json.url lamp_url(lamp, format: :json)
end
