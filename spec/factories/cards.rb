FactoryGirl.define do
  factory :card do
    original_text "Test"
    translated_text "Тест"
    review_date "01.10.2015"
    check_count 1
  end
end
