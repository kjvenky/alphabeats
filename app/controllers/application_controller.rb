class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter  :configure_permitted_parameters, if: :devise_controller? 
  def after_sign_up_path_for(resource_or_scope)
  	# if request.env['omniauth.origin']
   #    root_path
   #  end
   	redirect_to root_path
  end

  def song_album_list
    default_list = [OpenStruct.new({code: -1, text: "Create New Album"})]
    dynamic_list = current_user.albums.collect {|album| OpenStruct.new({code: album.id, text: album.album_name}) }
    default_list + dynamic_list
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
   end

  def authorize_musician
    redirect_to root_url, alert: "You are not authorized" if !current_user.musician?
  end
end
