require 'faker'

FactoryGirl.define do
  factory :comment do |f|
    f.author { Faker::Name.name }
    f.body { Faker::Lorem.paragraph }

    trait :with_article do
      article { FactoryGirl.create(:article) }
    end
  end
end