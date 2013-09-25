# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report_note do
    notes "MyText"
    report_id 1
  end
end
