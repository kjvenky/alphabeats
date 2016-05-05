require 'rails_helper'

RSpec.describe "song_stats/show", type: :view do
  before(:each) do
    @song_stat = assign(:song_stat, SongStat.create!(
      :sale_month => "Sale Month",
      :store => "Store",
      :artist => "Artist",
      :title => "Title",
      :quantity => 1,
      :song_album => "Song Album",
      :customer_paid => "9.99",
      :customer_currency => "Customer Currency",
      :country_of_sale => "Country Of Sale",
      :songwriter_royalties_withheld => "Songwriter Royalties Withheld",
      :earnings => "9.99",
      :song_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sale Month/)
    expect(rendered).to match(/Store/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Song Album/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Customer Currency/)
    expect(rendered).to match(/Country Of Sale/)
    expect(rendered).to match(/Songwriter Royalties Withheld/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
  end
end
