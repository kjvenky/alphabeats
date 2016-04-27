require 'rails_helper'

RSpec.describe "SongStats", type: :request do
  describe "GET /song_stats" do
    it "works! (now write some real specs)" do
      get song_stats_path
      expect(response).to have_http_status(200)
    end
  end
end
