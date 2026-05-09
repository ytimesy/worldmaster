class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.string :slug
      t.text :summary
      t.text :description
      t.string :status
      t.string :visibility
      t.string :demo_url
      t.string :github_url
      t.string :cover_image_url

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
