class SuppliersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authenticate_admin!, except: [:index, :show, :search]

	def index
		sort = params[:sort]
		order = params[:order]

		if sort && order
			@suppliers = Supplier.all.order(sort => order)
		else
			@suppliers = Supplier.all
		end
	end

	def show
		@supplier = Supplier.find_by(id: params[:id])

		if (@supplier.number_of_products == 0 || @supplier.number_of_products == nil)
			@product_list_title = "This supplier has no products right now."
		else
			@product_list_title = "Products from this supplier:"
		end
	end

	def new
	end

	def create
		@new_supplier = Supplier.create(name:params[:name], email:params[:email], phone:params[:phone])

		redirect_to "/suppliers"

		flash[:success] = "Supplier created!"
	end

	def edit
		@supplier = Supplier.find_by(id: params[:id])
	end

	def update
		@supplier = Supplier.find_by(id: params[:id])

		@supplier.update(
			name: params[:name],
			email: params[:email],
			phone: params[:phone],
			number_of_products: @supplier.products.length || 0
		)

		redirect_to "/suppliers/#{@supplier.id}"

		flash[:info] = "Supplier updated!"
	end

	def destroy
		@supplier = Supplier.find_by(id: params[:id])

		@supplier.destroy

		redirect_to "/suppliers"

		flash[:danger] = "Supplier deleted!"
	end

	def search
		search_term = params[:search_term]
		@suppliers = Supplier.where("name ILIKE ?", "%#{search_term}%")
		render :index
	end

end
