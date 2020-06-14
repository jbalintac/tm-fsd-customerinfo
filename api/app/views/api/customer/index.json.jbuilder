json.array! @customers do |customer|
  json.id customer.id
  json.name customer.name
  json.description customer.description
  json.status customer.status
  json.contact customer.contact
  json.createdAt customer.created_at
  
  json.notes do
    json.array!(customer.note) do |note|
      json.(note, :id, :value)
    end
  end
end