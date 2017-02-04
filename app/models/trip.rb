class Trip < ApplicationRecord
  belongs_to :subscription_type
  belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id
  belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id
  belongs_to :start_date, class_name: :Day, foreign_key: :start_date_id
  belongs_to :end_date, class_name: :Day, foreign_key: :end_date_id
end
