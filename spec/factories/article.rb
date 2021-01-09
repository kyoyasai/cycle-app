FactoryBot.define do
  factory :article do
    title            {"目的地"}
    prefecture_id    {Faker::Number.within(range: 2..48)}
    distance         {Faker::Number.within(range: 10..500)}
    content          {Faker::Lorem.sentence}
    association      :user
  end
end