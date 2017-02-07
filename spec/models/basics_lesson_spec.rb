require 'rails_helper'

describe 'Finding Things Lesson' do
  describe 'Using hash conditions' do
    # Each of the examples in this section will use Hash conditions.
    # This means that the arguments that we're going to pass each method will be a hash.
    # For example: when we call `User.find_by(name: 'Sal')`, the `name: 'Sal'` that is in parenthesis is a *hash*.
    # This likely looks familiar to you, so why bother talking about it?
    # For now, don't worry too much about it. This will make more sense once you get to the 'Using string conditions' section.
    # That section will introduce another way to pass arguments.

    before(:all) do
      @city_1      = City.create(name: "Denver")
      @city_2      = City.create(name: "Houston")
      @city_3      = City.create(name: "Brooklyn")
      @albuquerque = City.create(name: "Albuquerque")

      @station_1 = @city_1.stations.create(name: "Station 1", dock_count: 10, installation_date: "2017/01/01")
      @station_2 = @city_2.stations.create(name: "Station 2", dock_count: 15, installation_date: "2017/02/01")
      @station_3 = @city_3.stations.create(name: "Station 3", dock_count: 20, installation_date: "2017/03/01")
    end

    describe '.find_by' do
      # This before block sets up variables that we can use within this describe block.
      # In the `it` blocks below, we can use `station_1` to refer to the Station that is created with below with a name of "Station 1".

      it 'can find an individual record by a specific parameter' do
        # Assuming we have a few records in our database, we can use `.find_by` to find a particular record by an attribute.
        # Notice in the code below that we pass the hash `{name: "Station 1"}` as an argument to `.find_by`.
        # The example eliminates the curly braces ({}), but the argument is still a hash.
        # The key of that hash specifies the attribute we will use to find a particular station.
        # The value of that hash specifies the value of the attribute in the database that we want to find.
        station = Station.find_by(name: "Station 1")

        expect(station).to eq(@station_1)

        # Use `.find_by` in the four lines below to make this test pass.
        # Be sure to find by different attributes.
        actual_1    = Station.find_by(name: "Station 1")
        actual_2    = Station.find_by(dock_count: 15)
        actual_3    = Station.find_by(installation_date: "2017/03/01")
        actual_city = City.find_by(name: "Denver")

        # Do not change these expectations.
        expect(actual_1).to eq(@station_1)
        expect(actual_2).to eq(@station_2)
        expect(actual_3).to eq(@station_3)
        expect(actual_city).to eq(@city_1)
      end
    end

    describe '.find' do
      it 'can find an individual record using its id' do
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

        # Use find in the following four lines to make the expectations below pass.
        actual_1 = Station.find(1)
        actual_2 = Station.find(3)
        actual_3 = Station.find(2)
        actual_4 = City.find(2)
        actual_5 = City.find(1)

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

      end
    end

    describe '.where.not' do

    end

    describe 'Pitfalls and things to remember' do
      xit '.find_by will only find a single record' do

      end
    end
  end

  describe 'Using string conditions' do
    # These examples will mirror those above, but will use string parameters.
    # The remainder of these exercises will use hash conditions for the most part.
    # However, it is important that you be able to recognize string parameters, and not consider them an exotic syntax.
    # Note that the difference between those examples above and those below is the syntax being used in the arguments.

    describe '.find_by' do
      xit 'can find an individual record by a specific parameter' do

      end
    end
  end

  describe 'Using array conditions' do
    # These examples are similar to those above but provide additional protection when accepting arguments from users.
    # Read more about the reasons here: http://guides.rubyonrails.org/active_record_querying.html#array-conditions
  end
end
