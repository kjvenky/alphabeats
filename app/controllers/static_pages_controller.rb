class StaticPagesController < ApplicationController

  before_filter :authenticate_user!, only: [:cart_page, :payment_page, :discover, :fund, :wallet]
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
  end

  def fund
  end

  def wallet
  end

end
