FactoryGirl.define do
  factory :city do
    sequence :name do |n|
      "City #{n}"
    end
  end

  factory :day do
    sequence :date do |n|
      if n < 10
        "200#{n}/01/01"
      else
        "20#{n}/01/01"
      end
    end
  end

  factory :subscription_type do
    sequence :name do |n|
      ["Subscriber", "Customer"][(n % 2)]
    end
  end

  factory :station do
    sequence :name do |n|
      "Station #{n}"
    end
    sequence :dock_count do |n|
      n + 5
    end
    city
    installation_date "2015/01/01"
  end

  factory :trip do
    duration "60"
    association :start_date, factory: :day
    association :end_date, factory: :day
    association :start_station, factory: :station
    association :end_station, factory: :station
    bike_id 4
    subscription_type
    zip_code "02138"
  end

  factory :condition do
    day
    max_temperature 100
    min_temperature 30
    mean_temperature 65
    mean_humidity 50
    mean_visibility 5
    mean_wind_speed 12
    precipitation 0
  end
end
