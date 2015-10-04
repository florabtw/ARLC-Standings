json.array!(@players) do |player|
  json.extract! player, :id, :username, :psn_id, :steam_id
  json.url player_url(player, format: :json)
end
