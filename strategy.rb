require "strategy/car"
require "strategy/bike"
require "strategy/boat"

class Route
  attr_writer :vehicle

  def initialize(current_location, vehicle)
    @current_location = current_location
    @vehicle = vehicle # the default strategy
    @destination = nil
  end

  def directions(destination)
    @destination = destination
    hours
  end

  private

    def hours
      @vehicle.calculate_route(@current_location, @destination)
    end
end

# Client code

route = Route.new("Home", Strategy::Car.new)
puts "Via Car: #{route.directions('San Francisco')} hours"

route.vehicle = Strategy::Bike.new
puts "Via Bike: #{route.directions('San Francisco')} hours"

route.vehicle = Strategy::Boat.new
puts "Via Boat: #{route.directions('San Francisco')} hours"
