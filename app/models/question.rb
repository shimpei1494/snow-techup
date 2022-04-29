class Question < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_many :comments

  validates :text, presence: true
  validates :video, blob: { content_type: :video, size_range: 1..(15.megabytes) }

  def self.search(search)
    if search != ""
      Question.where('text LIKE(?)', "%#{search}%").order(created_at: "DESC").includes(:user)
    else
      Question.all.order(created_at: "DESC").includes(:user)
    end
  end
end
