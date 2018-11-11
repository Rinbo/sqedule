FactoryBot.define do
  factory :staff do
    name { "MyString" }
    primary_role { "myString" }
    employment_end { "2018-11-07" }
    shift_preference { 1 }
    roles { [] }
    user
  end
end
