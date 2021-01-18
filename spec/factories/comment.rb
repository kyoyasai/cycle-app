FactoryBot.define do
  factory :comment do
    #message {Faker::Lorem.sentence}
    association :user
    association :article
  end
end