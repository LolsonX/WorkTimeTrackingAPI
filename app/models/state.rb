class State < ApplicationRecord
  has_many :tasks
  has_many :projects

  validates :name, presence: true, uniqueness: true

end
