class CustomerController < ApplicationController
  def index
    @customers = Customer.all
    render :json => @customers
  end
end
