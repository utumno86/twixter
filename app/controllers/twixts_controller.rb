class TwixtsController < ApplicationController
  before_action :set_twixt, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @twixts = Twixt.order(created_at: :desc).page(params[:page])
  end

  def show
    @twixts = Twixt.all
    @comment = Comment.new
  end

  def new
    @twixt = current_user.twixts.build
  end

  def edit
  end

  def create
    @twixt = current_user.twixts.new(twixt_params)

    if @twixt.save
      redirect_to twixts_path, notice: 'Twixt was successfully created.'
    else
      render :new
    end
  end

  def update
    if @twixt.update(twixt_params)
      redirect_to @twixt, notice: 'Twixt was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @twixt.destroy
    redirect_to twixts_url, notice: 'Twixt was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_twixt
    @twixt = Twixt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def twixt_params
    params.require(:twixt).permit(:content)
  end
  
end
