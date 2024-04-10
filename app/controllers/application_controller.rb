class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :exception

  before_action :set_layout

  private

  def set_layout
    # Set the layout to 'navigate' only if the user is logged in
    if current_user
      self.class.layout 'navigate'
    else
      # Use the default application layout if the user is not logged in
      self.class.layout 'application'
    end
  end

  def after_sign_in_path_for(resource)
    # Redirect to the patients index view after login
    patients_path
  end
end
