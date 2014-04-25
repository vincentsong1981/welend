class AddFlightModelToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flight_model, :string
  end
end
