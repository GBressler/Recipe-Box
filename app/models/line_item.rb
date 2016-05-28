class LineItem < ActiveRecord::Base
  
  belongs_to :recipe
  belongs_to :recipe_collection

  
  scope :last_week, lambda { |date = Date.today| where("line_items.last_eaten >= ?", date)}
  #scope :last_week, lambda {where("line_items.last_eaten >= ?", 8.days.ago.to_date)}
  scope :two_weeks_ago, lambda {where("line_items.last_eaten >= ? AND line_items.last_eaten <= ?", 14.days.ago.to_date, 7.days.ago.to_date)}
  #scope :two_weeks_ago, lambda {where("line_items.last_eaten > ?", 15.days.ago.to_date)}
  #nope scope :two_weeks_ago, lambda {where("line_items.last_eaten BETWEEN ? AND ?", 15.days.ago.to_date, 21.days.ago.to_date)}
  #scope :three_weeks_ago, lambda {where("line_items.last_eaten > ?", 22.days.ago.to_date)}
  scope :three_weeks_ago, lambda {where("line_items.last_eaten >= ? AND line_items.last_eaten <= ?", 22.days.ago.to_date, 15.days.ago.to_date)}
  #scope :activeAtDate, lambda{ |date = Date.today| where("? BETWEEN line_items.last_eaten AND 1.week.ago", date) }
  #scope :last_week, lambda { |weeks| where("last_eaten > ?", weeks) }
  #scope :three_weeks, lambda { where( @line_item.last_eaten < 21.days.ago.to_date) }
  #@line_item = LineItem.where(last_eaten: params[:last_eaten]) -- returns nil
  #@line_item = LineItem.where(last_eaten: params[:last_eaten] < 21.days.ago.to_date)
#LineItem.limit(5).order("RAND()").where(last_eaten: params[:last_eaten] > 21.days.ago.to_date)
  #def menu
  #	list = []
  #	if LineItem.last_eaten.day.to_i > 21.days.ago.day.to_i
  #		LineItem.last_eaten.each do |recipe_id|
  #			LineItem.recipe_id  << list
  #		end
  #	end
  #	list
  #end

end
