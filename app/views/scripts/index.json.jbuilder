json.array!(@scripts) do |script|
  json.extract! script, :id, :name, :code, :lamp_id
  json.url script_url(script, format: :json)
end
