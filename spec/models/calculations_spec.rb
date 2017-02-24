require 'rails_helper'

describe 'Calculations: ' do
  before(:all) do
    # ActiveRecord has a number of methods to help you perform calculations.
    # It's important to note that, while other  these methods generally return numbers (e.g. integers, floats, big decimals).
    #
    # That means that these methods will often be the last method in any chain of methods that you ca

    ###############################################################################################################
    #################################################### COUNT ####################################################
    ###############################################################################################################




    ###### Section 1.1: `.count` ######


        # Count can be used to count the number of records on a table.

        # In the example below, we call `.count` directly on the City model.
        # This will give us the total count of all Cities in our database.
        @e11_1 = City.count

        # Practice by counting the total number of Stations, Conditions, and Trips.
        # binding.pry
        # Count of all stations.
        @a11_1 = nil
        # Count of all conditions.
        @a11_2 = nil
        # Count of all trips.
        @a11_3 = nil




    ###### Section 1.2: `.count` with a condition ######


        # Count can also be chained onto other methods.
        # For example, if we wanted to see the number of stations in all of Denver,
        # we could chain a `.count` call onto a `.where` call.
        denver = City.find_by(name: "Denver")
        @e12_1 = Station.where(city: denver).count

        # Use `.count` to assign values to the variables below to make this test pass.
        # The local variables below may help in one of the queries.
        houston  = City.find_by(name: "Houston")
        oakland  = City.find_by(name: "Oakland")
        brooklyn = City.find_by(name: "Brooklyn")


        # binding.pry
        # Count of stations with 20 docks
        @a12_1 = nil
        # Count of stations in Brookyn
        @a12_2 = nil
        # Count of stations in Oakland
        @a12_3 = nil
        # Count of stations in Houston
        @a12_4 = nil
        # Count of stations in Houston with 15 docks
        @a12_5 = nil
        # Count of stations with less than 20 docks
        @a12_6 = nil
        # Count of stations with either 10 or 20 docks
        @a12_7 = nil




    ###############################################################################################################
    ##################################################### SUM #####################################################
    ###############################################################################################################




    ###### Section 2.1: `.sum` ######


        # Sum can be used to add the values in a column.
        # Note that sum is not used *across* attributes.
        # If you have two different columns you want to add together, there are other means to do that.
        # Sum is used when you want values like the total yearly rainfall, assuming you have daily rainfall.
        # Or if you wanted total revenue assuming you had sales figures for items sold.

        # For example, we can use the code below to capture the total precipitation for all days in our database.
        @e21_1 = Condition.sum(:precipitation)

        # Use `.sum` to find the following values.
        # binding.pry
        # The number of all docks in the system.
        @a21_1 = nil
        # The total amount of time that has been spent on any bike on a trip.
        @a21_2 = nil




    ###### Section 2.2: `.sum` limited to a particular condition ######


        # As with `.count`, `.sum` can be chained onto other methods.
        # Say that we wanted to find the amount of rain on windy days.
        # If we define windy days as days with mean wind speeds higher than 18, we can use the following:
        @e22_1 = Condition.where('mean_wind_speed > 18').sum(:precipitation)

        # Use `.sum` with a `.where` condition to find the following values.
        # The following instance variables may be helpful.
        mar_15             = Day.find_by(date: Date.parse("2017/03/15"))
        brooklyn           = City.where(name: "Brooklyn")
        brooklyn_station_1 = Station.where(city: brooklyn).first
        # binding.pry

        # The count of all docks in Brooklyn
        @a22_1 = nil
        # The total duration of all trips taken on March 15.
        @a22_2 = nil
        # The total duration of all trips taken starting at Brooklyn Station 1
        @a22_3 = nil
        # The total duration of all trips started on March 15 starting at Brooklyn Station 1
        @a22_4 = nil



    ###############################################################################################################
    ##################################################### AVERAGE #################################################
    ###############################################################################################################




    ###### Section 3.1: `.average` ######


        # As you might expect, average finds the average of a set of values.
        # It takes an attribute as a parameter in order to determine what it will average.
        # Note that you use average to find the average of single column of values on a table.
        # For example, in order to find the average maximum_temperature you could run the following:
        @e31_1 = Condition.average(:max_temperature)

        # Use `.average` to find the following averages.
        # The average minimum temperature.
        @a31_1 = nil
        # The average mean temperature.
        @a31_2 = nil
        # The average mean wind speed.
        @a31_3 = nil
        # The average mean precipitation.
        @a31_4 = nil
        # The average dock cound for all stations.
        @a31_5 = nil
        # The average duration for a trip.
        @a31_6 = nil




    ###### Section 3.2: `.average` with other conditions ######


        # As with count, you can chain average onto other methods.
        # For example, if we wanted to find the average duration of rides that started at a particular station, we could do the following:
        station = Station.find(1)
        @e32_1 = Trip.where(start_station: station).average(:duration)

        # Chain average onto other methods to find the following:
        # Average number of docks at stations in Brooklyn.
        brooklyn = City.find_by(name: "Brooklyn")
        @a32_1 = nil
        # Average duration of rides started in Brooklyn.
        @a32_2 = nil
        # Average duration of trips started on March 15.
        mar_15 = Day.find_by(date: Date.parse("2017/03/15"))
        @a32_3 = nil




    ###############################################################################################################
    ################################################ MINIMUM & MAXIMUM ############################################
    ###############################################################################################################




    ###### Section 4.1: `.minimum` ######


    # As you might expect, minimum finds the minimum of a set of values.




    ###### Section 4.2: `.maximum` ######


  end

  describe 'Section 1.0: Count' do
    xit 'Section 1.1' do
      expect(@a11_1).to eq(Station.count)
      expect(@a11_2).to eq(Condition.count)
      expect(@a11_3).to eq(Trip.count)
    end

    xit 'Section 1.2' do
      houston  = City.find_by(name: "Houston")
      oakland  = City.find_by(name: "Oakland")
      brooklyn = City.find_by(name: "Brooklyn")
      expect(@a12_1).to eq(Station.where(dock_count: 20).count)
      expect(@a12_2).to eq(Station.where(city: brooklyn).count)
      expect(@a12_3).to eq(Station.where(city: oakland).count)
      expect(@a12_4).to eq(Station.where(city: houston).count)
      expect(@a12_5).to eq(Station.where(city: houston, dock_count: 15).count)
      expect(@a12_6).to eq(Station.where('dock_count < 20').count)
      expect(@a12_7).to eq(Station.where('dock_count = 10 OR dock_count = 20'))
    end
  end

  describe 'Section 2.0: Sum' do
    xit 'Section 2.1' do
      expect(@a21_1).to eq(Station.sum(:dock_count))
      expect(@a21_2).to eq(Trip.sum(:duration))
    end

    xit 'Section 2.2' do
      mar_15   = Day.find_by(date: Date.parse("2017/03/15"))
      brooklyn = City.where(name: "Brooklyn")
      brooklyn_station_1 = Station.where(city: brooklyn).first
      expect(@a22_1).to eq(Station.where(city: brooklyn).sum(:dock_count))
      expect(@a22_2).to eq(Trip.where(start_date: mar_15).sum(:duration))
      expect(@a22_3).to eq(Trip.where(start_station: brooklyn_station_1).sum(:duration))
      expect(@a22_4).to eq(Trip.where(start_station: brooklyn_station_1, start_date: mar_15).sum(:duration))
    end
  end

  describe 'Section 3.0: Average' do
    xit 'Section 3.1' do
      expect(@a31_1).to eq(Condition.average(:min_temperature))
      expect(@a31_2).to eq(Condition.average(:mean_temperature))
      expect(@a31_3).to eq(Condition.average(:mean_wind_speed))
      expect(@a31_4).to eq(Condition.average(:precipitation))
      expect(@a31_5).to eq(Station.average(:dock_count))
      expect(@a31_6).to eq(Trip.average(:duration))
    end

    xit 'Section 3.2' do
      mar_15   = Day.find_by(date: Date.parse("2017/03/15"))
      brooklyn = City.where(name: "Brooklyn")
      expect(@a32_1).to eq(Station.where(city: brooklyn).average(:dock_count))
      expect(@a32_2).to eq(Trip.where(start_station: (Station.where(city: brooklyn))).average(:duration))
      expect(@a32_3).to eq(Trip.where(start_date: mar_15).average(:duration))
    end
  end

  describe 'Section 4.0: Minimum and Maximum' do
    xit 'Section 4.1' do
    end

    xit 'Section 4.2' do
    end
  end
end
