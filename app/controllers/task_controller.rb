class TaskController < ApplicationController
  before_action :authorize_request

  def index
    show_user_tasks and return unless task_params[:userId].nil?
    show_project_tasks and return unless task_params[:projectId].nil?
    show_module_tasks and return unless task_params[:moduluId].nil?
    @tasks = Task.all
    render json: @tasks,
           status: 200,
           key_transform: :camel_lower
  end

  def show
    show_task and return unless task_params[:id].nil?
    not_found
  end

  def show_user_tasks
    @tasks = Task.where user_id: task_params[:userId]
    render json: @tasks,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def show_project_tasks
    @tasks = Modulu.where(project_id: task_params[:projectId]).tasks
    render json: @tasks,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def show_module_tasks
    @tasks = Task.where module_id: task_params[:moduleId]
    render json: @tasks,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def show_task
    @task = Task.find_by id: task_params[:id]
    render json: @task,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def create
    @task = Task.new title: task_params[:title],
                     description: task_params[:description],
                     estimation: task_params[:estimation],
                     date_added: task_params[:dateAdded],
                     date_modified: task_params[:dateModified],
                     user_id: task_params[:userId],
                     modulu_id: task_params[:moduluId],
                     state_id: task_params[:stateId]
    if @task.save
      render json: @task,
             status: :ok,
             key_transform: :camel_lower
    else
      render_error :unprocessable_entity, @task
    end
  end

  def update
    @task = Task.find_by id: task_params[:id]
    if @task.update title: task_params[:title],
                    description: task_params[:description],
                    date_modified: task_params[:dateModified],
                    modulu_id: task_params[:moduluId],
                    state_id: task_params[:stateId]

      render json: @task,
             status: :ok,
             key_transform: :camel_lower
    else
      render_error :unprocessable_entity, @task
    end

  end

  private

  def task_params
    params.permit :id,
                  :title,
                  :description,
                  :estimation,
                  :dateAdded,
                  :dateModified,
                  :userId,
                  :projectId,
                  :moduluId,
                  :stateId
  end
end
