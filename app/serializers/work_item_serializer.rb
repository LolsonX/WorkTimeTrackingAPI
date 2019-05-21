class WorkItemSerializer < ActiveModel::Serializer
  attributes :id,
             :task,
             :start_time,
             :end_time,
             :description
end
