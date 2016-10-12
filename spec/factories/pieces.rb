FactoryGirl.define do
  factory :king, class: King do
    is_captured false
  end

  factory :queen, class: Queen do
    is_captured false
  end

  factory :rook, class: Rook do
    is_captured false
  end

  factory :bishop, class: Bishop do
    is_captured false
  end

  factory :knight, class: Knight do
    is_captured false
  end

  factory :pawn, class: Pawn do
    is_captured false
  end
end
