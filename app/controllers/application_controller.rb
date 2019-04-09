class ApplicationController < ActionController::Base
#    protect_from_forgery with: :exception
#    before_action :authenticate

    def authenticate
        if session[:username] == nil
            redirect_to '/sessions/new'
        end
    end

end
