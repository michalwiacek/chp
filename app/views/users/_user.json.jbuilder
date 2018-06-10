json.extract! user, :id, :first_name, :last_name, :email, :birth_date, :phone, :address_id, :company_id, :created_at, :updated_at
json.url user_url(user, format: :json)
