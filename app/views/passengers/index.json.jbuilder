json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :name, :car_id, :floor_id
  json.url passenger_url(passenger, format: :json)
end
