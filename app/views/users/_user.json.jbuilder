json.extract! user, :id, :email, :password_digest, :display_name, :username, :bio, :website_url, :avatar_url, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
