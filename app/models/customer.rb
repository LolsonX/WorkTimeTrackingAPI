class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address, :city, :post_code, :phone, :country
  validates :email,
            format: {with: /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/},
            presence: true

end
