class Task < ApplicationRecord
  belongs_to :modulu
  belongs_to :state
  belongs_to :user

  validates_presence_of :estimation, :date_added
  validates :title, uniqueness: {scope: :modulu_id}, presence: true
end
