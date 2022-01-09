class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_championship, only: [:new_championship, :destroy_championship]
  before_action :require_login
  skip_before_action :require_login, only: [:create]
  
  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  def championships
    @championships = current_user.championships
    render json: @championships, status: 200
  end
  
  def new_championship
    begin
      current_user.championships << @championship
      current_user.save!
      render status: 201
    rescue ActiveRecord::RecordNotUnique
      render json: {message: 'Conflict'}, status: 409
    end
  end

  def destroy_championship
    if current_user.championships.empty?
      render json: {message: "Empty list"}, status: 200
    else
      begin
        current_user.championships.find(@championship.id)
        current_user.championships.delete(@championship)
        current_user.save!
        render status: 200
      rescue ActiveRecord::RecordNotFound
        render status: 404
      end
    end
  end

  private
  def set_championship
      @championship = Championship.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
  
end