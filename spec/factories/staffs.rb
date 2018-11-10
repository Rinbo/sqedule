FactoryBot.define do
  factory :staff do
    name { "MyString" }
    cleaning { false }
    employment_end { "2018-11-07" }
    shift_preference { 1 }
    user
  end
end
