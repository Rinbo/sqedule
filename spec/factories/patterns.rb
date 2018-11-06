FactoryBot.define do
  factory :pattern do
    shift_start { "2018-11-06 14:59:27" }
    shift_length { 1 }
    break_length { 1 }
    cleaning { false }
    schedule { nil }
  end
end
