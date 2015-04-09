class DishesController < ApplicationController
	before_action :find_dish, only: [:show, :edit, :update, :destroy]

	def index
		@dishes = Dish.all.order("created_at DESC")
	end

	def new
		@dish = @restaurant.dishes.create  #can't figure out how to build a new dish
	end

	def create
		@dish = @restaurant.dishes.create(dish_params)
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

#————from fit right————Kenny Trionfo Apr 8,2015————
	before_action :set_todo_list

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list 
	end


	private

	def set_todo_list 
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end

end
