class CategoriesController < ApplicationController

def new
	@category = current_user.categories.build
end

def create
	@category = current_user.categories.build(category_params)

	if @category.save
		redirect_to root_path
	else
		render 'categories#new'
	end
end

def category_params
	params.require(:category).permit(:name)
end

end