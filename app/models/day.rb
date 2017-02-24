class Day < ApplicationRecord
  has_many :started_trips, foreign_key: "start_date_id", class_name: "Trip"
  has_many :ended_trips, foreign_key: "end_date_id", class_name: "Trip"
  has_one :condition
end
