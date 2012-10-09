#!/usr/bin/env ruby

require './ssh_tunnel.rb'
require './database.rb'

ssh_url = ARGV[0]
ssh_username = ARGV[1]
ssh_password = ARGV[2]

db_name = ARGV[3]
db_username = ARGV[4]
db_password = ARGV[5]

puts
puts "ssh url:      #{ssh_url}"
puts "ssh username: #{ssh_username}"
puts "ssh password: #{ssh_password}"
puts
puts "db name:      #{db_name}"
puts "db username:  #{db_username}"
puts "db password:  #{db_password}"
puts

ssh_tunnel = SshTunnel.new(ssh_url, ssh_username, ssh_password)
ssh_tunnel.open(3306, 3307)
database = Database.new(ssh_tunnel.port, db_name, db_username, db_password)
database.open

File.open('../runs.csv', 'w') do |file|
    database.retrieve_runs.each do |run|
        line = "#{run.date},#{run.distance.to_s('F')},#{run.time}"
        puts "RUN,#{line}"
        file.puts line
    end
    puts
    file.close
end

File.open('../rides.csv', 'w') do |file|
    database.retrieve_rides.each do |ride|
        line = "#{ride.date},#{ride.distance.to_s('F')},#{ride.max_speed.to_s('F')},#{ride.average_speed.to_s('F')}"
        puts "RIDE,#{line}"
        file.puts line
    end
    puts

    file.close
end

database.close
ssh_tunnel.close

