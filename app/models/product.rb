class Product < ApplicationRecord

	def sale_message
		if price < 2
			return "Discount item!"
		else
			return "Everyday price!"
		end
	end

	def tax
		return price * 0.09
	end

	def total
		return price + tax
	end

	def discount_style
		if price < 2
			return "discount"
		else
			return "everyday-price"
		end
	end

end
