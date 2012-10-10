#!/usr/bin/env ruby

require './ride.rb'
require './run.rb'

# load rides file
File.open('../rides.csv', 'r') do |file|
    while (line = file.gets)
        if line.length > 0
            ride = Ride.new(line)
        end
    end
    file.close
end

# load runs file
File.open('../runs.csv', 'r') do |file|
    while (line = file.gets)
        if line.length > 0
            ride = Run.new(line)
        end
    end
    file.close
end

