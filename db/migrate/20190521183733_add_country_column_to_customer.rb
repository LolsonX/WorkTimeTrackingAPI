class AddCountryColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :country, :string
  end
end
