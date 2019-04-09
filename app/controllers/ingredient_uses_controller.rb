class IngredientUsesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
    end

    def new
        @ingredient_use = Ingredient_use.new
    end

    def create
        if @ingredient_use.save
            redirect_to ingredient_use_path(@ingredient_use)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @ingredient_use.save
            redirect_to ingredient_use_path(@ingredient_use)
        else
            render :edit
        end
    end

    def destroy
        @ingredient_use.destroy
        redirect_to ingredient_uses_path(ingredient_uses)
    end

    private

    def define_current_ingredient_use
        @ingredient_use = Ingredient_use.find(params[:id])
    end

    def ingredient_use_params
        params.require(:ingredient_use).permit(:recipe_id, :ingredient_id, :quantity, :unit)
    end

end
