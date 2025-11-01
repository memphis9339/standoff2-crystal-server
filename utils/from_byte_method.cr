require "protobuf"

class FromByteMethod(T)
  def initialize
  end

  def from_bytes(bytes : CrystalProject::BinaryValue) : T?
    return nil if bytes.is_null
    
    {% if T < Array %}
      from_bytes_array(bytes).as(T?)
    {% else %}
    one = bytes.one
    if one
      from_bytes_one(one).as(T?)
    end
    {% end %}
  end

  protected def from_bytes_array(binary_value : CrystalProject::BinaryValue) : Array?
    {% if T < Array %}
      array = Array({{T.type_vars.first}}).new
      
      binary_value.array.each do |item|
        io = IO::Memory.new(item)
        value = {{T.type_vars.first}}.from_protobuf(io)
        array << value
      end
      
      array
    {% else %}
      nil
    {% end %}
  end

  protected def from_bytes_one(bytes : Bytes) : T?
    return nil if bytes.empty?
    
    io = IO::Memory.new(bytes)
    T.from_protobuf(io)
  end
end