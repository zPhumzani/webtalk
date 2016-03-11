class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def current_user
    	return unless session[:user_id]
    	@current_user ||= User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
    	redirect_to sign_up_path, notice: "Please Sign_up"
    end

    helper_method :current_user

    def authenticate_user!
    	logged_in? || access_denied
    end

    def logged_in?
    	current_user.is_a? User
    end

    def admin_rights?
        if logged_in? && current_user.admin?
          return true
        else
          return false
        end
    end

    helper_method :logged_in?, :recent_articles, :all_tags, :admin_rights?

    def access_denied
    	redirect_to login_path, notice: "Please log in to continue" and return false
    end

    def recent_articles
    	@recent = Article.recent_article
    end

    def all_tags
      @tag = Tag.select(:id, :name)
    end


end
