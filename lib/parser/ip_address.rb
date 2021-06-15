require 'ipaddr'

class Parser
  class IPAddress
    def self.valid?(ip_str)
      addr = IPAddr.new(ip_str)
      addr.ipv4? || addr.ipv6?
    rescue IPAddr::InvalidAddressError
      false
    end
  end
end
