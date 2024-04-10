class ApplicationController < ActionController::Base
    include Pundit::Authorization
    protect_from_forgery with: :exception
    layout 'navigate'

    private

    def after_sign_in_path_for(resource)
      # Redirect to the patients index view after login
      patients_path
    end

end
