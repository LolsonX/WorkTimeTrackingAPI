class Modulu < ApplicationRecord
  belongs_to :project
  belongs_to :state
  has_many :tasks
end
