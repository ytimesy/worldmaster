json.extract! scheduled_post, :id, :user_id, :post_id, :posting_queue_id, :scheduled_at, :status, :error_message, :created_at, :updated_at
json.url scheduled_post_url(scheduled_post, format: :json)
