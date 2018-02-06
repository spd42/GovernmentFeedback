class Category < ActiveRecord::Base
	has_many :departments
	belongs_to :users
end
