Rails.application.routes.draw do
  resources :profiles, only: [:index, :show]

  resources :line_items do
  	put :replace_weekly_line_item
  	
  end
  resources :recipe_collection
  devise_for :users
  resources :recipes
  root "recipes#index"

end
