json.extract! policy_proposal, :id, :owner_id, :related_project_id, :title, :slug, :summary, :background, :problem, :proposal, :target_users, :system_outline, :expected_effect, :risks, :pilot_plan, :status, :visibility, :created_at, :updated_at
json.url policy_proposal_url(policy_proposal, format: :json)
