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

    context "with valid attributes including a note to admin" do
      it "redirects to show page upon save" do
        post :create, song: FactoryGirl.attributes_for(:song_with_notes)
        expect(response).to redirect_to Song.last
        expect(Song.last.note_to_admin).to_not eql " "
        expect(Song.last.note_to_admin).to eql "please add my notes"
      end
    end

  end


  describe "GET #edit" do
    it "returns http success" do
      new_song = FactoryGirl.create(:song)
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
      put :update, :id=>@new_song.id, :song=>FactoryGirl.attributes_for(:updated_song)
      @new_song.reload
    end
    it { expect(response).to redirect_to(@new_song) }
    it { expect(@new_song.song_title).to eql attr[:song_title] }
    it { expect(@new_song.song_writer).to eql attr[:song_writer] }
  end



end
