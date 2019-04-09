class ChefsController < ApplicationController

    skip_before_action :verify_authenticity_token
#    skip_before_action :authenticate, :only => [:new, :create]

    def index
        Chef.all
    end

    def new
        @chef = Chef.new
    end

    def create
        if chef_params[:password] == chef_params[:password_confirmation]
            @chef = Chef.create(chef_params)
            session[:chef_id] = @chef_id
            session[:username] = @chef.username
                if @chef.save
                    redirect_to chef_path(@chef)
                else
                    render :new
                end
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @chef.save
            redirect_to chef_path(@chef)
        else
            render :edit
        end
    end

    def destroy
        @chef.destroy
        redirect_to chefs_path(chefs)
    end

    private

    def define_current_chef
        @chef = Chef.find(params[:id])
    end

    def chef_params
        params.require(:chef).permit(:first_name, :last_name, :username, :password, :password_confirmation, :password_digest, :country)
    end

end
