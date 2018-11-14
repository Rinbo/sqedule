FactoryBot.define do
  factory :pattern do
    shift_start { "2018-11-06 14:59:27" }
    shift_end { "2018-11-06 16:59:27" }
    break_length { "2018-11-06 00:15:00" }
    primary_role { "myString" }
    user
  end
end
