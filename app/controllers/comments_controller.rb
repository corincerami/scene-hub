class CommentsController < ApplicationController
  def create
    @show = Show.find(params[:show_id])
    @comment = @show.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment posted"
      redirect_to show_path(@show)
    else
      render show_path(@show)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
