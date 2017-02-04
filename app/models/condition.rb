class Condition < ApplicationRecord
  belongs_to :date
  has_many :trips, through: :date
end
