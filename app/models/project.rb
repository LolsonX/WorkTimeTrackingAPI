class Project < ApplicationRecord
  belongs_to :customer
  has_many :user_projects
  has_many :users, through: :user_projects
  has_one :state
end
