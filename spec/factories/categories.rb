FactoryGirl.define do
  factory :category do

    sequence :title do |t|
      "Category#{t}"
    end
  end
end
