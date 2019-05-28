class WorkItem < ApplicationRecord
  belongs_to :task
  belongs_to :work_item
end
