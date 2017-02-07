class Trip < ApplicationRecord
  belongs_to :subscription_type
  belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id
  belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id
  belongs_to :start_date, class_name: :Day, foreign_key: :start_date_id
  belongs_to :end_date, class_name: :Day, foreign_key: :end_date_id

  def self.dry_trips
    joins(:start_date).merge(Day.dry_days)
  end

  def self.wet_trips
    joins(:start_date).merge(Day.wet_days)
  end

  def self.hottest_trips
    joins(:start_date).merge(Day.hottest_days)
  end
end
