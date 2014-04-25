class AddStartTimeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :start_time, :time
  end
end
