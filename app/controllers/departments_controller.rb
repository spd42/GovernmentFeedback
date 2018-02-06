class DepartmentsController < ApplicationController
	before_action :find_department, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:category].blank?
			@departments = Department.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@departments = Department.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		#if @department.reviews.blank?
		#	@average_review = 0
		#else
			#@average_review = @department.reviews.average(:rating).round(2)
		#end
	end

	def new
		@department = current_user.departments.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@department = current_user.departments.build(department_params)
		@department.category_id = params[:category_id]

		if @department.save
			redirect_to root_path
		else
			@categories = Category.all.map{ |c| [c.name, c.id] }
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@department.category_id = params[:category_id]
		if @department.update(department_params)
			redirect_to department_path(@department)
		else
			render 'edit'
		end
	end

	def destroy
		@department.destroy
		redirect_to root_path
	end

	private

		def department_params
			params.require(:department).permit(:title, :description, :author, :category_id, :department_img)
		end

		def find_department
			@department = Department.find(params[:id])
		end

end
