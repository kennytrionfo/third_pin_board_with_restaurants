class DishesController < ApplicationController
	before_action :find_dish, only: [:show, :edit, :update, :destroy]

	def index
		@dishes = Dish.all.order("created_at DESC")
	end

	def new
		@dish = restaurant.dishes.build  #can't figure out how to build a new dish
	end

	def create
		@dish = current_restaurant.dish.build(dish_params)
		if @dish.save
			redirect_to @dish, notice: "Successfully created new Dish"
		else
			render 'new'
		end
	end

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

	def dish_params
		params.require(:dish).permit(:name, :description, :yumyuck)
	end

	def find_dish
		@dish = Dish.find(params[:id])
	end

end
