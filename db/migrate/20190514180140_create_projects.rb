class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :implementation_date
      t.date :date_added
      t.references :customer, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
