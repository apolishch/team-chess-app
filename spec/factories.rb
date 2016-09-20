FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "testEmail#{n}@gmail.com"
    end
    password "aPassword"
    password_confirmation "aPassword"
  end

  factory :player do
    name "Foo"
    association :user
  end

  factory :game do
    game_title "Hello"
    association :player
    turn 1
  end

  factory :piece do
    association :game
    type "Pawn"
    color "white"
    is_captured false
    x_position 1
    y_position 7
  end
end



