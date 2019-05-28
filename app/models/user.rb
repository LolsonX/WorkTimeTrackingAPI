class User < ApplicationRecord
  belongs_to :role
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks
  has_secure_password
end
