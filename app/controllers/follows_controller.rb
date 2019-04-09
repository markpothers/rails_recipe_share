class FollowsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        Follow.all
    end

    def new
        @follow = Follow.new
    end

    def create
        if @follow.save
            redirect_to follow_path(@follow)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @follow.save
            redirect_to follow_path(@follow)
        else
            render :edit
        end
    end

    def destroy
        @follow.destroy
        redirect_to follows_path(follows)
    end

    private

    def define_current_chef
        @follow = Follow.find(params[:id])
    end

    def follow_params
        params.require(:follow).permit(:chef_id, :recipe_id)
    end

end
