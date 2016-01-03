json.array!(@albums) do |album|
  json.extract! album, :id, :album_name, :musician_id
  json.url album_url(album, format: :json)
end
