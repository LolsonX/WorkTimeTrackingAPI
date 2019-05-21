class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :phone,
             :photo_url

  attribute :role

  def role
    RoleSerializer.new object.role
  end
end
