class TaskController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: 200
  end

  def show
    show_user_tasks and return unless task_params[:user_id].nil?
    show_project_tasks and return unless task_params[:project_id].nil?
    show_module_tasks and return unless task_params[:module_id].nil?
    show_task and return unless task_path[:id].nil?
    not_found
  end

  def show_user_tasks
    @tasks = Task.where user_id: task_params[:user_id]
  end

  def show_project_tasks
    @tasks = Task.where project_id: task_params[:project_id]
  end

  def show_module_tasks
    @tasks = Task.where module_id: task_params[:module_id]
  end

  def show_task
    @tasks = Task.find_by id: task_params[:id]
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
