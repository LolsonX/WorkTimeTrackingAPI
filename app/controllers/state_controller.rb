class StateController < ApplicationController
  def index
    @states = State.all
    render json: @states, status: 200
  end
end
