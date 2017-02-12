require 'rails_helper'

describe 'Calculations: ' do
  describe 'count' do
    it 'can count the number of records of a given table' do
      # Count can be used to count the number of records on a table.
      # In the example below, we call it directly on the model.
      create_list(:city, 3)
      expect(City.count).to eq(3)

      # To practice, change the expectation below so that this test will pass.
      create_list(:station, 4)
      expect(Station.count).to eq(4)
    end

    it 'can count records with a particular attribute' do
      denver   = City.create(name: "Denver")
      brooklyn = City.create(name: "Brooklyn")
      station_1, station_2, station_3 = create_list(:station, 3, city: denver)
      station_4, station_5, station_6 = create_list(:station, 2, city: brooklyn)

      # Count can also be chained onto other methods.
      # For example, if we wanted to see the number of stations in all of Denver,
      # we could chain a `.count` call onto a `.where` call.
      denver_station_count = Station.where(city: denver).count
      expect(denver_station_count).to eq(3)

      # Use `.count` to assign a value to the `brooklyn_station_count` below to make the test pass.
      brooklyn_station_count = Station.where(city: brooklyn).count
      expect(brooklyn_station_count).to eq(2)

      # With the following setup for practice exercises...
      oakland = City.create(name: "Oakland")
      station_7, station_8 = create_list(:station, 2, city: denver, dock_count: 50)
      station_9, station_10, station_11 = create_list(:station, 3, city: brooklyn, dock_count: 50)
      station_12, station_13, station_14, station_15, station_16 = create_list(:station, 5, city: oakland, dock_count: 45)

      # Use `.count` to assign values to the variables below to make this test pass.
      # Count of stations with 50 docks
      actual_1 = Station.where(dock_count: 50).count
      # Count of stations in Brookyn
      actual_2 = Station.where(city: brooklyn).count
      # Count of stations in Oakland
      actual_3 = Station.where(city: oakland).count
      # Count of stations in Denver
      actual_4 = Station.where(city: denver).count
      # Count of stations in Denver with 50 docks
      actual_5 = Station.where(city: denver, dock_count: 50).count
      # Count of stations with less than 40 docks
      actual_6 = Station.where('dock_count < 40').count

      # Do not change the expectations below.
      expected_1 = [station_7, station_8, station_9, station_10, station_11].count
      expected_2 = [station_4, station_5, station_6, station_9, station_10, station_11].count
      expected_3 = [station_12, station_13, station_14, station_15, station_16].count
      expected_4 = [station_1, station_2, station_3, station_7, station_8].count
      expected_5 = [station_7, station_8].count
      expected_6 = [station_1, station_2, station_3, station_4, station_5, station_6].count

      expect(actual_1).to eq(expected_1)
      expect(actual_2).to eq(expected_2)
      expect(actual_3).to eq(expected_3)
      expect(actual_4).to eq(expected_4)
      expect(actual_5).to eq(expected_5)
      expect(actual_6).to eq(expected_6)
    end
  end

  describe 'average' do
    # As you might expect, average finds the average of a set of values.
    # It takes an attribute as a parameter in order to determine what it will average.
    #
  end
end
