class Product < ApplicationRecord

	belongs_to :supplier
	has_many :images
	has_many :orders

	def sale_message
		if price && price < 2
			return "Discount item!"
		else
			return "Everyday price!"
		end
	end

	def tax
		if price
			return price * 0.09
		end
	end

	def total
		if price && tax
			return price + tax
		end
	end

	def discount_style
		if price && price < 2
			return "discount"
		else
			return "everyday-price"
		end
	end

	def in_stock?
		if self.in_stock
			return "Yes"
		else
			return "Sorry, we're out right now!"
		end
	end

end
