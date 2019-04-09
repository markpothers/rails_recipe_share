class RecipesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path(recipes)
    end

    private

    def define_current_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :chef_id)
    end

end
