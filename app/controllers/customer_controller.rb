class CustomerController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers,
           status: 200,
           key_transform: :camel_lower
  end
end
