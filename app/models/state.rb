class State < ApplicationRecord
  has_many :tasks
  has_many :states
  has_many :projects
end
