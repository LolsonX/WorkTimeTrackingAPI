class CreateModulus < ActiveRecord::Migration[5.2]
  def change
    create_table :modulus do |t|
      t.string :name
      t.date :implementation_date
      t.references :project, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
