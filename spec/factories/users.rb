FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_date            { Faker::Date.birthday }
    first_name            { person.first.kanji }
    family_name           { person.last.kanji }
    first_name_kana       { person.first.katakana }
    family_name_kana      { person.last.katakana }
  end
end
