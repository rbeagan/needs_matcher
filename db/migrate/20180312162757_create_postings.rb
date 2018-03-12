class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.text :description
      t.integer :volunteers_needed
      t.date :start_date
      t.date :end_date
      t.string :actions
      t.integer :poster_id

      t.timestamps

    end
  end
end
