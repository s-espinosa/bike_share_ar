Station.destroy_all
City.destroy_all
Trip.destroy_all
SubscriptionType.destroy_all
Condition.destroy_all
Day.destroy_all


# Create Cities
cities = ["Denver", "Houston", "Brooklyn", "Albuquerque", "Oakland"]
puts "Creating Cities"
cities.each_with_index do |city, n|
  City.create(id: (n + 1), name: city)
  puts "  Created #{city}"
end


# Create Stations
puts "Creating Stations"
City.all.each do |city|
  5.times do |n|
    city.stations.create(name: "#{city.name} Station #{n + 1}",
                         dock_count: (10 + (5 * (n % 3))),
                         installation_date: "2017/#{(n % 12) + 1}/01",
                        )
    puts "  Created #{Station.last.name}"
  end
end


# Create Subscription Types
puts "Creating Subscription Types"
SubscriptionType.create(name: "Subscriber")
SubscriptionType.create(name: "Customer")


# Create Days
puts "Creating Days"
30.times do |n|
  Day.create(date: "2017/03/#{n + 1}")
end


# Create Conditions
puts "Creating Conditions"
Day.all.each_with_index do |day, n|
  Condition.create(day: day,
                   max_temperature: (85 + (3 * (n % 4))),
                   min_temperature: (50 + (4 * (n % 3))),
                   mean_temperature: (70 + (5 * (n % 2))),
                   mean_humidity: (60 + (2 * (n % 6))),
                   mean_visibility: (8 + (2 * (n % 3))),
                   mean_wind_speed: (13 + (2 * (n % 5))),
                   precipitation: (0 + (2 * (n % 8))),
                  )
end

# Create Trips
puts "Creating Trips"
Day.all.each_with_index do |day, n|
  6.times do |j|
    s_count = Station.count
    ss = Station.all[((n + j) % s_count)]
    es = Station.all[(s_count - ((n + j) % s_count) - 1)]
    st = SubscriptionType.all[(j % 2)]

    Trip.create!(duration: (j + 120 * j),
                start_date: day,
                end_date: day,
                start_station: ss,
                end_station: es,
                bike_id: j,
                subscription_type: st,
                zip_code: "0213#{j}"
               )
  end
end


# Outliers
puts "Creating Outliers"
City.find_by(name: "Brooklyn").stations.create(name: "Brooklyn Outlier", dock_count: 5, installation_date: "2016/12/01")
