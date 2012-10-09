require 'net/ssh/gateway'

class SshTunnel
    
    attr_accessor :port

    def initialize(url, username, password)
        @url = url
        @username = username
        @password = password
    end

    def open(port, local_port)
        @gateway = Net::SSH::Gateway.new(@url, @username, :password => @password)
        @port = @gateway.open('127.0.0.1', port, local_port)
    end

    def close
        @gateway.close(@port)
    end

end
