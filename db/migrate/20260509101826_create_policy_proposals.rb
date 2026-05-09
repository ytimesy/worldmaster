class CreatePolicyProposals < ActiveRecord::Migration[7.2]
  def change
    create_table :policy_proposals do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :related_project, foreign_key: { to_table: :projects }
      t.string :title
      t.string :slug
      t.text :summary
      t.text :background
      t.text :problem
      t.text :proposal
      t.text :target_users
      t.text :system_outline
      t.text :expected_effect
      t.text :risks
      t.text :pilot_plan
      t.string :status
      t.string :visibility

      t.timestamps
    end
    add_index :policy_proposals, :slug, unique: true
  end
end
