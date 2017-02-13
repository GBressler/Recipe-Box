class CreateRecipeCollections < ActiveRecord::Migration
  def up
    create_table :recipe_collections do |t|

      t.timestamps null: false
    end
  end
end
