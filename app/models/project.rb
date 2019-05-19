class Project < ApplicationRecord
  belongs_to :customer
  belongs_to :state
end
