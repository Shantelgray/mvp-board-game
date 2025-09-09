FactoryBot.define do
  factory :score do
    points { 50 }
    round_number { 1 }
    association :user
    association :game
  end
end
