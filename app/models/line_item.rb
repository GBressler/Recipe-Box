class LineItem < ActiveRecord::Base
  belongs_to :user #remove?
  belongs_to :recipe
  

  #scope :this_week, lambda {where }
  
  #scope :last_week, lambda { |date = Date.today| where("line_items.last_eaten >= ?", date)}
  scope :last_week, lambda {where("line_items.last_eaten >= ?", 8.days.ago.to_date)}
  
  #scope :two_weeks_ago, lambda {where("line_items.last_eaten >= ? AND line_items.last_eaten <= ?", 14.days.ago.to_date, 7.days.ago.to_date)}
 
  scope :three_weeks_ago, lambda {where("line_items.last_eaten >= ? AND line_items.last_eaten <= ?", 22.days.ago.to_date, 15.days.ago.to_date)}
  
 
  
  def self.two_weeks_ago
    where("line_items.last_eaten >= ? AND line_items.last_eaten <= ?", 14.days.ago.to_date, 7.days.ago.to_date)
  end

  def self.this_week
    LineItem.order("RANDOM()").limit(3).to_a
  end
  

end
