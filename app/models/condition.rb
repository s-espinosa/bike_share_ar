class Condition < ApplicationRecord
  belongs_to :day
  has_many :trips, through: :date
end
