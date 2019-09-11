class User < ApplicationRecord
  belongs_to :role
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks
  has_many :work_items
  has_secure_password
  validates :email,
            format: {with: /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/},
            presence: true,
            uniqueness: true

  validates :username,
            presence: true,
            uniqueness: true,
            length: {minimum: 5, maximum: 30}

  validates_presence_of :first_name, :last_name, :phone
end
