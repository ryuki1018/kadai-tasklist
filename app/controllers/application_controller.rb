class ApplicationController < ActionController::Base
    
    private
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
            flash[:danger] = '正しい動作が行われませんでした。'
        end
    end
    
end
