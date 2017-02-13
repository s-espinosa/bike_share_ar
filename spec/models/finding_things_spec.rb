require 'rails_helper'

describe 'Finding Things' do
  before(:all) do
    ###############################################################################################################
    ############################################ USING HASH CONDITIONS ############################################
    ###############################################################################################################
    # Each of the examples in this section will use Hash conditions.
    # This means that the arguments that we're going to pass each method will be a hash.
    # For example: when we call `User.find_by(name: 'Sal')`, the `name: 'Sal'` that is in parenthesis is a *hash*.
    # This likely looks familiar to you, so why bother talking about it?
    # For now, don't worry too much about it. This will make more sense once you get to the 'Using string conditions' section.
    # That section will introduce another way to pass arguments.




    ###### Section 1.1: `.find_by` ######


        # Assuming we have a few records in our database (created when we ran `rake db:test:prepare`),
        # we can use `.find_by` to find a particular record by an attribute.
        # Notice in the code below that we pass the hash `{name: "Station 1"}` as an argument to `.find_by`.
        # The example eliminates the curly braces ({}), but the argument is still a hash.
        # The key of that hash specifies the attribute we will use to find a particular station.
        # The value of that hash specifies the value of the attribute in the database that we want to find.

        @e11_1 = Station.find_by(name: "Brooklyn Station 1")

        # Use `.find_by` in the four lines below.
        # Recommend that you uncomment the `binding.pry` below before answering.
        # This will allow you to try your answers and see their results.
        # binding.pry
        # Unskip the test labeled Section 1.1 to check your answers.

        # Find the station with a dock_count of 5
        @a11_1 = Station.find_by(dock_count: 5)
        # Find the station installed on December 1, 2016
        @a11_2 = Station.find_by(installation_date: "2016/12/01")
        # Find the City with a name of Los Angeles
        @a11_3 = City.find_by(name: "Los Angeles")
        # Find the Station in Los Angeles
        @a11_4 = Station.find_by(city: @city_3)




    ###### Section 1.2: `.find` ######


        # `.find` is similar to `.find_by`, but it automatically assumes that you're trying to find by an id.
        # In the example below we use `.find` and `.find_by` to find the record with the id of 1.
        # The only advantage here is that `.find` is shorter.
        # It's convenient that AR gives us this syntax since we will so frequently find our records by their id.
        @e12_1 = Station.find_by(id: 1)
        @e12_2 = Station.find(1)
        # After the assignments above, `@e12_1` and `@e12_2` each reference the same record.

        # Use find in the lines below.
        # As above, recommend that you uncomment the `binding.pry` below before answering.
        # binding.pry
        # Unskip the test labeled Section 1.2 to check your answers.
        # Find the Station with an id of 1
        @a12_1 = Station.find(1)
        # Find the Station with an id of 3
        @a12_2 = Station.find(3)
        # Find the Station with an id of 2
        @a12_3 = Station.find(2)
        # Find the City with an id of 2
        @a12_4 = City.find(2)
        # Find the City with an id of 1
        @a12_5 = City.find(1)




    ###### Section 1.3: `.where` ######


        # Similar to `.find_by`, `.where` will take a hash argument specifying an attribute and a value.
        # Unlike `.find_by`, `.where` will return a collection of records.
        # In the line below we use `.where` to find all stations with ten docks.
        # Notice we're using the same hash syntax, but getting an array like object back instead of a single instance.
        @e13_1 = Station.where(dock_count: 10)

        # Use `.where` in the following four lines to make the expectations below pass.
        # Unskip the test labeled Section 1.3 to check your answers.
        # The local variable below may help in one of the queries.
        denver = City.find_by(name: "Denver")

        # binding.pry
        # Find the Stations installed on January 1, 2017.
        @a13_1 = Station.where(installation_date: "2017/01/01")
        # Find the Stations installed on March 1, 2017.
        @a13_2 = Station.where(installation_date: "2017/03/01")
        # Find the Stations in Denver.
        @a13_3 = Station.where(city: denver)
        # Find the Stations with twenty docks.
        @a13_4 = Station.where(dock_count: 20)




    ###### Section 1.4: `.where` with multiple conditions ######


        # Where can also find a collection of records using multiple parameters.
        # If for example we wanted to find all of the stations with ten docks that were built in January of 2017,
        # we could do the following.
        # Notice that we're still using hash conditions, but now we have two sets of keys/values.
        @e14_1 = Station.where(dock_count: 10, installation_date: "2017/01/01")

        # Use `.where` with multiple conditions in the following four lines to make the expectations below pass.
        # Unskip the test labeled Section 1.4 to check your answers.
        # The local variable below may help in one of the queries.
        oakland = City.find_by(name: "Oakland")

        # binding.pry
        # 20 docks and installed in March
        @a14_1 = Station.where(dock_count: 20, installation_date: "2017/03/01")
        # Denver with 20 docks
        @a14_2 = Station.where(city: oakland, dock_count: 20)
        # Installed in March with 10 docks.
        @a14_3 = Station.where(dock_count: 10, installation_date: "2017/03/01")




    ###### Section 1.5: `.where.not` ######


        # One pattern that you may find helpful is to chain `.not` onto `.where`.
        # This will allow you to find records without a particular characteristic.

        # Let's assume that we wanted to find all the stations not in Denver.
        # One approach would be to find the city with a name of Denver,
        # Then to use that city to create my `.where.not` query.
        # Note that this query would also work if I called `Station.where.not(city_id: 1)` (if Denver's id is 1),
        # or I could use `Station.where.not(city_id: denver.id)`
        denver = City.find_by(name: "Denver")
        @e15_1 = Station.where.not(city: denver)

        # Use `.where.not` in the following four lines to make the expectations below pass.
        # Unskip the test labeled Section 1.4 to check your answers.
        # The local variable below may help in one of the queries.
        houston = City.find_by(name: "Houston")

        # binding.pry
        # Stations with dock counts other than 10.
        @a15_1 = Station.where.not(dock_count: 10)
        # Stations with installation dates other than March 1, 2017.
        @a15_2 = Station.where.not(installation_date: "2017/03/01")
        # Stations not in Houston.
        @a15_3 = Station.where.not(city: houston)
        # Cities that are not Albuquerque.
        @a15_4 = City.where.not(name: "Albuquerque")




    ###### Section 1.6: Pitfalls & Things to Remember ######


        # One thing to be sure that you know: `.find_by` will return a single record, while `.where` will return a collection.
        # If we use a find_by to find a station with a dock count of 50, it will only return one of the two stations.
        @e16_1 = Station.find_by(dock_count: 15)
        # `@e16_1` now holds a reference to a single Station, even though there are more than one station with a dock count of 15.

        # Meanwhile, `.where` returns a collection including both of these new stations.
        @e16_2 = Station.where(dock_count: 15)
        # `@e16_2` holds a collection of stations each with a dock count of 15.




    ###############################################################################################################
    ########################################### USING STRING CONDITIONS ###########################################
    ###############################################################################################################


    # The examples below mirror those above, but will use string parameters.
    # The remainder of these exercises will use hash conditions for the most part.
    # However, it is important that you be able to recognize string parameters, and not consider them an exotic syntax.
    # Note that the difference between those examples above and those below is the syntax being used in the arguments.




    ###### Section 2.1: `.find_by` with String Conditions ######

        # String conditions include the attribute and the value in quotes.
        # They also replace the `:` with `=` consistent with SQL syntax.
        @e21_1 = Station.find_by("name = 'Brooklyn Station 1'")


        # Use `.find_by` with pure string conditions in the four lines below to make this test pass.
        # Be sure to find by different attributes.
        # binding.pry
        # The station with a dock count of 10.
        @a21_1 = Station.find_by("dock_count = 5")
        # The station with an installation date of December 1, 2016
        @a21_2 = Station.find_by("installation_date = '2016/12/01'")
        # Denver
        @a21_3 = City.find_by("name = 'Denver'")




    ###### Section 2.2: `.where` with String Conditions ######


        # One advantage of pure string conditions over hash conditions is that
        # they allow you to use comparison operators in a straightforward way.
        @e22_1 = Station.where('dock_count <= 10')

        # You can also use `AND` and `OR` in string conditions.
        @e22_2 = Station.where('10 < dock_count AND dock_count < 20')

        # Practice by using string conditions to select the stations described below.
        # binding.pry
        # Select stations with a dock count less than 20
        @a22_1 = Station.where('dock_count < 20')
        # Select stations with a dock count of at least 15
        @a22_2 = Station.where('dock_count >= 15')
        # Select stations with a dock count of either 15 or 10.
        @a22_3 = Station.where('dock_count = 10 OR dock_count = 15')




    ###############################################################################################################
    ######################################## USING PLACEHOLDER CONDITIONS #########################################
    ###############################################################################################################


    # These examples are similar to those above but provide additional protection when accepting arguments from users.
    # Read more about the reasons here: http://guides.rubyonrails.org/active_record_querying.html#array-conditions




    ###### Section 3.1: `.where` with Placeholder Conditions ######


        # The placeholder syntax is similar to string syntax in that it is closer to raw SQL.
        # However, instead of hard coding the value of the attribute that we're looking for, we use a `?`,
        # and then pass an array as a second argument.
        @e31_1 = Station.where('dock_count = ?', 10)

        # We can also use `.where` with two conditions as with hash parameters.
        # In this case we pass the values for the separate conditions separated by a comma.
        @e31_2 = Station.where('dock_count = ? AND installation_date = ?', 10, "2017/01/01")

        # We can also use this syntax to do comparisons between dates to select dates in a range.
        # Notice that in order to use this comparison we have to create a date object.
        @e31_3 = Station.where('installation_date < ?', Date.parse('2017/02/15'))
        @e31_4 = Station.where('? < installation_date AND installation_date < ?',
                               Date.parse('2017/01/15'), Date.parse('2017/02/15'))

        # Use `.where` with array conditions in the following four lines to make the expectations below pass.
        # The local variable below may help in one of the queries.
        albuquerque = City.find_by(name: "Albuquerque")

        # binding.pry
        # Stations with an installation date of January 1, 2017
        @a31_1 = Station.where("installation_date = ?", "2017/01/01")
        # Stations with an installation date of March 1, 2017
        @a31_2 = Station.where("installation_date = ?", "2017/03/01")
        # Stations in Albuquerque
        @a31_3 = Station.where("city_id = ?", albuquerque.id)
        # Stations with a dock count of 20
        @a31_4 = Station.where("dock_count = ?", 20)
        # Stations with an installation_date after January 15, 2017.
        @a31_4 = Station.where('installation_date > ?', Date.parse("2017/01/15"))
        # Stations with an installation_date between February 15 and March 15, 2017.
        @a31_5 = Station.where('? < installation_date AND installation_date < ?',
                               Date.parse('2017/02/17'), Date.parse('2017/03/17'))
  end








  ###############################################################################################################
  ########################################### EXPECTATIONS & ANSWERS ############################################
  ###############################################################################################################




  describe 'Section 1.0: Hash Conditions' do
    it 'Section 1.1' do
      expect(@a11_1).to eq(Station.find_by(dock_count: 5))
      expect(@a11_2).to eq(Station.find_by(installation_date: "2016/12/01"))
      expect(@a11_3).to eq(City.find_by(name: "Los Angeles"))
      expect(@a11_4).to eq(Station.find_by(city: (@a1_3)))
    end

    it 'Section 1.2' do
      expect(@a12_1).to eq(Station.find(1))
      expect(@a12_2).to eq(Station.find(3))
      expect(@a12_3).to eq(Station.find(2))
      expect(@a12_4).to eq(City.find(2))
      expect(@a12_5).to eq(City.find(1))
    end

    it 'Section 1.3' do
      denver = City.find_by(name: "Denver")
      expect(@a13_1).to eq(Station.where(installation_date: "2017/01/01"))
      expect(@a13_2).to eq(Station.where(installation_date: "2017/03/01"))
      expect(@a13_3).to eq(Station.where(city: denver))
      expect(@a13_4).to eq(Station.where(dock_count: 20))
    end

    it 'Section 1.4' do
      oakland = City.find_by(name: "Oakland")
      expect(@a14_1).to eq(Station.where(dock_count: 20, installation_date: "2017/03/01"))
      expect(@a14_2).to eq(Station.where(city: oakland, dock_count: 20))
      expect(@a14_3).to eq(Station.where(dock_count: 10, installation_date: "2017/03/01"))
    end

    it 'Section 1.5' do
      houston = City.find_by(name: "Houston")
      expect(@a15_1).to eq(Station.where.not(dock_count: 10))
      expect(@a15_2).to eq(Station.where.not(installation_date: "2017/03/01"))
      expect(@a15_3).to eq(Station.where.not(city: houston))
      expect(@a15_4).to eq(City.where.not(name: "Albuquerque"))
    end
  end

  describe 'Section 2.0: String Conditions' do
    it 'Section 2.1' do
      expect(@a21_1).to eq(Station.find_by("dock_count = 5"))
      expect(@a21_2).to eq(Station.find_by("installation_date = '2016/12/01'"))
      expect(@a21_3).to eq(City.find_by("name = 'Denver'"))
    end

    it 'Section 2.2' do
      expect(@a22_1).to eq(Station.where('dock_count < 20'))
      expect(@a22_2).to eq(Station.where('dock_count >= 15'))
      expect(@a22_3).to eq(Station.where('dock_count = 10 OR dock_count = 15'))
    end
  end

  describe 'Section 3.0: Placeholder Conditions' do
    it 'Section 3.1' do
      albuquerque = City.find_by(name: "Albuquerque")
      a31_1 = Station.where("installation_date = ?", "2017/01/01")
      a31_2 = Station.where("installation_date = ?", "2017/03/01")
      a31_3 = Station.where("city_id = ?", albuquerque.id)
      a31_4 = Station.where("dock_count = ?", 20)
      a31_4 = Station.where('installation_date > ?', Date.parse("2017/01/15"))
      a31_5 = Station.where('? < installation_date AND installation_date < ?',
                             Date.parse('2017/02/17'), Date.parse('2017/03/17'))

      expect(@a31_1).to eq(a31_1)
      expect(@a31_2).to eq(a31_2)
      expect(@a31_3).to eq(a31_3)
      expect(@a31_4).to eq(a31_4)
      expect(@a31_5).to eq(a31_5)
    end
  end
end
