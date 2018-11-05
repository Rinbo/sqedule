class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        planning_pages_path
    end
end
