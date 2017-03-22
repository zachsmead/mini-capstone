class ImagesController < ApplicationController
  before_action :authenticate_user!

	def new
		@product = Product.find_by(id: params[:id])
	end

	def create
		@product = Product.find_by(id: params[:id])

		puts "*" * 100
		p @product.inspect
		puts "*" * 100

		@image = Image.create(
			src:params[:src], 
			product_id:params[:id]
		)

		redirect_to "/products/#{params[:id]}"

		flash[:success] = "Image added!"
	end


end
