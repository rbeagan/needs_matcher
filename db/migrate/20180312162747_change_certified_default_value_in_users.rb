class ChangeCertifiedDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :certified, 'false'
  end
end
