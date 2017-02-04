class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.integer :start_date_id
      t.integer :end_date_id
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :bike_id
      t.references :subscription_type, foreign_key: true
      t.string :zip_code
    end
  end
end
