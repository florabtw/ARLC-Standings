json.array!(@standings) do |standing|
  json.extract! standing, :id
  json.url standing_url(standing, format: :json)
end
