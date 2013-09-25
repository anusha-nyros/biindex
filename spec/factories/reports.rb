# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    report_name "MyString"
    category "MyString"
    department "MyString"
    system "MyString"
    owner "MyString"
    last_updated "2013-08-12"
    user_id 1
    organization_id 1
  end
end
