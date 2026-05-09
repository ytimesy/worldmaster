class CreateSolutions < ActiveRecord::Migration[7.2]
  def change
    create_table :solutions do |t|
      t.string :title
      t.string :category
      t.text :summary
      t.text :evidence
      t.text :impact
      t.string :url
      t.boolean :published

      t.timestamps
    end
  end
end
