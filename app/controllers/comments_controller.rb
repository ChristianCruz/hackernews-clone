class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @submission, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def destroy
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to @submission
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to @submission
     end
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:submission_id, :body, :user_id)
    end
end
