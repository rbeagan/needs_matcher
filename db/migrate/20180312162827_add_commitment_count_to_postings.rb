class AddCommitmentCountToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :commitments_count, :integer
  end
end
