class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :question_id, only: [:show, :edit, :update, :destroy, :best_answer_reset]

  def index
    @questions = Question.order(created_at: "DESC").includes(:user)
  end

  def search
    @questions = Question.search(params[:keyword])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @question.comments.includes(:user)
  end

  def edit
    if current_user.id != @question.user.id
      redirect_to root_path
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @question.user.id
      @question.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def best_answer_reset
    @question.update_attribute(:best_answer_question_id, nil)
    @question.comments.each do |comment|
      comment.update_attribute(:best_answer_id, nil)
    end
    redirect_to question_path(@question.id)
  end

  private

  def question_params
    params.require(:question).permit(:text, :video).merge(user_id: current_user.id)
  end

  def question_id
    @question = Question.find(params[:id])
  end
end
