class AddUserToWorkItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_items, :user, index: true
  end
end
