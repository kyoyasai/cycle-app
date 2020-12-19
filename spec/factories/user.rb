FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.email}
    password               {Faker::Internet.password}
    password_confirmation  {password}
    last_name              {"自転車"}
    first_name             {"太郎"}
  end
end