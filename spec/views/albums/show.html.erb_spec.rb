require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :album_name => "Album Name",
      :musician => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Album Name/)
    expect(rendered).to match(//)
  end
end
