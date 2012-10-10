class Run

    attr_accessor :name, :date, :duration, :distance

    def initialize(line)
        parts = line.split(',')

        @distance = parts[1]

        totalSeconds = Integer(parts[2])
        hours = (totalSeconds / 3600).to_s
        if hours.length == 1
            hours = '0' + hours
        end
        minutes = ((totalSeconds % 3600) / 60).to_s
        if minutes.length == 1
            minutes = '0' + minutes
        end
        seconds = (totalSeconds % 60).to_s
        if seconds.length == 1
            seconds = '0' + seconds
        end
        @duration = "#{hours}:#{minutes}:#{seconds}"
        
        # date format required is dd/mm/yyyy
        year = parts[0][0..3]
        month = parts[0][5..6]
        day = parts[0][8..9]
        @date = "#{day}/#{month}/#{year}"

        @name = "#{parts[0]} - Run"
    end
    
end
