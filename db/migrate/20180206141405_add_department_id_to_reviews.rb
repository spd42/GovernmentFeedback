class AddDepartmentIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :department_id, :integer
  end
end
