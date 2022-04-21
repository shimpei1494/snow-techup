class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  validates :text, presence: true
end
