class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :user_id
      t.integer :posting_id

      t.timestamps

    end
  end
end
