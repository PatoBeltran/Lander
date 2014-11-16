FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    auth_token { SecureRandom.base64(100) }

    factory :creator do
    end
  end

end
