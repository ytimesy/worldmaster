json.extract! project, :id, :owner_id, :title, :slug, :summary, :description, :status, :visibility, :demo_url, :github_url, :cover_image_url, :created_at, :updated_at
json.url project_url(project, format: :json)
