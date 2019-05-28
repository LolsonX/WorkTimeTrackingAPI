class WorkItemSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :task,
             :start_time,
             :end_time,
             :description
end
