FactoryBot.define do
  factory :assignment do    
    locked_shift_id { false }
    off { false }
    shift { "MyString" }
    staff
  end
end
