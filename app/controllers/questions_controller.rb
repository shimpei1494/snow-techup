class QuestionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def question_params
    params.require(:question).permit(:text, :video).merge(user_id: current_user.id)
  end
end
