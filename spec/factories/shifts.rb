FactoryBot.define do
  factory :shift do
    date { "2018-11-06" }
    pattern { nil }
    cleaning { false }
    staff_req { 1 }
  end
end
