class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :best_answer_question_id, default: nil
      t.timestamps
    end
  end
end
