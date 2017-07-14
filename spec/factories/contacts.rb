FactoryGirl.define do
  factory :contact do
    name "MyString"
    title "MyString"
    sequence :email do |t|
       "MyString#{t}"
     end
    company nil
  end
end
