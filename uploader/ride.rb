class Ride

    attr_accessor :name, :date, :duration, :distance

    def initialize(line)
        parts = line.split(',')

        @distance = Float(parts[1])

        average_speed = Float(parts[3]) # mph
        time = @distance / average_speed
        hours = Integer(time).to_s
        if hours.length == 1
            hours = '0' + hours
        end
        minutes = (Integer(time * 60.0) % 60).to_s
        if minutes.length == 1
            minutes = '0' + minutes
        end
        seconds = (Integer(time * 3600.0) % 60).to_s
        if seconds.length == 1
            seconds = '0' + seconds
        end
        @duration = "#{hours}:#{minutes}:#{seconds}"

        # date format required is dd/mm/yyyy
        year = parts[0][0..3]
        month = parts[0][5..6]
        day = parts[0][8..9]
        @date = "#{day}/#{month}/#{year}"

        @name = "#{parts[0]} - Ride"
    end

end
