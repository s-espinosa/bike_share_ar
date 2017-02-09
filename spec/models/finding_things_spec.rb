require 'rails_helper'

describe 'Finding Things' do
  # This before block sets up variables that we can use within this describe block.
  # In the `it` blocks below, we can use `station_1` to refer to the Station that is created  below with a name of "Station 1".
  before(:all) do
    @city_1      = City.create(name: "Denver")
    @city_2      = City.create(name: "Houston")
    @city_3      = City.create(name: "Brooklyn")
    @albuquerque = City.create(name: "Albuquerque")

    @station_1 = @city_1.stations.create(name: "Station 1", dock_count: 10, installation_date: "2017/01/01")
    @station_2 = @city_2.stations.create(name: "Station 2", dock_count: 15, installation_date: "2017/02/01")
    @station_3 = @city_3.stations.create(name: "Station 3", dock_count: 20, installation_date: "2017/03/01")
  end

  describe 'Using hash conditions' do
    # Each of the examples in this section will use Hash conditions.
    # This means that the arguments that we're going to pass each method will be a hash.
    # For example: when we call `User.find_by(name: 'Sal')`, the `name: 'Sal'` that is in parenthesis is a *hash*.
    # This likely looks familiar to you, so why bother talking about it?
    # For now, don't worry too much about it. This will make more sense once you get to the 'Using string conditions' section.
    # That section will introduce another way to pass arguments.

    describe '.find_by' do
      xit 'can find an individual record by a specific parameter' do
        # Assuming we have a few records in our database (created above in our before block), we can use `.find_by` to find a particular record by an attribute.
        # Notice in the code below that we pass the hash `{name: "Station 1"}` as an argument to `.find_by`.
        # The example eliminates the curly braces ({}), but the argument is still a hash.
        # The key of that hash specifies the attribute we will use to find a particular station.
        # The value of that hash specifies the value of the attribute in the database that we want to find.
        station = Station.find_by(name: "Station 1")

        expect(station).to eq(@station_1)

        # Use `.find_by` in the four lines below to make this test pass.
        # Be sure to find by different attributes.
        actual_1    = nil
        actual_2    = nil
        actual_3    = nil
        actual_city = nil

        # Do not change these expectations.
        expect(actual_1).to eq(@station_1)
        expect(actual_2).to eq(@station_2)
        expect(actual_3).to eq(@station_3)
        expect(actual_city).to eq(@city_1)
      end

    end

    describe '.find' do
      xit 'can find an individual record using its id' do
        # `.find` is similar to `.find_by`, but it automatically assumes that you're trying to find by an id.
        # In the example below we use `.find` and `.find_by` to find the record with the id of 1.
        # The only advantage here is that `.find` is shorter.
        # It's convenient that AR gives us this syntax since we will so frequently find our records by their id.
        with_find    = Station.find(1)
        with_find_by = Station.find_by(id: 1)

        expect(with_find).to eq(with_find_by)

        # We can also use this on the City model.
        city = City.find(1)
        expect(city).to eq(@city_1)

        # Note that our it is a happy coincidence that our we have saved our first city (with an id of 1) to `@city_1`.
        # The `1` at the end of that instance variable has no impact on this.
        city = City.find(4)
        expect(city).to eq(@albuquerque)

        # Use `.find` in the following four lines to make the expectations below pass.
        actual_1 = nil
        actual_2 = nil
        actual_3 = nil
        actual_4 = nil
        actual_5 = nil

        # Do not change these expectations.
        expect(actual_1).to eq(@station_1)
        expect(actual_2).to eq(@station_3)
        expect(actual_3).to eq(@station_2)
        expect(actual_4).to eq(@city_2)
        expect(actual_5).to eq(@city_1)
      end
    end

    describe '.where' do
      xit 'can find a collection of records using a specific parameter' do
        # Similar to `.find_by`, `.where` will take a hash argument specifying an attribute and a value.
        # Unlike `.find_by`, `.where` will return a collection of records.
        # For this exercise we need some stations that have attributes in common with those created above.
        station_4 = @city_1.stations.create(name: "Station 4", dock_count: 10, installation_date: "2017/01/01")
        station_5 = @city_1.stations.create(name: "Station 5", dock_count: 10, installation_date: "2017/03/01")
        station_6 = @city_1.stations.create(name: "Station 6", dock_count: 20, installation_date: "2017/03/01")

        # Since @station_1, station_4, and station_5 all have a dock_count of 10, we can use `.where` to return all of them.
        # Notice we're using the same hash syntax, but getting an array like object back instead of a single instance.
        expected = [@station_1, station_4, station_5]
        actual   = Station.where(dock_count: 10)
        expect(actual).to match_array(expected)


        # Use `.where` in the following four lines to make the expectations below pass.
        actual_1 = nil
        actual_2 = nil
        actual_3 = nil
        actual_4 = nil

        # Do not change these expectations.
        expected_1 = [@station_1, station_4, station_5, station_6]
        expected_2 = [@station_1, station_4]
        expected_3 = [@station_3, station_5, station_6]
        expected_4 = [@station_3, station_6]

        expect(actual_1).to match_array(expected_1)
        expect(actual_2).to match_array(expected_2)
        expect(actual_3).to match_array(expected_3)
        expect(actual_4).to match_array(expected_4)
      end

      xit 'can find a collection of record based on multiple parameters' do
        # Where can also find a collection of records using multiple parameters.
        # As above we need some stations that have attributes in common with those created above.
        station_4 = @city_1.stations.create(name: "Station 4", dock_count: 10, installation_date: "2017/01/01")
        station_5 = @city_1.stations.create(name: "Station 5", dock_count: 10, installation_date: "2017/03/01")
        station_6 = @city_1.stations.create(name: "Station 6", dock_count: 20, installation_date: "2017/03/01")

        # If for example we wanted to find all of the stations with ten docks that were built in January of 2017, we could do the following.
        # Notice that both 1 and 4 have these characteristics, but 5 does not because it was built in March.
        expected = [@station_1, station_4]
        actual   = Station.where(dock_count: 10, installation_date: "2017/01/01")
        expect(actual).to match_array(expected)

        # Use `.where` with multiple conditions in the following four lines to make the expectations below pass.
        # 20 docks and installed in March
        actual_1 = nil
        # Denver with 20 docks
        actual_2 = nil
        # Installed in March with 10 docks.
        actual_3 = nil

        # Do not change these expectations.
        expected_1 = [@station_3, station_6]
        expected_2 = [station_6]
        expected_3 = [station_5]

        expect(actual_1).to match_array(expected_1)
        expect(actual_2).to match_array(expected_2)
        expect(actual_3).to match_array(expected_3)
      end
    end

    describe '.where.not' do
      xit "can find a collection of records that don't match a specific parameter" do
        # One pattern that you may find helpful is to chain `.not` onto `.where`.
        # This will allow you to find records without a particular characteristic.
        # Let's use the same setup as the `.where` exercise above.
        station_4 = @city_1.stations.create(name: "Station 4", dock_count: 10, installation_date: "2017/01/01")
        station_5 = @city_1.stations.create(name: "Station 5", dock_count: 10, installation_date: "2017/03/01")
        station_6 = @city_1.stations.create(name: "Station 6", dock_count: 20, installation_date: "2017/03/01")

        # Let's assume that we wanted to find all the stations not in Denver.
        # One approach would be to find the city with a name of Denver,
        # Then to use that city to create my `.where.not` query.
        # I expect that the stations returned fromt that query will be the stations in Houston and Brooklyn
        # Note that this query would also work if I called `Station.where.not(city_id: 1)`,
        # or, I could use `Station.where.not(city_id: denver.id)`
        denver   = City.find_by(name: "Denver")
        actual   = Station.where.not(city: denver)
        expected = [@station_2, @station_3]
        expect(actual).to match_array(expected)

        # Use `.where.not` in the following four lines to make the expectations below pass.
        actual_1 = nil
        actual_2 = nil
        actual_3 = nil
        actual_4 = nil

        # Do not change these expectations.
        expected_1 = [@station_2, @station_3, station_6]
        expected_2 = [@station_1, @station_2, station_4]
        expected_3 = [@station_1, @station_3, station_4, station_5, station_6]
        expected_4 = [@city_1, @city_2, @city_3]

        expect(actual_1).to eq(expected_1)
        expect(actual_2).to eq(expected_2)
        expect(actual_3).to eq(expected_3)
        expect(actual_4).to eq(expected_4)
      end
    end

    describe 'Pitfalls and things to remember' do
      xit '.find_by will only find a single record' do
        # One thing to be sure that you know: `.find_by` will return a single record, while `.where` will return a collection.
        # Below we create two new stations each with a dock count of 50.
        same_count_1 = @city_1.stations.create(name: "Same Count 1", dock_count: 50, installation_date: "2017/05/01")
        same_count_2 = @city_1.stations.create(name: "Same Count 2", dock_count: 50, installation_date: "2017/06/01")

        # If we use a find_by to find a station with a dock count of 50, it will only return one of the two stations.
        expected_1 = same_count_1
        actual_1   = Station.find_by(dock_count: 50)
        expect(actual_1).to eq(expected_1)

        # Meanwhile, `.where` returns a collection including both of these new stations.
        expected_2 = [same_count_1, same_count_2]
        actual_2   = Station.where(dock_count: 50)
        expect(actual_2).to eq(expected_2)

      end
    end
  end

  describe 'Using string conditions' do
    # The examples below mirror those above, but will use string parameters.
    # The remainder of these exercises will use hash conditions for the most part.
    # However, it is important that you be able to recognize string parameters, and not consider them an exotic syntax.
    # Note that the difference between those examples above and those below is the syntax being used in the arguments.

    describe '.find_by' do
      xit 'can find an individual record by a specific parameter' do
        station = Station.find_by(name: "Station 1")

        expect(station).to eq(@station_1)

        # Use `.find_by` with pure string conditions in the four lines below to make this test pass.
        # Be sure to find by different attributes.
        actual_1    = nil
        actual_2    = nil
        actual_3    = nil
        actual_city = nil

        # Do not change these expectations.
        expect(actual_1).to eq(@station_1)
        expect(actual_2).to eq(@station_2)
        expect(actual_3).to eq(@station_3)
        expect(actual_city).to eq(@city_1)
      end
    end
  end

  describe 'Using placeholder conditions' do
    # These examples are similar to those above but provide additional protection when accepting arguments from users.
    # Read more about the reasons here: http://guides.rubyonrails.org/active_record_querying.html#array-conditions
    describe '.where' do
      xit 'can find a collection of records based on a specific parameter' do
        # We'll use the same setup and example as the `.where` exercises above.
        station_4 = @city_1.stations.create(name: "Station 4", dock_count: 10, installation_date: "2017/01/01")
        station_5 = @city_1.stations.create(name: "Station 5", dock_count: 10, installation_date: "2017/03/01")
        station_6 = @city_1.stations.create(name: "Station 6", dock_count: 20, installation_date: "2017/03/01")

        # The placeholder syntax is similar to string syntax in that it is closer to raw SQL.
        # However, instead of hard coding the value of the attribute that we're looking for, we use a `?`, and then pass an array as a second argument.
        expected = [@station_1, station_4, station_5]
        actual   = Station.where('dock_count = ?', 10)
        expect(actual).to match_array(expected)

        # We can also use `.where` with two conditions as with hash parameters.
        # In this case we pass the values for the separate conditions separated by a comma.
        expected_two_conditions = [@station_1, station_4]
        actual_two_conditions   = Station.where('dock_count = ? AND installation_date = ?', 10, "2017/01/01")
        expect(actual_two_conditions).to eq(expected_two_conditions)

        # Use `.where` with array conditions in the following four lines to make the expectations below pass.
        actual_1 = nil
        actual_2 = nil
        actual_3 = nil
        actual_4 = nil

        # Do not change these expectations.
        expected_1 = [@station_1, station_4, station_5, station_6]
        expected_2 = [@station_1, station_4]
        expected_3 = [@station_3, station_5, station_6]
        expected_4 = [@station_3, station_6]

        expect(actual_1).to match_array(expected_1)
        expect(actual_2).to match_array(expected_2)
        expect(actual_3).to match_array(expected_3)
        expect(actual_4).to match_array(expected_4)
      end
    end
  end
end
