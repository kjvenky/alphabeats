require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "redirects to show page upon save" do
        post :create, song: FactoryGirl.attributes_for(:song)
        expect(response).to redirect_to Song.last
      end
    end

    context "with invalid attributes" do
      it "redirects to new page upon save" do
        post :create, song: FactoryGirl.attributes_for(:invalid_song)
        expect(response).to render_template("new")
      end
    end

  end

end
