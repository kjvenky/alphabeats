class StaticPagesController < ApplicationController

  # before_filter :authenticate_user!, only: [:cart_page, :payment_page, :discover, :fund, :wallet, :shortlist, :holdings, :open_trades, :performance]
  before_filter :authenticate_user!, except: [:home, :about, :faq, :pricing, :contact, :terms, :updates, :letter, :after_signup_home, :inactive_signup_home]
  before_filter :mobile_format, only: [:home]

  def home
    if user_signed_in?
      redirect_to post_login_home_url
    else
      render :layout => false
    end
  end

  def about
  end

  def faq
  end

  def pricing
  end

  def contact
  end

  def terms
  end

  def updates
    redirect_to "https://docs.google.com/a/alphabeatsmusic.com/forms/d/1kNieUkKV9GTG-_uAWE1h6DuTJKXBuODGnrOyhTIXMD8/viewform"
  end
  
  def letter
  end

  def dashboard
    @albums = current_user.albums.all
  end
  
  def cart_page
    @albums = current_user.albums.all
  end

  def payment_page
  end

  def post_login_home
  end

  def after_signup_home
  end

  def inactive_signup_home
  end

  def discover
    @songs = Song.all
  end

  def wallet
  end

  def shortlist
    @songs = Song.all
  end

  def holdings
    @songs = current_user.shareholder_songs
  end

  def performance
    @trade_sells = TradeLog.where(seller_id: current_user.id)
    @trade_buys = TradeLog.where(buyer_id: current_user.id)
    # byebug
  end

  def open_trades
    @bids = current_user.bids.where(open_status: [1,3] )
    @offers = current_user.offers.where(open_status: [1,3])
  end

end
