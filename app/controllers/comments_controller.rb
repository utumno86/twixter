class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  

def create
  @twixt = Twixt.find(params[:twixt_id])
  @comment = @twixt.comments.create(comment_params)
 
  if @comment.save
    flash[:success] = 'Your comment was successfully added!'
    redirect_to root_url
  else
    render 'new'
  end
end

def destroy
  @twixt = Twixt.find(params[:twixt_id])
  @comment = @twixt.comments.find(params[:comment_id])
  @comment.destroy
    
    redirect_to :back, :notice => "Removed Comment."
end
 
private
 
  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
  
end
