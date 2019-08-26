json.extract! complaint, :id, :name, :email, :phone, :order_number, :zip_code, :description, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
