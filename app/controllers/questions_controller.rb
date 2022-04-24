class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :question_id, only: [:show]

  def index
    @questions = Question.order(created_at: "DESC").includes(:user)
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
  end

  private

  def question_params
    params.require(:question).permit(:text, :video).merge(user_id: current_user.id)
  end

  def question_id
    @question = Question.find(params[:id])
  end
end
