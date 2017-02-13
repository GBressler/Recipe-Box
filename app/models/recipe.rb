class Recipe < ActiveRecord::Base
	has_many :line_items 
	before_destroy :ensure_not_referenced_by_any_line_item
  has_many :ingredients
  has_many :directions
 	has_many :users, :through => :line_items
 	#belongs_to :user

accepts_nested_attributes_for :ingredients, 
															reject_if: :all_blank, 
															allow_destroy: true
accepts_nested_attributes_for :directions, 
															reject_if: :all_blank, 
															allow_destroy: true
validates :title, :description, :image, presence:true
	has_attached_file :image, styles: { medium: "400x400#" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	private
		#ensure that there are no line items referencing this recipe
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line items present')
				return false
			end
		end
end
