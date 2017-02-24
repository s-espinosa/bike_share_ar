class SubscriptionType < ApplicationRecord
  has_many :trips

  def trip_duration
    trips.average_duration
  end
end
