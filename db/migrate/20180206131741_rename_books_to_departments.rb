class RenameBooksToDepartments < ActiveRecord::Migration
  def change
    rename_table :books, :departments
  end
end
