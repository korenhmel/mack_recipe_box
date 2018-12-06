class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipies = Recipe.all.order("create_at DESC")
  end

   def show
   end

   def new
    @recipe = Recipe.new
   end

   def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      render 'new'
    end
   end

   def destroy
   end

   private
   def set_recipe
    @recipe = Recipe.find(params[:id])
   end

   def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id)
   end

end
