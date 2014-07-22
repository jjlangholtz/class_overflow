FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Title #{n}" }
    content 'Content'
  end
end
