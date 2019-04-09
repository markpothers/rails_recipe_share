class LikesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        Like.all
    end

    def new
        @like = Like.new
    end

    def create
        if @like.save
            redirect_to like_path(@like)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @like.save
            redirect_to like_path(@like)
        else
            render :edit
        end
    end

    def destroy
        @like.destroy
        redirect_to likes_path(likes)
    end

    private

    def define_current_like
        @like = Like.find(params[:id])
    end

    def like_params
        params.require(:like).permit(:user_id, :recipe_id)
    end

end
