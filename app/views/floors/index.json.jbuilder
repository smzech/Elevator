json.array!(@floors) do |floor|
  json.extract! floor, :id, :name
  json.url floor_url(floor, format: :json)
end
