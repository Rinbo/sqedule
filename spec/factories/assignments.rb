FactoryBot.define do
  factory :assignment do
    staff
    locked_shift_id { false }
    off { false }
    shift { "MyString" }
  end
end
