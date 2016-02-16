module ApplicationHelper

    def admin_only?
    	if logged_in? && current_user.admin?
    		return true
    	else
    		false
    	end
    end
end
