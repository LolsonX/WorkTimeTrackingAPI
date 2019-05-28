class CustomerController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers,
           status: 200,
           key_transform: :camel_lower
  end

  def show
    @customer = Customer.find_by id: customer_params[:id]
    render json: @customer,
           status: :ok,
           key_transform: :camel_lower
  end

  def create
    @customer = Customer.new first_name: customer_params[:firstName],
                             last_name: customer_params[:lastName],
                             address: customer_params[:address],
                             city: customer_params[:city],
                             post_code: customer_params[:postCode],
                             email: customer_params[:email],
                             phone: customer_params[:phone],
                             country: customer_params[:country]
    if @customer.save
      render json: @customer,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: @customer,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end

    def update
      @customer = Customer.find_by id: customer_params[:id]
      update_attributes
      if @customer.save
        render json: @customer,
               status: :ok,
               key_transform: :camel_lower
      else
        render json: @customer,
               status: :unprocessable_entity,
               key_transform: :camel_lower
      end
    end
    if @customer.save
      render json: @customer,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: @customer,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end

  end
  private

  def customer_params
    params.permit :id,
                  :firstName,
                  :lastName,
                  :address,
                  :city,
                  :country,
                  :postCode,
                  :email,
                  :phone

  end

  def update_attributes
    @customer.first_name = customer_params[:firstName] unless customer_params[:firstName].nil?
    @customer.last_name = customer_params[:lastName] unless customer_params[:lastName].nil?
    @customer.address = customer_params[:address] unless customer_params[:address].nil?
    @customer.city = customer_params[:city] unless customer_params[:city].nil?
    @customer.post_code = customer_params[:postCode] unless customer_params[:postCode].nil?
    @customer.email = customer_params[:email] unless customer_params[:email].nil?
    @customer.phone = customer_params[:phone] unless customer_params[:phone].nil?
    @customer.country = customer_params[:country] unless customer_params[:country].nil?
  end
end
