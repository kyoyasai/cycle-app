FactoryBot.define do
  factory :comment do
    message     {"あいうえお"}
    association :user
    association :article
  end
end
