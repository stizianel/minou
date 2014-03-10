json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :city, :postal_code, :codfisc, :child_name
  json.url customer_url(customer, format: :json)
end
