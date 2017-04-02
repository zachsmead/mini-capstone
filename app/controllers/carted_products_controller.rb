class CartedProductsController < ApplicationController

	before_action :authenticate_user!

	def create

		product_id = params[:product_id]
		quantity = params[:quantity]

		@carted_product = CartedProduct.new(user_id: current_user.id, product_id: product_id, quantity: quantity, status: "carted")

		if @carted_product.save
			flash[:info] = "Product added to cart!"
			redirect_to "/checkout"
		else
			flash[:danger] = "The quantity must be greater than 0!"
			redirect_to "/products/#{product_id}"
		end

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
