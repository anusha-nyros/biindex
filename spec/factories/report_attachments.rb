# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report_attachment do
    image_attachment "MyString"
    report_id "MyString"
  end
end
