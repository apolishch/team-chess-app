FactoryGirl.define do 
    
    factory :user do 
       sequence :email do |n|
           "dummyEmail#{n}@gmail.com"
       end
       password "secretPassword"
       password_confirmation "secretPassword"
    
    end
    
    factory :player do
        name "Foo"
        association :player, factory: :user
    end 
    
    factory :game do 
        title "Hello"
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

FactoryGirl.factories.map(&:name).each do |factory_name|
      describe "The #{factory_name} factory" do
          it 'is valid' do
            build(factory_name).should be_valid
          end
      end      
end