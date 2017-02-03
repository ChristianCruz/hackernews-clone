class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  # Authenticate users before showing certain content
  before_filter :authenticate_user!, except: [:index, :show]

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def index
    @submissions = Submission.order(cached_votes_score: :desc).paginate(page: params[:page], per_page: 10)
    authorize @submissions
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def show
    @submission = Submission.find(params[:id])
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def new
    # @submission = current_user.submissions.build
    @submission = Submission.new
    authorize @submission
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def edit
    @submission = Submission.find(params[:id])
    authorize @submission
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def create
    # @submission = current_user.submissions.build(submission_params)
    @submission = Submission.new(params.require(:submission).permit(:title, :url))
    @submission.user = current_user
    authorize @submission
      if @submission.save
        flash[:notice] = "Submission was successfully created."
       redirect_to @submission
      else
        flash[:error] = "There was an error saving the post. Please try again."
       render :new
      end
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def update
    @submission = Submission.find(params[:id])
    authorize @submission
    if @submission.update_attributes(params.require(:submission).permit(:title, :url))
     flash[:notice] = "Submission was updated."
     redirect_to @submission
   else
     flash[:error] = "There was an error saving the submission. Please try again."
     render :edit
   end
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def destroy
    @submission = Submission.find(params[:id])
    authorize @submission

    if @submission.destroy
       flash[:notice] = "\"#{@submission.title}\" was deleted successfully."
       redirect_to submissions_path
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def upvote
    @submission = Submission.find(params[:id])

    @submission.upvote_by current_user
    redirect_to :back
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  def downvote
    @submission = Submission.find(params[:id])

    @submission.downvote_by current_user
    redirect_to :back
  end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :url)
    end
end
