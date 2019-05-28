class TaskSerializer < ActiveModel::Serializer
  attributes :id,
             :modulu,
             :state,
             :user,
             :title,
             :description,
             :estimation,
             :date_added,
             :date_modified
end
