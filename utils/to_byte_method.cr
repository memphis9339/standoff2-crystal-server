require "protobuf"
require "./protoreflectionutils"

class ToByteMethod(T)
  class_property null : CrystalProject::BinaryValue do
    binary_value = CrystalProject::BinaryValue.new
    binary_value.is_null = true
    binary_value
  end

  def initialize
  end

  def to_bytes(arg : T?) : CrystalProject::BinaryValue
    if arg.nil?
      binary_value = CrystalProject::BinaryValue.new
      binary_value.is_null = true
      return binary_value
    end
    {% if T < Array || T < Enumerable %}
      to_bytes_array(arg)
    {% else %}
      binary_value = CrystalProject::BinaryValue.new
      binary_value.is_null = false
      binary_value.one = to_bytes_one(arg)
      binary_value
    {% end %}
  end

  private def to_bytes_array(arg : T) : CrystalProject::BinaryValue
    binary_value = CrystalProject::BinaryValue.new
    binary_value.is_null = false
    
    binary_value.array = [] of Bytes
    
    {% if T < Array || T < Enumerable %}
      arg.each do |item|
        binary_value.array.not_nil! << to_bytes_one(item)
      end
    {% end %}
    binary_value
  end

  protected def to_bytes_one(arg) : Bytes
    proto_value = ProtoReflectionUtils.to_proto_value(arg)
    
    io = IO::Memory.new
    proto_value.to_protobuf(io)
    io.to_slice
  end
end