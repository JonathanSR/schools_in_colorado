FactoryGirl.define do
  factory :program do
    sequence :cip2 do |n|
      "#{n}"
    end
    sequence :name do |n|
      "College#{n}"
    end
  end
end