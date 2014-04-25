class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :from
      t.string :to
      t.date :departuredate
      t.date :arrivedate

      t.timestamps
    end
  end
end
