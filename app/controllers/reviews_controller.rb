class ReviewsController < ApplicationController
	before_action :find_department
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.department_id = @department.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to department_path(@department)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to department_path(@department)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to department_path(@department)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_department
			@department = Department.find(params[:department_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end
