class CreateWorkItems < ActiveRecord::Migration[5.2]
  def change
    create_table :work_items do |t|
      t.date :start_time
      t.date :end_time
      t.text :description
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
