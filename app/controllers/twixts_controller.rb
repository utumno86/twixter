class TwixtsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @twixts = Twixt.all.page(params[:page])
  end

  def show
  end

  def new
    @twixt = current_user.twixt.build
  end

  def edit
  end

  def create
    @twixt = current_user.twixt.build(twixt_params)

    if @twixt.save
      redirect_to @twixt, notice: 'Twixt was successfully created.'
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
