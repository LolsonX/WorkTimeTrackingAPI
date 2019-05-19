class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :estimation
      t.date :date_added
      t.date :date_modified
      t.references :modulu, foreign_key: true
      t.references :state, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
