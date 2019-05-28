class Change < ActiveRecord::Migration[5.2]
  def change
    change_column :work_items, :start_time, :datetime

    change_column :work_items, :end_time, :datetime
  end
end
