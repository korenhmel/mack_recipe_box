class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipies = Recipe.all.order("created_at DESC")
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

   def edit
     
   end

   def update
     if @recipe.update(recipe_params)
      redirect_to @recipe
     else 
      render "new"
     end
   end

   def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Succesfully deleted recipe"
   end

   private
   def set_recipe
    @recipe = Recipe.find(params[:id])
   end

   def recipe_params
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes:[:id, :name, :_destroy], directions_attributes:[:id, :step, :_destroy])
   end

end
