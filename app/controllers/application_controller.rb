class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do |e|
    flash[:error] = "Access Denied"
    redirect_to root_url


end

def after_sign_in_path_for(resource)
  '/welcome/studentindex'
end

  protected

    def configure_permitted_parameters

        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:dob, :email, :password,:student,:admin,:uni_admin,:event_creator,:password_confirmation,:image, :city,:state,:country) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:dob, :email, :password, :current_password, :dob, :image,:city,:state,:country) }

    end



end
