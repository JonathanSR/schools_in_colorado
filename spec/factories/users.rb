FactoryGirl.define do
  factory :user do
    sequence :provider do |n|
      "google#{n}"
    end
    sequence :uid do |n|
      "123#{n}"
    end
    sequence :name do |n|
      "Jonny#{n}"
    end
    sequence :oauth_token do |n|
      "ya29#{n}"
    end
    oauth_expires_at "2014-11-07T12:12:12.000Z"
    created_at "2014-11-07T12:12:12.000Z"
  end
end