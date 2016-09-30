require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      'testEmail#{n}@gmail.com'
    end
    password 'aPassword'
    password_confirmation 'aPassword'
  end

  factory :player do
    sequence :name do |n|
      'Foo#{n}'
    end
    association :user
  end

  factory :game do
    sequence :game_title do |n|
      'Foo#{n}'
    end
    association :player
    turn 1
  end

  factory :piece do
    association :game
    type 'pawn'
    color 'white'
    is_captured false
    x_position 1
    y_position 7
  end
end
