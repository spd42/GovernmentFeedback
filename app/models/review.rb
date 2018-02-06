class Review < ActiveRecord::Base
	belongs_to :department
	belongs_to :usr
end
