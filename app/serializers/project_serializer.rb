class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :customer, :name, :implementation_date, :state, :date_added
  attribute :users

  def users
    object.user_project.map do |up|
      UserSerializer.new up
    end
  end

end
