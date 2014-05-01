module VehiclesHelper

  def vehicle_state(vehicle)
    content_tag :span do
      "(#{vehicle.state})"
    end
  end

  def mileage_reading(vehicle)
    reading = vehicle.mileages.empty? ? 0.00 : round_off(vehicle.mileages.last.reading,2)
  end

end
