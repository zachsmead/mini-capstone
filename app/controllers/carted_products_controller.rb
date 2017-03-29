class CartedProductsController < ApplicationController

	def create

		product_id = params[:product_id]
		quantity = params[:quantity]
		puts "*" * 100
		puts quantity
		puts "*" * 100

		@cart = CartedProduct.create(user_id: current_user.id, product_id: product_id, quantity: quantity, status: "carted")

		redirect_to "/checkout"
	end

	def index
		@carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

		if @carted_products == []
			flash[:danger] = "Your shopping cart is empty"
			redirect_to "/"
		end
	end

	def destroy
		@carted_product = CartedProduct.find_by(id: params[:id])
		@carted_product.update(status: "deleted")
		redirect_to "/checkout"
	end

end
