json.id @customer.id
json.name  @customer.name
json.description @customer.description
json.contact @customer.contact
json.status @customer.status
json.createdAt @customer.created_at

json.notes do
  json.array!(@customer.note) do |note|
    json.(note, :id, :value)
  end
end