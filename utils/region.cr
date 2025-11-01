require "json"

class PhotonServer
  property location : String
  property display_name : String
  property dns : String
  property ip : String
  property enabled : Bool
  property online : Bool

  def initialize(location : String, display_name : String, dns : String, ip : String, online : Bool, enabled : Bool)
    @location = location
    @display_name = display_name
    @dns = dns
    @ip = ip
    @enabled = enabled
    @online = online
  end

  def valid? : Bool
    !@location.empty? && !@display_name.empty? && !@dns.empty? && !@ip.empty?
  end

  def to_json_h
    {
      "Location" => @location,
      "DisplayName" => @display_name,
      "Dns" => @dns,
      "Ip" => @ip,
      "Enabled" => @enabled,
      "Online" => @online
    }
  end

  def to_json
    { "Servers" => [self].map(&.to_json_h) }.to_json
  end
end
