require 'mysql2'
require './run.rb'
require './ride.rb'

class Database

    def initialize(port, database, username, password)
        @port = port
        @database = database
        @username = username
        @password = password
    end

    def open
        @client = Mysql2::Client.new(
            host: "127.0.0.1",
            username: @username,
            password: @password,
            database: @database,
            port: @port
        )
    end

    def close
    end        

    def retrieve_runs
        runs = Array.new
        results = @client.query("select ts.date, tr.distance, tr.time from t_sessions ts inner join t_running tr on ts.subsession_id = tr.sub_session_id where ts.user_id = 1 and ts.type_id = 1;")
        results.each do |row|
            runs << Run.new(row['date'], row['distance'], row['time'])
        end
        runs
    end

    def retrieve_rides
        rides = Array.new
        results = @client.query("select ts.date, tc.distance, tc.max_speed, tc.avg_speed from t_sessions ts inner join t_cycling tc on ts.subsession_id = tc.sub_session_id where ts.user_id = 1 and ts.type_id = 3;")
        results.each do |row|
            rides << Ride.new(row['date'], row['distance'], row['max_speed'], row['avg_speed'])
        end
        rides
    end

end

