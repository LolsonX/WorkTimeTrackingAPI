class WorkItem < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates_presence_of :start_time, :end_time, :description
end
