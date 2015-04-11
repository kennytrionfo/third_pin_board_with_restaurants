class DishesController < ApplicationController
	before_action :find_dish, only: [:show, :edit, :update, :destroy]
	before_action :set_restaurant #from fit_right

	def index
		@dishes = Dish.all.order("created_at DESC")
	end
 
	def new
		@dish = @restaurant.dishes.create  
	end

def create #from fit_right
	@dish = @restaurant.dishes.create(dish_params)
	redirect_to @restaurant 
end
	# def create
	# 	@dish = @restaurant.dishes.create(dish_params)
	# 	if @dish.save
	# 		redirect_to @dish, notice: "Successfully created new Dish"
	# 	else
	# 		render 'new'
	# 	end
	# end

	def show		
	end

	def edit
	end
	
	def update
		if @dish.update(dish_params)
			redirect_to @dish, notice: "Dish was Successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@dish.destroy
	  	redirect_to dishes_path
	end

private
	def set_restaurant  # from fit_right
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def dish_params  # from fit_right
		params[:dish].permit(:name, :description, :yumyuck)
	end
	# def dish_params
	# 	params.require(:dish).permit(:name, :description, :yumyuck)
	# end

	def find_dish
		@dish = Dish.find(params[:id])
	end


end
