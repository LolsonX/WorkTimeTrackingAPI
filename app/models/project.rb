class Project < ApplicationRecord
  belongs_to :customer
  has_many :user_projects
  has_many :users, through: :user_projects
  belongs_to :state

  validates_presence_of :name, :date_added
end
