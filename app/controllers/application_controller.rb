class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_filter :store_location
  helper_method :is_admin, :correct_user

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != root_path &&
        request.path != "/login" &&
        request.path != "/users/sign_in" &&
        request.path != "/signup" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  protected

  def configure_devise_permitted_parameters
  	
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, 
    														  :password_confirmation, :current_password])
  end

  def is_admin
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
