class State < ApplicationRecord
  has_many :tasks
  has_many :projects
end
