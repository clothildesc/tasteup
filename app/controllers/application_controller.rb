class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :save_navigation_history

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def save_navigation_history
    return unless request.get?
    return if request.xhr?

    session[:history] ||= []
    session[:history] << request.fullpath
    session[:history].delete_at 0 if session[:history].size == 6
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "History:"
    p session[:history]
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  end
end
