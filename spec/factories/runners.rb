FactoryGirl.define do
  factory :runner do
    email 'frank@example.com'
    password 'shorter'
    password_confirmation 'shorter'
  end
end
