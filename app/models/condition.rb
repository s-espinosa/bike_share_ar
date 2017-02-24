class Condition < ApplicationRecord
  belongs_to :day
  has_many :started_trips, through: :day
  has_many :ended_trips, through: :day

  scope :no_rain_scope, -> { where(precipitation: 0) }

  def self.no_rain_class
    where(precipitation: 0)
  end

  def self.average_mean_humidity
    average(:mean_humidity)
  end

  def self.average_mean_temperature
    average(:mean_temperature)
  end

  def self.hottest_conditions
    where(max_temperature: Condition.maximum(:max_temperature))
  end

  def self.greater_than_average_humidity
    where(mean_humidity: average_mean_humidity..maximum(:mean_humidity))
  end

  def self.less_than_average_humidity
    where(mean_humidity: minimum(:mean_humidity)..average_mean_humidity)
  end
end
