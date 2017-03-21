class SuppliersController < ApplicationController

	def index
		@suppliers = Supplier.all
	end

	def show
		@supplier = Supplier.find_by(id: params[:id])
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
			phone: params[:phone]
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
