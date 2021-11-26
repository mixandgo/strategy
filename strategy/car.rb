require "strategy/vehicle"

module Strategy
  class Car < Vehicle
    def calculate_route(source, destination)
      [source.length, source.length].inject(&mul)
    end

  private

    def mul = -> (a, b) { a * b }
  end
end
