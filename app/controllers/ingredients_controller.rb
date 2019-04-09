class IngredientsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        Ingredient.all
    end

    def new
        @ingredient = Iingredient.new
    end

    def create
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
        @ingredient.destroy
        redirect_to ingredients_path(ingredients)
    end

    private

    def define_current_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end
