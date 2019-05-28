class ModuluController < ApplicationController
  before_action :get_modulu, except: [:index, :create]

  def index
    if modulu_params[:projectId].nil?
    @modulus = Modulu.all
    render json: @modulus,
           state: :ok,
           key_transform: :camel_lower
    else
      show_by_project
    end
  end

  def create
    @modulu = Modulu.new
    @modulu.name = modulu_params[:name]
    @modulu.implementation_date = modulu_params[:implementationDate]
    @modulu.project_id = modulu_params[:projectId]
    @modulu.state_id = modulu_params[:stateId]
    if @modulu.save
      render json: @modulu,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: "Unprocessable entity"}
    end
  end

  def update
    @modulu.name = modulu_params[:name] unless modulu_params[:name].nil?
    @modulu.implementation_date = modulu_params[:implementationDate] unless modulu_params[:implementationDate].nil?
    @modulu.project_id = modulu_params[:projectId] unless modulu_params[:projectId].nil?
    @modulu.state_id = modulu_params[:stateId] unless modulu_params[:stateId].nil?
    if @modulu.save
      render json: @modulu,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: "Unprocessable entity"}
    end

  end

  def destroy
    if @modulu.destroy
      render json: @modulu,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: "Unprocessable entity"}
    end
  end

  def show
    render json: @modulu,
           status: :ok,
           key_transform: :camel_lower
  end
  private

  def show_by_project
    @modulu = Modulu.where project_id: modulu_params[:projectId]
    not_found if @modulu.nil?
    render json: @modulu,
           status: :ok,
           key_transform: :camel_lower
  end
  def get_modulu
    @modulu = Modulu.find_by id: modulu_params[:id]
    not_found if @modulu.nil?
  end

  def modulu_params
    params.permit :id, :implementationDate, :projectId, :stateId, :name
  end
end
