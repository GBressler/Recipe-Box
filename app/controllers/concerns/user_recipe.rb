module UserRecipe
	extend ActiveSupport::Concern

		

	#private
		#def set_recipe_collection
			#@recipe_collection = RecipeCollection.find(session[:recipe_collection_id]) #recipe_collection_id
		#rescue ActiveRecord::RecordNotFound
			#@recipe_collection = RecipeCollection.create
			#session[:recipe_collection_id] = @recipe_collection.id
		#end
		private
		def set_recipe
			@recipe = Recipe.find(session[:recipe_id]) #recipe_collection_id
		rescue ActiveRecord::RecordNotFound
			@recipe = Recipe.create
			session[:recipe_id] = @recipe.id
		end
		
end