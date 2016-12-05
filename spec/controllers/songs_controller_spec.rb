require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET #index" do
    login_musician
    it "returns http success" do
      get :index
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

  describe "GET #show" do
    it "returns show page" do
      @show_song = FactoryGirl.create(:song)
      sign_in :user, @show_song.musician
      get :show, {id: @show_song.musician}
    end
  end

  describe "POST #create" do

    before(:each) do
        @new_create_album = FactoryGirl.create(:album)
        sign_in :user, @new_create_album.musician
    end

    context "with valid attributes" do
      it "redirects to show page upon save" do
        post :create, song: FactoryGirl.attributes_for(:song, album_id: @new_create_album.id, musician_id: @new_create_album.musician.id)
        expect(response).to redirect_to album_song_path(assigns[:song])
      end
    end

    context "with invalid attributes" do
      it "redirects to new page upon save" do
        post :create, song: FactoryGirl.attributes_for(:invalid_song)
        expect(response).to render_template("new")
      end
    end

    context "with valid attributes including a note to admin" do
      it "redirects to show page upon save" do
        post :create, song: FactoryGirl.attributes_for(:song_with_notes, album_id: @new_create_album.id, musician_id: @new_create_album.musician.id)
        expect(response).to redirect_to album_song_path(assigns[:song])
        expect(Song.last.note_to_admin).to_not eql " "
        expect(Song.last.note_to_admin).to eql "please add my notes"
      end
    end

  end


  describe "GET #edit" do
    it "returns http success" do
      new_song = FactoryGirl.create(:song)
      sign_in :user, new_song.musician
      get :edit, {id: new_song.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
      let(:attr) do 
        FactoryGirl.attributes_for(:updated_song)
      end
      

    before(:each) do
      @new_song = FactoryGirl.create(:song)
      sign_in :user, @new_song.musician
      put :update, :id=>@new_song.id, :song=>FactoryGirl.attributes_for(:updated_song)
      @new_song.reload
    end
    it { expect(response).to redirect_to(@new_song) }
    it { expect(@new_song.song_title).to eql attr[:song_title] }
  end

end
