class ProjectController < ApplicationController
  before_action :authorize_request
  before_action :get_project, except: [:index, :create]
  def index
    @projects = Project.all
    render json: @projects,
           status: :ok,
           key_transform: :camel_lower
  end

  def show
    render json: @project,
           status: :ok,
           key_transform: :camel_lower
  end

  def update
    @project.name = project_params[:name]
    @project.implementation_date = project_params[:implementationDate] unless project_params[:implementationDate].nil?
    @project.date_added = project_params[:dateAdded] unless project_params[:dateAdded].nil?
    @project.customer_id = project_params[:customerId] unless project_params[:customerId].nil?
    @project.state_id = project_params[:stateId] unless project_params[:stateId].nil?
    if @project.save
      render json: @project,
             status: :ok,
             key_transform: :camel_lower
    else
      render_error :unprocessable_entity, @project
    end
  end

  def delete
    if @project.destroy
      render json: @project,
             status: :ok,
             key_transform: :camel_lower
    else
      render_error :unprocessable_entity, @project
    end
  end

  def create
    @project = Project.new name: project_params[:name],
                           implementation_date: project_params[:implementationDate],
                           date_added: project_params[:dateAdded],
                           customer_id: project_params[:customerId],
                           state_id: project_params[:stateId]

    if @project.save
      render json: @project,
             status: :ok,
             key_transform: :camel_lower
    else
      render_error :unprocessable_entity, @project
    end
  end

  private

  def get_project
    @project = Project.find_by id: project_params[:id]
    not_found if @project.nil?
  end
  def project_params
    params.permit :id, :name, :implementationDate, :customerId, :stateId, :dateAdded
  end
end
