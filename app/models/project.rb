class Project < ApplicationRecord
  belongs_to :customer
  has_one :state
end
