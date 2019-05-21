class TaskController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks,
           status: 200,
           key_transform: :camel_lower
  end

  def show
    show_user_tasks and return unless task_params[:user_id].nil?
    show_project_tasks and return unless task_params[:project_id].nil?
    show_module_tasks and return unless task_params[:module_id].nil?
    show_task and return unless task_path[:id].nil?
    not_found
  end

  def show_user_tasks
    @task = Task.where user_id: task_params[:user_id]
    render json: @task,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def show_project_tasks
    @task = Task.where project_id: task_params[:project_id]
    render json: @task,
           status: :ok,
           key_transform: :camel_lower
    true
  end

  def show_module_tasks
    @task = Task.where module_id: task_params[:module_id]
    render json: @task,
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

  end

  def update

  end

  private

  def task_params
    params.permit :id, :user_id, :project_id, :module_id
  end
end
