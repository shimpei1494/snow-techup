class CommentsController < ApplicationController
  before_action :comment_id, only: [:edit, :update, :destroy]

  def create
    comment = Comment.create(comment_params)
    redirect_to question_path(comment.question.id)
  end

  def edit
    if current_user.id != @comment.user.id
      redirect_to root_path
    end
    @question = Question.find(@comment.question.id)
  end

  def update
    if comment = Comment.update(comment_params)
      redirect_to question_path(params[:question_id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @comment.user.id
      @comment.destroy
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end

  def comment_id
    @comment = Comment.find(params[:id])
  end
end
