class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [ ]
	before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all.order("created_at DESC")
	end

	def new
		@restaurant = current_user.restaurants.build
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant, notice: "Successfully created new Restaurant"
		else
			render 'new'
		end
	end

	def show

	end

	def edit
		
	end

	def update
		if @restaurant.update(restaurant_params)
			redirect_to @restaurant, notice: "Restaurant was Successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant.destroy
	  	redirect_to root_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :yumyuck)
	end

	def find_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

end
