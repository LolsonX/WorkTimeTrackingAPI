class CustomerSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :address,
             :city,
             :post_code,
             :country,
             :email,
             :phone
end
