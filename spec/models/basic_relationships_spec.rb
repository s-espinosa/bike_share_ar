require 'rails_helper'

describe 'Basic Relationships: ' do
  # Do not make any adjustments to these tests.
  # Work in the model files to make the following tests pass.
  # Try not to focus on the `eq` portion of the test.
  # Instead, use the description and the name of the method to guide you.
  describe "Class and scope methods" do
    # The names of the methods below do not follow best practices.
    # They're intended to give you some idea of how to implement.
    # Try to implement those methods that end in `class` with class methods.
    # Those that end in `scope` as scopes.
    it 'Use a class method to find all days with no precipitation' do
      expect(Condition.no_rain_class).to eq(Condition.where(precipitation: 0))
    end

    it "Use a scope to find all days with no precipitation" do
      expect(Condition.no_rain_scope).to eq(Condition.where(precipitation: 0))
    end

    it "Use a class method to find all the stations with dock counts of 15" do
      expect(Station.docks_of_15_class).to eq(Station.where(dock_count: 15))
    end

    it "Use a scope to find all the stations with dock counts of 15" do
      expect(Station.docks_of_15_class).to eq(Station.where(dock_count: 15))
    end

    it "Use a class method to find all the stations in Brooklyn" do
      brooklyn = City.find_by(name: "Brooklyn")
      expect(Station.brooklyn_class).to eq(Station.where(city: brooklyn))
    end

    it "Use a scope to find all the stations in Brooklyn" do
      brooklyn = City.find_by(name: "Brooklyn")
      expect(Station.brooklyn_scope).to eq(Station.where(city: brooklyn))
    end
  end

  describe "Class calculations on the model" do
    # For the tests below, add methods to your models based on what you see in the expectations.
    it "Calculates the average number of stations for all stations" do
      expect(Station.average_dock_count).to eq(Station.average(:dock_count))
    end

    it "Calculates the average duration of a trip" do
      expect(Trip.average_duration).to eq(Trip.average(:duration))
    end

  end

  describe "Instance calculations on the model" do
    # For the tests below, add methods to your models based on what you see in the expectations.
    # Note: you can use the class methods that you created above in these methods if you like.
    it "Calculates the average number of docks in a city" do
      brooklyn = City.find_by(name: "Brooklyn")
      houston  = City.find_by(name: "Houston")
      oakland  = City.find_by(name: "Oakland")

      expect(brooklyn.average_docks).to eq(brooklyn.stations.average_dock_count)
      expect(houston.average_docks).to eq(houston.stations.average_dock_count)
      expect(oakland.average_docks).to eq(oakland.stations.average_dock_count)
    end

    it "Calculates the average duration of a trip with a given subscription type" do
      subscriber = SubscriptionType.find_by(name: "Subscriber")
      customer   = SubscriptionType.find_by(name: "Customer")

      expect(subscriber.trip_duration).to eq(subscriber.trips.average_duration)
      expect(customer.trip_duration).to eq(customer.trips.average_duration)
    end

    it "Calculates the average duration of a trip started on a given day" do
      mar_15 = Day.find_by(date: Date.parse("2017/03/15"))
      mar_30 = Day.find_by(date: Date.parse("2017/03/30"))

      expect(mar_15.average_trip_duration).to eq(mar_15.trips.average_duration)
      expect(mar_30.average_trip_duration).to eq(mar_30.trips.average_duration)
    end

    it "Calculates the average duration of a trip started at a particular station" do
      station_1 = Station.all[0]
      station_2 = Station.all[1]

      expect(station_1.average_trip_duration).to eq(station_1.trips.average_duration)
      expect(station_2.average_trip_duration).to eq(station_2.trips.average_duration)
    end
  end
end

