class AddHomeAddressFormattedAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home_address_formatted_address, :string
  end
end
