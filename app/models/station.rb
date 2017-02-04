class Station < ApplicationRecord
  belongs_to :city
  has_many :started_trips, class_name: :Trip, foreign_key: :start_station_id
  has_many :ended_trips, class_name: :Trip, foreign_key: :end_station_id

end
