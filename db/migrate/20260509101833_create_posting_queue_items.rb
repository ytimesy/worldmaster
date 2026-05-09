class CreatePostingQueueItems < ActiveRecord::Migration[7.2]
  def change
    create_table :posting_queue_items do |t|
      t.references :posting_queue, null: false, foreign_key: { to_table: :posting_queues }
      t.references :post, null: false, foreign_key: true
      t.integer :position
      t.string :status
      t.datetime :scheduled_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
