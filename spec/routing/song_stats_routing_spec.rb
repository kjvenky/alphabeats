require "rails_helper"

RSpec.describe SongStatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/song_stats").to route_to("song_stats#index")
    end

    it "routes to #new" do
      expect(:get => "/song_stats/new").to route_to("song_stats#new")
    end

    it "routes to #show" do
      expect(:get => "/song_stats/1").to route_to("song_stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/song_stats/1/edit").to route_to("song_stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/song_stats").to route_to("song_stats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/song_stats/1").to route_to("song_stats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/song_stats/1").to route_to("song_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/song_stats/1").to route_to("song_stats#destroy", :id => "1")
    end

  end
end
