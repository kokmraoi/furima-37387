FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    lastname              { 'あべ' }
    firstname             { 'たろう' }
    lastname_kata         { 'アベ' }
    firstname_kata        { 'タロウ' }
    birthday              { '2000-12-31' }
  end
end
