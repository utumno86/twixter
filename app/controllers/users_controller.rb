class UsersController < ApplicationController
  
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
    @twixt = current_user.twixts.build if signed_in?
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

  def profile
    @user = User.find(params[:id])
    @twixts = Twixt.where(user_id: @user.id).order(created_at: :desc)
  end

  def following
    @title = "Following"
    @users = @user.followed_users.paginate(page: params[:page])
    render :show_follow
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render :show_follow
  end


private

  def user_params
    params.require(:user).permit(:name, :email_address, :avatar, :password, :password_confirmation)
  end

end
