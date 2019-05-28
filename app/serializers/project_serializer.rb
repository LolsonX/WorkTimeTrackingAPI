class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :customer, :name, :implementation_date, :state, :date_added
  attribute :users
  attribute :customer
  attribute :state

  def customer
    CustomerSerializer.new object.customer
  end

  def state
    StateSerializer.new object.state
  end
  def users
    object.user_projects.map do |up|
      UserSerializer.new up
    end
  end

end
