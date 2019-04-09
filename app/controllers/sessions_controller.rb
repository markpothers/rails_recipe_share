class SessionsController < ApplicationController

#    skip_before_action :authenticate, :only => [:new, :create]

    def new
    end

    def create
        @chef = Chef.find_by(username: session_params[:username])
            return head(:forbidden) unless user.authenticale(session_params[:password])
            session[:chef_id] = @user_id
            session[:username] = @chef.username
            redirect_to "/chefs/#{@chef_id}"
    end

    def destroy
        session.delete :username
        session.delete :id
        reidrect_to '/sessions/new'
    end

    private

    def session_params
        params.require(:chef).permit(:username, :password)
    end

end