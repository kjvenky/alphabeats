require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :album_name => "MyString",
      :musician => nil
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_album_name[name=?]", "album[album_name]"

      assert_select "input#album_musician_id[name=?]", "album[musician_id]"
    end
  end
end
