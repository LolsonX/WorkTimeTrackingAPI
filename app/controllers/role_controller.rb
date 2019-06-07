class RoleController < ApplicationController
  before_action :authorize_request
  before_action :find_role, except: [:index, :create]
  def index
    @roles = Role.all
    render json:@roles,
           status: :ok,
           key_transform: :camel_lower
  end

  def create
    @role = Role.new role_params
    if @role.save
      render json:@role,
             status: :ok,
             key_transform: :camel_lower
    else
      render json:@role,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def destroy
    if @role.destroy
      render json:@role,
             status: :ok,
             key_transform: :camel_lower
    else
      render json:@role,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def update
    if @role.update role_params
      render json:@role,
             status: :ok,
             key_transform: :camel_lower
    else
      render json:@role,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def show
    render json:@role,
           status: :ok,
           key_transform: :camel_lower
  end

  private

  def find_role
    @role = Role.find_by id: role_params[:id]
    not_found if @role.nil?
  end
  def role_params
    params.permit :id, :name
  end
end
