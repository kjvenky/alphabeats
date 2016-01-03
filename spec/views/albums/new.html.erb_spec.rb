require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :album_name => "MyString",
      :musician => nil
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input#album_album_name[name=?]", "album[album_name]"

      assert_select "input#album_musician_id[name=?]", "album[musician_id]"
    end
  end
end
