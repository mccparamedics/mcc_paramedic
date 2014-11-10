class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  prepend_before_filter :store_location

  protected

  #->Prelang (user_login:devise)
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in)        { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def authenticate_admin!
    redirect_to new_user_session_path, notice: "You must log in to access that page." and return unless current_user
    redirect_to :back, notice: "You are not an administrator." unless current_user.try(:is_admin?)
  rescue ActionController::RedirectBackError
    redirect_to root_path, notice: "You are not an administrator."
  end

  private
  
  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?

      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: "You must be signed in to view this page."}
    end
  end


  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    logger.info "store_location: request.fullpath: #{request.fullpath}"
    logger.info "return_to path: #{session["user_return_to"]}"
    if (request.fullpath != "/login" &&
        request.fullpath != "/signup" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session["user_return_to"] = request.fullpath
    end
    logger.info "return_to path: #{session["user_return_to"]}"
  end
end
