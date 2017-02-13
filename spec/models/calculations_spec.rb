require 'rails_helper'

describe 'Calculations: ' do
  before(:all) do
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
        @a11_1 = Station.count
        @a11_2 = Condition.count
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

  describe 'average' do
    # As you might expect, average finds the average of a set of values.
    # It takes an attribute as a parameter in order to determine what it will average.
    #
  end
end
