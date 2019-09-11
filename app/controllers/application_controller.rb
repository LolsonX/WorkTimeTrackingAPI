#TODO implement 422 unprocessable entity error add to json
class ApplicationController < ActionController::API

  def not_found
    render_error :not_found, 'Resource not found'
  end

  def render_error(code, resource)
    if resource.respond_to?(:errors)
      render json: {errors: resource.errors},
             status: code,
             key_transform: :lower_camel
    else
      render json: {errors: resource.to_s},
          status: code,
          key_transform: :lower_camel
    end
  end


  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      raise JWT::DecodeError if @decoded.nil?
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render_error :unauthorized, 'User not found'
    rescue JWT::DecodeError => e
      render_error :unauthorized, 'Invalid token'
    end
  end
end
