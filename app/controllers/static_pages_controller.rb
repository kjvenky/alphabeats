class StaticPagesController < ApplicationController

  def home
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

end
