json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname
  json.url user_url(user, format: :json)
end
