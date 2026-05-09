class CreateScheduledPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :scheduled_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :posting_queue, foreign_key: { to_table: :posting_queues }
      t.datetime :scheduled_at
      t.string :status
      t.text :error_message

      t.timestamps
    end
  end
end
