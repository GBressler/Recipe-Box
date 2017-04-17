class RecipesController < ApplicationController

	before_action :find_recipe, only: [:show, :edit, :update, :destroy, :favorite]
	before_action :authenticate_user!, except: [:index, :show]
	#before_destroy :ensure_not_referenced_by_any_line_item


	def index
		@recipe = Recipe.all
	end

	def show
		
	end

	def new
		@recipe = current_user.recipes.build
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		
		if @recipe.save
			redirect_to @recipe, notice: "Successfully created new recipe!"
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
				render 'edit'
			end
		end

		def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @recipe
      redirect_to :back, notice: 'You favorited #{@recipe.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@recipe)
      redirect_to :back, notice: 'Unfavorited #{@recipe.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


		def destroy
			@recipe.destroy
			redirect_to root_path, notice: "Successfully deleted recipe."
		end

	private
	def recipe_params
		params.require(:recipe).permit( :title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end

end
