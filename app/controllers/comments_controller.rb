class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  authorize_resource

  def new
    @comment = Comment.new
    @comment.task = Task.find(params[:task])
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.task = Task.find(comment_params[:task_id])

    if @comment.save
      redirect_to task_path(@comment.task)
    else
      flash[:alert] = "Comment couldn't be created"
      redirect_to new_comment_url(task: params[:task_id])
    end
  end

  def update
    @comment.update(comment_params)
    redirect_to task_path(@comment.task)
  end

  def destroy
    @comment.destroy
    redirect_to task_path(@comment.task)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end
