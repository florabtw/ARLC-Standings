json.array!(@divisions) do |division|
  json.extract! division, :id, :name, :league_id, :region_id
  json.url division_url(division, format: :json)
end
