json.array!(@matches) do |match|
  json.extract! match, :id, :home_team_id, :away_team_id, :match_status_id
  json.url match_url(match, format: :json)
end
