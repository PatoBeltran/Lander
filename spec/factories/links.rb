FactoryGirl.define do
  factory :link do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    team
    user
    channel
  end

end
