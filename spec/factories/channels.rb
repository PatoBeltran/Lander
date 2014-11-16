FactoryGirl.define do
  factory :channel do
    team
    name { Faker::Lorem.word }
    creator
  end

end
