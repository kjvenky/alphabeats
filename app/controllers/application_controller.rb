class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter  :configure_permitted_parameters, if: :devise_controller? 
  helper_method :current_order, :paid_album?
  def after_sign_up_path_for(resource_or_scope)
  	# if request.env['omniauth.origin']
   #    root_path
   #  end
   	redirect_to albums_path
  end
  def after_sign_in_path_for(resource)
    post_login_home_path 
  end

  def song_album_list
    default_list = [OpenStruct.new({code: -1, text: "Create New Album"})]
    dynamic_list = current_user.albums.collect {|album| OpenStruct.new({code: album.id, text: album.album_name}) if album.order_items.last.nil?}.compact
    default_list + dynamic_list
  end

  def current_order
    if !session[:order_id].nil?
      current_user.orders.find(session[:order_id])
    else
      current_user.orders.new
    end
  end

  def mobile_device?
   !!(request.user_agent =~ /Mobile|webOS/)
  end
  
  def mobile_format
    request.format = :mobile if mobile_device?
  end

  def wallet_create_if_empty
      Wallet.create(user_id: current_user.id, amount:0) if current_user.wallet.nil?
  end

  def paid_album?(resource)
    !resource.order_items.last.nil? && resource.order_items.last.order.payment_status
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :username
   end

  def authorize_musician
    redirect_to root_url, alert: "You are not authorized" if !current_user.musician?
  end

  # def authorize_admin_or_user
  #   if !current_user.admin?
  #     authenticate_user!
  #   end
  # end

end
