class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :policy_proposal, null: false, foreign_key: true
      t.references :parent_post, null: false, foreign_key: true
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
