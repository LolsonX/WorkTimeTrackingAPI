class User < ApplicationRecord
  belongs_to :role
  has_many :user_projects
  has_many :users, through: :user_projects
  has_secure_password
end
