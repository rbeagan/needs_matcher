class CreateTaggingJoins < ActiveRecord::Migration
  def change
    create_table :tagging_joins do |t|
      t.integer :tag_id
      t.integer :posting_id

      t.timestamps

    end
  end
end
