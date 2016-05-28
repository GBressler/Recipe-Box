class AddLastEatenDateToLineItems < ActiveRecord::Migration
  def up
  add_column :line_items, :last_eaten, :datetime
  add_foreign_key :recipe
  end

  def down
  	remove_column :line_items, :last_eaten
  end


end
