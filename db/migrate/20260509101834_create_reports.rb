class CreateReports < ActiveRecord::Migration[7.2]
  def change
    create_table :reports do |t|
      t.references :reporter, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :reason
      t.string :status

      t.timestamps
    end
  end
end
