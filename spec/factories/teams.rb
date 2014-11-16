FactoryGirl.define do
  factory :team do
    name "Icalia Labs"
    sequence(:subdomain) { |index| "icalialabs#{index}" }

    factory :team_with_user_attributes do
      users_attributes {
        {
          "0" => {
            email: Faker::Internet.email,
            password: "12345678",
            password_confirmation: "12345678"
          }
        }
      }
    end
  end

end
