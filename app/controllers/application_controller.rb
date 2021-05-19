class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!, except: :home
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [ :index, :home ], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [ :index, :home ], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected
    def configure_permitted_parameters
      params_to_permit = %i[email password current_password photo first_name last_name user_name]
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(params_to_permit)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(params_to_permit)}
    end
end
