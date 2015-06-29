module PassengersHelper
  def car_name(passenger)
    if passenger.car.nil?
      "Not Assigned"
    else
      passenger.car.name
    end
  end
end
