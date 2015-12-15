Rails.application.routes.draw do
  resources :line_items
  resources :recipe_collection
  devise_for :users
  resources :recipes
  root "recipes#index"
end
