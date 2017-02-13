class ChangeLineItemLastEaten < ActiveRecord::Migration
  def up
  	change_column("line_items", "last_eaten", :date)
  end

  def down
  	change_column("line_items", "last_eaten", :datetime)
  end
end
