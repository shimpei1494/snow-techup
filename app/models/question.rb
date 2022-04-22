class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  validates :text, presence: true
  validates :video, attached_file_size: { maximum: 15.megabytes }
end
