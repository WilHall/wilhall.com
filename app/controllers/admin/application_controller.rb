# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController

    before_action :authenticate_user!
    before_action :authorize_user

    def after_sign_in_path_for(resource)
      quarterly_reports_path
    end

    def authorize_user
      unless current_user && current_user.admin
        redirect_to root_path
      end
    end
  end
end
