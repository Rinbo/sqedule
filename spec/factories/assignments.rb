FactoryBot.define do
  factory :assignment do
    staff { nil }
    locked_shift_id { false }
    off { false }
    shift { nil }
  end
end
