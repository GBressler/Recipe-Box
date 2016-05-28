class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :recipe, index: true
      t.belongs_to :recipe_collection, index: true

      t.timestamps null: false
    end
  end
end
