# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    time1 { Random.rand * 1000 }
    time2 { Random.rand * 1000 }
    time3 { Random.rand * 1000 }
    time4 { Random.rand * 1000 }
    time5 { Random.rand * 1000 }
  end
end
