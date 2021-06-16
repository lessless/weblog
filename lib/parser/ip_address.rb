# frozen_string_literal: true

require 'ipaddr'

class Parser
  # The IPAddress class represents IP address and associated behavior
  class IPAddress
    def self.valid?(ip_str)
      addr = IPAddr.new(ip_str)
      addr.ipv4? || addr.ipv6?
    rescue IPAddr::InvalidAddressError, IPAddr::AddressFamilyError
      false
    end
  end
end
