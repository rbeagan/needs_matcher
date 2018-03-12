class AddCommitmentCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :commitments_count, :integer
  end
end
