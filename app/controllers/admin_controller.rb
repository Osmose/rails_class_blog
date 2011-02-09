class AdminController < ApplicationController
    before_filter :authenticate_user!
    before_filter :require_admin
    
    def require_admin
        current_user.admin?
    end
end
