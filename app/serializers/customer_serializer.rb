class CustomerSerializer < ActiveModel::Serializer

  attributes :id,
             :first_name,
             :last_name,
             :address,
             :city,
             :post_code,
             :country,
             :email,
             :phone
end
