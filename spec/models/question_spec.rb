require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.build(:question)
  end

  describe 'チャットルーム作成' do
    context '投稿できる場合' do
      it "全ての入力が正しくされていれば作成できる" do
        expect(@question).to be_valid
      end
    end
    context '投稿できない場合' do
      it "textが空では作成できない" do
        @question.text = ''
        @question.valid?
        expect(@question.errors.full_messages).to include("テキストを入力してください")
      end
    end
  end
end
