class AddAttachmentDepartmentImgToDepartments < ActiveRecord::Migration
  def self.up
    change_table :departments do |t|
      t.attachment :department_img
    end
  end

  def self.down
    remove_attachment :departments, :department_img
  end
end
