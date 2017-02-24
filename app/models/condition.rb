class Condition < ApplicationRecord
  belongs_to :day
  has_many :started_trips, through: :day
  has_many :ended_trips, through: :day
end
