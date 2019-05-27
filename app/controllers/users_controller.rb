class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index show_by_token]

  # GET /users
  def index
    @users = User.all
    render json: @users,
           status: :ok,
           key_transform: :camel_lower
  end

  # GET /users/{username}
  def show
    render json: @user,
           status: :ok,
           key_transform: :camel_lower
  end

  def show_by_token
    @user = User.find_by id: get_user_from_token["user_id"]
    render json: @user,
           status: :ok,
           key_transform: :camel_lower
  end
  # POST /users
  def create
    @user = User.new(username: user_params[:username],
                     first_name: user_params[:firstName],
                     last_name: user_params[:lastName],
                     password: user_params[:password],
                     password_confirmation: user_params[:passwordConfirmation],
                     email: user_params[:email],
                     role_id: user_params[:roleId],
                     phone: user_params[:phone],
                     photo_url: user_params[:photoUrl])
    if @user.save
      render json: @user,
             status: :created,
             key_transform: :camel_lower
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  # PUT /users/{username}
  def update
    if @user.update(username: user_params[:username],
                    first_name: user_params[:firstName],
                    last_name: user_params[:lastName],
                    password: user_params[:password],
                    role_id: user_params[:roleId],
                    phone: user_params[:phone],
                    photo_url: user_params[:photoUrl])

      render json: @user,
             status: :ok,
             key_transform: :camel_lower
    else

      render json: {errors: @user.errors.full_messages},
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  # DELETE /users/{username}
  def destroy
    if @user.destroy
    render json: @user,
           status: :ok,
           key_transform: :camel_lower
    else
      render json: @user,
             status: :unprocessable_entity,
             key_transform: :camel_lower
    end
  end

  private

  def find_user
    @user = User.find_by id: (user_params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' },
           status: :not_found,
           key_transform: :camel_lower
  end

  def user_params
    params.permit(
        :id,
        :firstName,
        :lastName,
        :username,
        :email,
        :password,
        :passwordConfirmation,
        :roleId,
        :phone,
        :photoUrl
    )
  end

  def get_user_from_token
    JsonWebToken.decode request.headers[:Authorization].split[1]
  end
end
