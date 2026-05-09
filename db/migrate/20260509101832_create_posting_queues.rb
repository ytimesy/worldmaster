class CreatePostingQueues < ActiveRecord::Migration[7.2]
  def change
    create_table :posting_queues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :interval_minutes
      t.datetime :start_at
      t.datetime :next_run_at
      t.string :status

      t.timestamps
    end
  end
end
