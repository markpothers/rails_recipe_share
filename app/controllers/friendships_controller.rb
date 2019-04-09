class FriendshipsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        Friendship.all
    end

    def new
        @friendship = Friendship.new
    end

    def create
        if @friendship.save
            redirect_to friendship_path(@friendship)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @friendship.save
            redirect_to friendship_path(@friendship)
        else
            render :edit
        end
    end

    def destroy
        @friendship.destroy
        redirect_to friendships_path(friendships)
    end

    private

    def define_current_friendship
        @friendship = Friendship.find(params[:id])
    end

    def friendship_params
        params.require(:friendship).permit(:requestor_id, :acceptor_id)
    end

end
