class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_action :authenticate_user!, except: [:index]

# GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

# GET /users/1
  def show
    @user = User.find(params[:id])
    @twixts = Twixt.where(user_id: @user.id).order(created_at: :desc)
  end

 # POST /users
  def create
    @user = User.new(params[:user])
 
    if @user.save
      redirect_to @user, notice: "Thank you for signing up for Twixter!"
    else
    render 'new'
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to @user
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :avatar, :password, :password_confirmation)
  end

end
