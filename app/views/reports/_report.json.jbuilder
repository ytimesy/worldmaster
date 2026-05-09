json.extract! report, :id, :reporter_id, :post_id, :reason, :status, :created_at, :updated_at
json.url report_url(report, format: :json)
