class WorkItemController < ApplicationController
  before_action :get_work_item, except: [:index, :create]

  def index
    @work_items = WorkItem.all
    render json: @work_items,
           status: :ok,
           key_transform: :lower_camel
  end

  def create
    @work_item = WorkItem.new
    @work_item.start_time = work_item_params[:startTime]
    @work_item.end_time = work_item_params[:endTime]
    @work_item.description = work_item_params[:description]
    @work_item.task_id = work_item_params[:taskId]
    if @work_item.save
      render json:@work_item,
             status: :ok,
             key_transform: :lower_camel
    else
      render json: {errors: "Unprocessable entity"},
             status: :unprocessable_entity,
             key_transform: :lower_camel
    end
  end

  def update
    @work_item.start_time = work_item_params[:startTime] unless work_item_params[:startTime].nil?
    @work_item.end_time = work_item_params[:endTime] unless work_item_params[:endTime].nil?
    @work_item.description = work_item_params[:description] unless work_item_params[:description].nil?
    @work_item.task_id = work_item_params[:taskId] unless work_item_params[:task_id].nil?
    if @work_item.save
      render json:@work_item,
             status: :ok,
             key_transform: :lower_camel
    else
      render json: {errors: "Unprocessable entity"},
             status: :unprocessable_entity,
             key_transform: :lower_camel
    end
  end

  def destroy
    if @work_item.destroy
      render json:@work_item,
             status: :ok,
             key_transform: :lower_camel
    else
      render json: {errors: "Unprocessable entity"},
             status: :unprocessable_entity,
             key_transform: :lower_camel
    end
  end

  private

  def get_work_item
    @work_item = WorkItem.find_by id: work_item_params[:id]
    not_found if @work_item.nil?
  end

  def work_item_params
    params.permit :id, :startTime, :endTime, :description, :taskId
  end
end
