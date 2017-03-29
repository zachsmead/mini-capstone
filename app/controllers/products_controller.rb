class ProductsController < ApplicationController
  before_action :authenticate_user!

	def index
		sort = params[:sort]
		order = params[:order]
		showing = params[:showing]
		@category = params[:category]

		if sort && order
			@products = Product.all.order(sort => order)
		elsif showing
			@products = Product.where("price < ?", 2.00)
		elsif @category
			@products = Category.find_by(id: category).products
		else
			@products = Product.all
		end

	end

	def new
	end



	def create

		@new_product = Product.create(
			name:params[:name], 
			price:params[:price], 
			description:params[:description], 
			stock:params[:stock], 
			supplier_id:params[:product][:supplier_id]
		)

		@product_image = Image.create(src: params[:src], product_id: @new_product.id)

		flash[:success] = "Product created!"

		redirect_to "/products/#{@new_product.id}"

	end



	def show
		product_id = params[:id]

		@categories = Category.all

		if product_id == "random"
			@product = Product.all.sample
		else
			@product = Product.find_by(id: product_id)
		end
	end



	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end



	def update
		@product = Product.find_by(id: params[:id])

		puts "*" * 100
		p "Product: "
		p @product
		p params
		puts "*" * 100
	
		@product.update(
			name: params[:name],
			price: params[:price],
			description: params[:description],
			stock: params[:stock] || 0,
		  supplier_id: params[:product][:supplier_id]
		)

		puts "*" * 100
		p "Product: "
		p @product
		p params
		puts "*" * 100

		@supplier = Supplier.find_by(id: params[:product][:supplier_id])

		puts "*" * 100
		p @supplier
		puts "*" * 100

		@supplier.update(
			number_of_products: @supplier.products.length
		)

		flash[:info] = "Product updated!"

		redirect_to "/products/#{@product.id}"

	end



	def destroy
		@product = Product.find_by(id: params[:id])

		@product.destroy

		redirect_to "/products"

		flash[:danger] = "Product deleted!"
	end

	def search
		search_term = params[:search_term]
		@products = Product.where("name ILIKE ?", "%#{search_term}%")
		render 'index.html.erb'
	end

end
