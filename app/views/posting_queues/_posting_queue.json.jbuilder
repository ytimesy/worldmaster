json.extract! posting_queue, :id, :user_id, :title, :interval_minutes, :start_at, :next_run_at, :status, :created_at, :updated_at
json.url posting_queue_url(posting_queue, format: :json)
