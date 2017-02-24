class City < ApplicationRecord
  has_many :stations

  def average_docks
    stations.average_dock_count
  end
end
