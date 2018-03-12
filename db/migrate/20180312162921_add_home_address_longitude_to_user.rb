class AddHomeAddressLongitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home_address_longitude, :float
  end
end
