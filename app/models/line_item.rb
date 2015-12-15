class LineItem < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :recipe_collection
end
