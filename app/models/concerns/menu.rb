module Menu
	extend ActiveSupport::Concern

	module ClassMethods
		def last_week(menu_params)
			results = self.where(nil)
			menu_params.each do |key, value|
				results = results.public_send(key, value) if value.present?
			end
			results
		end
	end
end