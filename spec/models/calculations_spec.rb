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
        @a11_1 = Station.count
        # Count of all conditions.
        @a11_2 = Condition.count
        # Count of all trips.
        @a11_3 = Trip.count




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
        @a12_1 = Station.where(dock_count: 20).count
        # Count of stations in Brookyn
        @a12_2 = Station.where(city: brooklyn).count
        # Count of stations in Oakland
        @a12_3 = Station.where(city: oakland).count
        # Count of stations in Houston
        @a12_4 = Station.where(city: houston).count
        # Count of stations in Houston with 15 docks
        @a12_5 = Station.where(city: houston, dock_count: 15).count
        # Count of stations with less than 20 docks
        @a12_6 = Station.where('dock_count < 20').count
        # Count of stations with either 10 or 20 docks
        @a12_7 = Station.where('dock_count = 10 OR dock_count = 20')




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
        @a21_1 = Station.sum(:dock_count)
        # The total amount of time that has been spent on any bike on a trip.
        @a21_2 = Trip.sum(:duration)




    ###### Section 2.2: `.sum` limited to a particular condition ######


        # As with `.count`, `.sum` can be chained onto other methods.
        # Say that we wanted to find the amount of rain on windy days.
        # If we define windy days as days with mean wind speeds higher than 18, we can use the following:
        @e22_1 = Condition.where('mean_wind_speed > 18').sum(:precipitation)

        # Use `.sum` with a `.where` condition to find the following values.
        # The following instance variables may be helpful.
        mar_15             = Day.find_by(date: Date.parse("2017/03/15"))
        mar_30             = Day.find_by(date: Date.parse("2017/03/30"))
        brooklyn           = City.where(name: "Brooklyn")
        brooklyn_station_1 = Station.where(city: brooklyn).first
        # binding.pry

        # The count of all docks in Brooklyn
        @a22_1 = Station.where(city: brooklyn).sum(:dock_count)
        # The total duration of all trips taken on March 15.
        @a22_2 = Trip.where(start_date: mar_15).sum(:duration)
        # The total duration of all trips taken starting at Brooklyn Station 1
        @a22_3 = Trip.where(start_station: brooklyn_station_1).sum(:duration)
        # The total duration of all trips started on March 15 starting at Brooklyn Station 1
        @a22_4 = Trip.where(start_station: brooklyn_station_1, start_date: mar_15).sum(:duration)



    ###############################################################################################################
    ##################################################### AVERAGE #####################################################
    ###############################################################################################################




    ###### Section 3.1: `.average` ######


    # As you might expect, average finds the average of a set of values.
    # It takes an attribute as a parameter in order to determine what it will average.
    # Note that you use average to find the average of single column of values in



    # AVERAGE CONDITION STUFF
    # AVERAGE DIFFERENCE BETWEEN MAX AND MIN TEMPS (using string conditions)
    #




    ###############################################################################################################
    ################################################ MINIMUM & MAXIMUM ################################################
    ###############################################################################################################




    ###### Section 4.1: `.minimum` ######


    # As you might expect, average finds the average of a set of values.




    ###### Section 4.2: `.maximum` ######


  end

  describe 'Section 1.0: Count' do
    it 'Section 1.1' do
      expect(@a11_1).to eq(Station.count)
      expect(@a11_2).to eq(Condition.count)
      expect(@a11_3).to eq(Trip.count)
    end

    it 'Section 1.2' do
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
    it 'Section 2.1' do
      expect(@a21_1).to eq(Station.sum(:dock_count))
      expect(@a21_2).to eq(Trip.sum(:duration))
    end

    it 'Section 2.2' do
      mar_15             = Day.find_by(date: Date.parse("2017/03/15"))
      brooklyn           = City.where(name: "Brooklyn")
      brooklyn_station_1 = Station.where(city: brooklyn).first
      expect(@a22_1).to eq(Station.where(city: brooklyn).sum(:dock_count))
      expect(@a22_2).to eq(Trip.where(start_date: mar_15).sum(:duration))
      expect(@a22_3).to eq(Trip.where(start_station: brooklyn_station_1).sum(:duration))
      expect(@a22_4).to eq(Trip.where(start_station: brooklyn_station_1, start_date: mar_15).sum(:duration))
    end
  end

  describe 'Section 3.0: Average' do
    it 'Section 3.1' do
    end
  end

  describe 'Section 4.0: Minimum and Maximum' do
    it 'Section 4.1' do
    end

    it 'Section 4.2' do
    end
  end
end
