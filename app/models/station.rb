class Station < ApplicationRecord
  belongs_to :city
  has_many :started_trips, class_name: :Trip, foreign_key: :start_station_id
  has_many :ended_trips, class_name: :Trip, foreign_key: :end_station_id

  scope :docks_of_15_scope, -> { where(dock_count: 15) }
  scope :brooklyn_scope, -> { where(city: City.find_by(name: "Brooklyn")) }

  def self.docks_of_15_class
    where(dock_count: 15)
  end

  def self.brooklyn_class
    where(city: City.find_by(name: "Brooklyn"))
  end

  def self.average_dock_count
    average(:dock_count)
  end

  def average_trip_duration
    started_trips.average_duration
  end
end
