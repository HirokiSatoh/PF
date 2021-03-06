class CounselCommentsController < ApplicationController
  def create
    @counsel = Counsel.find(params[:counsel_id])
    @counsel_comment = @counsel.counsel_comments.build(counsel_comment_params)
    @counsel_comment.user_id = current_user.id
      if @counsel_comment.save
        redirect_back(fallback_location: root_path)
        flash[:success] = "コメントが投稿されました"
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @counsel_comment = CounselComment.find(params[:counsel_id])
    if @counsel_comment.user != current_user
      redirect_to request.referer
    end
    @counsel_comment.destroy
    redirect_to request.referer
  end

  private
  def counsel_comment_params
    params.require(:counsel_comment).permit(:comment,:user_id,:counsel_id,:parent_id)
  end
end
