require 'rails_helper'

RSpec.describe "song_stats/new", type: :view do
  before(:each) do
    assign(:song_stat, SongStat.new(
      :sale_month => "MyString",
      :store => "MyString",
      :artist => "MyString",
      :title => "MyString",
      :quantity => 1,
      :song_album => "MyString",
      :customer_paid => "9.99",
      :customer_currency => "MyString",
      :country_of_sale => "MyString",
      :songwriter_royalties_withheld => "MyString",
      :earnings => "9.99",
      :song_id => 1
    ))
  end

  it "renders new song_stat form" do
    render

    assert_select "form[action=?][method=?]", song_stats_path, "post" do

      assert_select "input#song_stat_sale_month[name=?]", "song_stat[sale_month]"

      assert_select "input#song_stat_store[name=?]", "song_stat[store]"

      assert_select "input#song_stat_artist[name=?]", "song_stat[artist]"

      assert_select "input#song_stat_title[name=?]", "song_stat[title]"

      assert_select "input#song_stat_quantity[name=?]", "song_stat[quantity]"

      assert_select "input#song_stat_song_album[name=?]", "song_stat[song_album]"

      assert_select "input#song_stat_customer_paid[name=?]", "song_stat[customer_paid]"

      assert_select "input#song_stat_customer_currency[name=?]", "song_stat[customer_currency]"

      assert_select "input#song_stat_country_of_sale[name=?]", "song_stat[country_of_sale]"

      assert_select "input#song_stat_songwriter_royalties_withheld[name=?]", "song_stat[songwriter_royalties_withheld]"

      assert_select "input#song_stat_earnings[name=?]", "song_stat[earnings]"

      assert_select "input#song_stat_song_id[name=?]", "song_stat[song_id]"
    end
  end
end
