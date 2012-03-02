FactoryGirl.define do
  factory :competition do
    name     { Faker::Lorem.sentence }
    city     { Faker::Address.city }
    address  { Faker::Address.street_address }
    start_on { 30.days.ago.to_date + rand(60).days }
    end_on   { start_on + rand(3).days }

    has_category_333    { true }
    has_category_444    { rand < 0.8 }
    has_category_555    { rand < 0.7 }
    has_category_222    { rand < 0.8 }
    has_category_333bf  { rand < 0.5 }
    has_category_333oh  { rand < 0.7 }
    has_category_333fm  { rand < 0.5 }
    has_category_333ft  { rand < 0.2 }
    has_category_minx   { rand < 0.5 }
    has_category_pyram  { rand < 0.7 }
    has_category_sq1    { rand < 0.6 }
    has_category_clock  { rand < 0.6 }
    has_category_666    { rand < 0.4 }
    has_category_777    { rand < 0.3 }
    has_category_magic  { rand < 0.8 }
    has_category_mmagic { rand < 0.6 }
    has_category_444bf  { rand < 0.2 }
    has_category_555bf  { rand < 0.1 }
    has_category_333mbf { rand < 0.5 }
  end
end
