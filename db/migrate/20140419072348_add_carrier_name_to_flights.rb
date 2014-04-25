class AddCarrierNameToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :carrier_name, :string
  end
end
