class StateController < ApplicationController
  before_action :authorize_request
  def index
    @states = State.all
    render json: @states,
           status: 200,
           key_transform: :camel_lower
  end
end
