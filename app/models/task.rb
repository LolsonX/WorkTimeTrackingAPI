class Task < ApplicationRecord
  belongs_to :modulu
  has_one :state
  belongs_to :user
end
