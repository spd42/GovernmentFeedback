class Department < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :department_img, :styles => { :department_index => "250x350>", :department_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :department_img, :content_type => /\Aimage\/.*\Z/
end
