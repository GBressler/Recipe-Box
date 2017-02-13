json.array!(@recipe_collections) do |recipe_collection|
  json.extract! recipe_collection, :id
  json.url ecipe_collections_url(recipe_collections, format: :json)
end
