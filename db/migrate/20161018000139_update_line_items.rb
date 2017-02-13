class UpdateLineItems < ActiveRecord::Migration
  def up
  	add_column("line_items", "user_id", :integer)
  	add_index("line_items", "user_id")
  end

  def down
  	remove_index("line_items", "user_id")
  	remove_column("line_items", "user_id")
  end
end
