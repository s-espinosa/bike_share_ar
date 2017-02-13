require 'rails_helper'

describe "relationships" do
  it "can find all the trips with a given start date" do
    day = Day.first
    expect(day.started_trips.count).to eq(3)
  end

  it "can find dry days and wet days" do
    expect(Day.dry_days.count).to eq(4)
    expect(Day.wet_days.count).to eq(26)
  end

  it "can find all trips that started on days with no rain and with rain" do
    expect(Trip.dry_trips.count).to eq(12)
    expect(Trip.wet_trips.count).to eq(78)
  end

  it "can calculate average mean humidity" do
    expect(Condition.average_mean_humidity).to eq(65)
  end

  it "can calculate average mean temperature" do
    expect(Condition.average_mean_temperature).to eq(72.5)
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
    expect(Trip.hottest_trips.count).to eq(21)
  end

  it "can find conditions with higher than average humidity and lower than average humidity" do
    real_humid_1 = create(:condition, mean_humidity: 80)
    real_humid_2 = create(:condition, mean_humidity: 90)
    not_humid_1  = create(:condition, mean_humidity: 75)
    not_humid_2  = create(:condition, mean_humidity: 65)

    expect(Condition.greater_than_average_humidity.count).to eq(18)
    expect(Condition.less_than_average_humidity.count).to eq(21)
  end
end
