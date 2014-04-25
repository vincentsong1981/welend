class AddFlyingTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flying_time, :time
  end
end
