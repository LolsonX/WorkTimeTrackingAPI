class TaskSerializer < ActiveModel::Serializer
  attributes :id,
             :modulu,
             :state,
             :title,
             :description,
             :estimation,
             :date_added,
             :date_modified

  attribute :user

  def user
    UserSerializer.new object.user
  end
end
