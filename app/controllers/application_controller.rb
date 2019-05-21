class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      raise JWT::DecodeError if @decoded.nil?
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: "User not found" }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: "Invalid token" }, status: :unauthorized
    end
  end
end
