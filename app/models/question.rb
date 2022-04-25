class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :questions

  validates :text, presence: true
  validates :video, blob: { content_type: :video, size_range: 1..(15.megabytes) }
end
