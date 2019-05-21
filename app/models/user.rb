class User < ApplicationRecord
  has_one :role
  has_many :user_projects
  has_many :users, through: :user_projects
end
