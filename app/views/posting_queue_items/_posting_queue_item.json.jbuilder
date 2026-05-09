json.extract! posting_queue_item, :id, :posting_queue_id, :post_id, :position, :status, :scheduled_at, :published_at, :created_at, :updated_at
json.url posting_queue_item_url(posting_queue_item, format: :json)
