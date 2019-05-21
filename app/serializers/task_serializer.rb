class TaskSerializer < ActiveModel::Serializer
  attributes :id,
             :module,
             :state,
             :user,
             :title,
             :description,
             :estimation,
             :date_added,
             :date_modified
end
