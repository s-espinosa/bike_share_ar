class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :dock_count
      t.references :city, foreign_key: true
      t.date :installation_date
    end
  end
end
