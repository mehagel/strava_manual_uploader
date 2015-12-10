#!/usr/bin/env ruby

require './ride.rb'
require './run.rb'
require './strava_wrapper.rb'
require  'csv'

people = Array.new

email = ARGV[0]
password = ARGV[1]

if email.nil? || password.nil?
    puts "Please provide email and password arguments"
    exit
end

puts "Strava credentials:"
puts "  Email:    #{email}"
puts "  Password: #{password}"

strava = StravaWrapper.new
strava.connect
strava.login(email, password)
# load runs file
    CSV.foreach("../runs.csv") do |row|
      puts duration = row[-1]
      puts date = row[0]
      puts distance= row [1]
      end
# File.open('../runs.csv', 'r') do |file|
#     while (line = file.gets)
#         if line.length > 0
#             run = Run.new(line)
#             puts "RUN:  "
#             puts "  Name:     #{run.name}"
#             puts "  Date:     #{run.date}"
#             puts "  Duration: #{run.duration}"
#             puts "  Distance: #{run.distance}"
#             puts
#             strava.upload_run(run)
#         end
#     end
#     file.close
# end

# load rides file
# File.open('../rides.csv', 'r') do |file|
#     while (line = file.gets)
#         if line.length > 0
#             ride = Ride.new(line)
#             puts "RIDE: "
#             puts "  Name:     #{ride.name}"
#             puts "  Date:     #{ride.date}"
#             puts "  Duration: #{ride.duration}"
#             puts "  Distance: #{ride.distance}"
#             puts
#             strava.upload_ride(ride)
#         end
#     end
#     file.close
# end

# strava.close
