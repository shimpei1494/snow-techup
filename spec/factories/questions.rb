FactoryBot.define do
  factory :question do
    text {'この技のここがわかりません。教えてください'}
    association :user

    after(:build) do |question|
      question.video.attach(io: File.open('public/videos/test_video.png'), filename: 'test_video.png')
    end
  end
end
