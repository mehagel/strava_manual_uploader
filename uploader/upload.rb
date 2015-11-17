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
puts

# strava = StravaWrapper.new
# strava.connect
# strava.login(email, password)

f = File.open("../runs.csv", "r")
f.each_line { |line|
      # each line has fields separated by commas, so split those fields
    # p=Person.new

    puts fields = line.split(' ')
    puts fields[1].to_s(' , ').split
    # puts "MARK"
    # puts fields[3].to_s(' ').strip


  # do a little work here to get rid of double-quotes and blanks
  # p.last_name = fields[0].tr_s('"', '').strip
  # p.first_name = fields[1].tr_s('"', '').strip
  # p.city = fields[2].tr_s('"', '').strip
  # people.push(p)
}





# CSV.foreach("../runs.csv") do |row|
#   puts row.each_slice(",").to_a
#     puts "NEW"
#     # puts row
# end

# # load runs file
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
