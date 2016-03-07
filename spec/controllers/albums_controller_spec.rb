require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  describe "GET #index" do
    login_musician
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      show_album = FactoryGirl.create(:album)
      sign_in :user, show_album.musician
      get :show, {id: show_album.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    login_musician
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      edit_song = FactoryGirl.create(:album)
      sign_in :user, edit_song.musician
      get :edit, {id: edit_song.id}
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST #create" do
    login_musician

    context "with valid attributes" do
      it "redirects to show page upon save" do
        post :create, album: FactoryGirl.attributes_for(:album)
        expect(response).to redirect_to album_path(assigns[:album])
      end
    end

    context "with invalid attributes" do
      it "redirects to new page upon save" do
        post :create, album: FactoryGirl.attributes_for(:invalid_album)
        expect(response).to render_template("new")
      end
    end

  end

  describe "PUT #update" do

    let (:attr) do
      FactoryGirl.attributes_for(:updated_album)
    end

    before(:each) do
      @update_album = FactoryGirl.create(:album)
      sign_in :user, @update_album.musician
      put :update, :id => @update_album.id, :album => FactoryGirl.attributes_for(:updated_album)
      @update_album.reload
    end

    it { expect(response).to redirect_to(@update_album) }
    it { expect(@update_album.album_name).to eql attr[:album_name] }
    it { expect(@update_album.stage_band_name).to eql attr[:stage_band_name] }

  end

end
