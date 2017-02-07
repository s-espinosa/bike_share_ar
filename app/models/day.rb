class Day < ApplicationRecord
  has_many :started_trips, foreign_key: "start_date_id", class_name: "Trip"
  has_many :ended_trips, foreign_key: "end_date_id", class_name: "Trip"
  has_one :condition

  def self.dry_days
    joins(:condition).where(conditions: {precipitation: 0})
  end

  def self.wet_days
    joins(:condition).where.not(conditions: {precipitation: 0})
  end

  def self.hottest_days
    joins(:condition).merge(Condition.hottest_conditions)
  end
end
