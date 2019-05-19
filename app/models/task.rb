class Task < ApplicationRecord
  belongs_to :modulu
  belongs_to :state
  belongs_to :user
end
