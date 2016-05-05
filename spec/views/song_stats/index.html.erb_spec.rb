require 'rails_helper'

RSpec.describe "song_stats/index", type: :view do
  before(:each) do
    assign(:song_stats, [
      SongStat.create!(
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
      ),
      SongStat.create!(
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
      )
    ])
  end

  it "renders a list of song_stats" do
    render
    assert_select "tr>td", :text => "Sale Month".to_s, :count => 2
    assert_select "tr>td", :text => "Store".to_s, :count => 2
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Song Album".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Currency".to_s, :count => 2
    assert_select "tr>td", :text => "Country Of Sale".to_s, :count => 2
    assert_select "tr>td", :text => "Songwriter Royalties Withheld".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
