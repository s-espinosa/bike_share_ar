require 'rails_helper'

describe "relationships" do
  it "can find all the trips with a given start date" do
    day_1 = Day.create(date: "2017/01/01")
    day_2 = Day.create(date: "2017/01/02")
    create_list(:trip, 2, start_date: day_1)
    create(:trip, start_date: day_2)

    expect(day_1.started_trips.count).to eq(2)
  end

  it "can find dry days and wet days" do
    dry_1 = create(:condition, precipitation: 0)
    dry_2 = create(:condition, precipitation: 0)
    wet_1 = create(:condition, precipitation: 4)

    expect(Day.dry_days).to match_array([dry_1.day, dry_2.day])
    expect(Day.wet_days).to match_array([wet_1.day])
  end

  it "can find all trips that started on days with no rain and with rain" do
    dry_1 = create(:condition, precipitation: 0)
    dry_2 = create(:condition, precipitation: 0)
    wet_1 = create(:condition, precipitation: 4)
    dry_trips = create_list(:trip, 2, start_date: dry_1.day)
    dry_trips << create(:trip, start_date: dry_2.day)
    wet_trips = create_list(:trip, 2, start_date: wet_1.day)

    expect(Trip.dry_trips).to match_array(dry_trips)
    expect(Trip.wet_trips).to match_array(wet_trips)
  end

  it "can calculate average mean humidity" do
    create(:condition, mean_humidity: 50)
    create(:condition, mean_humidity: 100)

    expect(Condition.average_mean_humidity).to eq(75)
  end

  it "can calculate average mean temperature" do
    create(:condition, mean_temperature: 50)
    create(:condition, mean_temperature: 60)

    expect(Condition.average_mean_temperature).to eq(55)
  end

  it "can identify the hottest conditions with a variable count" do
    create(:condition, max_temperature: 95)
    hot_2 = create(:condition, max_temperature: 105)
    create(:condition, max_temperature: 100)

    expected_1 = [hot_2]

    expect(Condition.hottest_conditions).to eq(expected_1)
  end

  it "can identify the days with the hottest conditions with a variable count" do
    create(:condition, max_temperature: 95)
    hot_2 = create(:condition, max_temperature: 105)
    hot_3 = create(:condition, max_temperature: 105)

    expected = [hot_2.day, hot_3.day]

    expect(Day.hottest_days).to eq(expected)
  end

  it "can find the trips taken on the hottest days" do
    hot_1 = create(:condition, max_temperature: 100)
    hot_2 = create(:condition, max_temperature: 100)
    cool  = create(:condition, max_temperature: 50)

    hot_trips = create_list(:trip, 2, start_date: hot_1.day)
    hot_trips << create(:trip, start_date: hot_2.day)
    create_list(:trip, 2, start_date: cool.day)

    expect(Trip.hottest_trips).to match_array(hot_trips)
  end

  it "can find conditions with higher than average humidity and lower than average humidity" do
    real_humid_1 = create(:condition, mean_humidity: 80)
    real_humid_2 = create(:condition, mean_humidity: 90)
    not_humid_1  = create(:condition, mean_humidity: 75)
    not_humid_2  = create(:condition, mean_humidity: 65)

    expect(Condition.greater_than_average_humidity).to match_array([real_humid_1, real_humid_2])
    expect(Condition.less_than_average_humidity).to match_array([not_humid_1, not_humid_2])
  end
end
