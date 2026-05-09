class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, foreign_key: true
      t.references :policy_proposal, foreign_key: true
      t.references :parent_post, foreign_key: { to_table: :posts }
      t.string :post_type
      t.string :title
      t.text :body
      t.string :visibility
      t.string :status
      t.datetime :published_at
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
