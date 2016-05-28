class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
    

      t.timestamps null: false
   end
  end

  def down
    	drop_table :recipes
  end
end

