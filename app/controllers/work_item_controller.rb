class WorkItemController < ApplicationController
  before_action :get_work_item, except: [:index, :create, :show_hours]

  def index
    @work_items = WorkItem.all
    render json: @work_items,
           status: :ok,
           key_transform: :camel_lower
  end

  def create
    @work_item = WorkItem.new
    @work_item.start_time = work_item_params[:startTime]
    @work_item.end_time = work_item_params[:endTime]
    @work_item.description = work_item_params[:description]
    @work_item.task_id = work_item_params[:taskId]
    @work_item.user_id = work_item_params[:userId]

    if @work_item.save
      render json:@work_item,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: 'Unprocessable entity'},
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def update
    @work_item.start_time = work_item_params[:startTime] unless work_item_params[:startTime].nil?
    @work_item.end_time = work_item_params[:endTime] unless work_item_params[:endTime].nil?
    @work_item.description = work_item_params[:description] unless work_item_params[:description].nil?
    @work_item.task_id = work_item_params[:taskId] unless work_item_params[:taskId].nil?
    @work_item.user_id = work_item_params[:userId] unless work_item_params[:userId].nil?
    if @work_item.save
      render json:@work_item,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: 'Unprocessable entity'},
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def destroy
    if @work_item.destroy
      render json:@work_item,
             status: :ok,
             key_transform: :camel_lower
    else
      render json: {errors: 'Unprocessable entity'},
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  def show
    render json:@work_item,
           status: :ok,
           key_transform: :camel_lower
  end

  def show_hours
    month = work_item_params[:month].to_i
    year = work_item_params[:year].to_i

    render json: {'monthlyHours': calculate_hours(year, month)},
           status: :ok

  end
  private

  def get_work_item
    @work_item = WorkItem.find_by id: work_item_params[:id]
    not_found if @work_item.nil?
  end

  def work_item_params
    params.permit :id, :startTime, :endTime, :description, :taskId, :userId, :year, :month
  end

  def calculate_hours(year, month)
    last_day_of_month = days_in_month year, month
    @work_items = WorkItem.where created_at: Date.new(year, month, 1)..Date.new(year, month, last_day_of_month),
                                 user_id: work_item_params[:userId]
    hours_per_day = Array.new(last_day_of_month, 0)
    @work_items.map do |item|
      pos = item.created_at.mday - 1
      hours_per_day[pos] = item.end_time.hour - item.start_time.hour
    end
    hours_per_day
end
  def days_in_month(year, month)
    common = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return 29 if month == 2 && Date.gregorian_leap?(year)
    common[month]
  end
end
