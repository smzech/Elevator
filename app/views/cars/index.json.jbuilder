json.array!(@cars) do |car|
  json.extract! car, :id, :name, :direction, :floor_id
  json.url car_url(car, format: :json)
end
