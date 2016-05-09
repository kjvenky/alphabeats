json.array!(@song_stats) do |song_stat|
  json.extract! song_stat, :id, :reporting_date, :sale_month, :store, :artist, :title, :quantity, :song_album, :customer_paid, :customer_currency, :country_of_sale, :songwriter_royalties_withheld, :earnings, :song_id
  json.url song_stat_url(song_stat, format: :json)
end
