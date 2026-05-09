class CreateEvaluations < ActiveRecord::Migration[7.2]
  def change
    create_table :evaluations do |t|
      t.references :solution, null: false, foreign_key: true
      t.text :result
      t.integer :rating
      t.date :published_at

      t.timestamps
    end
  end
end
