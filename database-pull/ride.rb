class Ride

    attr_accessor :date, :distance, :max_speed, :average_speed

    def initialize(date, distance, max_speed, average_speed)
        @date = date
        @distance = distance
        @max_speed = max_speed
        @average_speed = average_speed        
    end

end
