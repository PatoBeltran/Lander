FactoryGirl.define do
  factory :team do
    name "Icalia Labs"
    sequence(:subdomain) { |index| "icalialabs#{index}" }
  end

end
