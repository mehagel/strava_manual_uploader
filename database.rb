require 'mysql2'
require 'net/ssh/gateway'

class Database
    def Open

    end

    def Close

    end        

    def RetrieveRuns
        gateway = Net::SSH::Gateway.new('url-goes-here', 'ssh-user-goes-here', :password => "ssh-password-goes-here")

        port = gateway.open("127.0.0.1",3306,3307)

        client = Mysql2::Client.new(
            host: "127.0.0.1",
            username: "user-goes-here",
            password: "password-goes-here",
            database: "database-goes-here",
            port: port
        )

        results = client.query("select ts.date, tc.distance, tc.max_speed, tc.avg_speed from t_sessions ts inner join t_cycling tc on ts.subsession_id = tc.sub_session_id where ts.user_id = 1 and ts.type_id = 3 limit 12;")
        results.each do |row|
            puts "  date: #{row['date']},  distance: #{row['distance'].to_s('F')},  max: #{row['max_speed'].to_s('F')},  average: #{row['avg_speed'].to_s('F')}"
        end

        gateway.close(port) 
    end

    def RetrieveRides

    end
end
