json.extract! post, :id, :user_id, :project_id, :policy_proposal_id, :parent_post_id, :post_type, :title, :body, :visibility, :status, :published_at, :scheduled_at, :created_at, :updated_at
json.url post_url(post, format: :json)
