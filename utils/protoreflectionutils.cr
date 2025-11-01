require "protobuf"

class ProtoReflectionUtils
  def self.to_proto_value(value)
    case value
    when Int32
      msg = CrystalProject::Integer.new
      msg.value = value
      msg
    when Array(Int32)
      msg = CrystalProject::IntegerArray.new
      value.each { |v| msg.value << v }
      msg
    when Float32
      msg = CrystalProject::ProtoFloat.new
      msg.value = value
      msg
    when Array(Float32)
      msg = CrystalProject::FloatArray.new
      value.each { |v| msg.value << v }
      msg
    when Int64
      msg = CrystalProject::Long.new
      msg.value = value
      msg
    when Array(Int64)
      msg = CrystalProject::LongArray.new
      value.each { |v| msg.value << v }
      msg
    when String
      msg = CrystalProject::ProtoString.new
      msg.value = value
      msg
    when Array(String)
      msg = CrystalProject::ProtoStringArray.new
      value.each { |v| msg.value << v }
      msg
    when Float64
      msg = CrystalProject::Double.new
      msg.value = value
      msg
    when Array(Float64)
      msg = CrystalProject::DoubleArray.new
      value.each { |v| msg.value << v }
      msg
    when Bool
      msg = CrystalProject::ProtoBoolean.new
      msg.value = value
      msg
    when Array(Bool)
      msg = CrystalProject::BooleanArray.new
      value.each { |v| msg.value << v }
      msg
    when Bytes
      msg = CrystalProject::Byte.new
      msg.value = value
      msg
    when Array(Bytes)
      msg = CrystalProject::ByteArray.new
      value.each { |v| msg.value << v }
      msg
    else
      value
    end
  end

  def self.to_orig_value(proto_value)
    case proto_value
    when CrystalProject::Integer
      proto_value.value
    when CrystalProject::IntegerArray
      proto_value.value.to_a
    when CrystalProject::Float
      proto_value.value
    when CrystalProject::FloatArray
      proto_value.value.to_a
    when CrystalProject::Long
      proto_value.value
    when CrystalProject::LongArray
      proto_value.value.to_a
    when CrystalProject::ProtoString
      proto_value.value
    when CrystalProject::ProtoStringArray
      proto_value.value.to_a
    when CrystalProject::Double
      proto_value.value
    when CrystalProject::DoubleArray
      proto_value.value.to_a
    when CrystalProject::Boolean
      proto_value.value
    when CrystalProject::BooleanArray
      proto_value.value.to_a
    when CrystalProject::Byte
      proto_value.value
    when CrystalProject::ByteArray
      proto_value.value.to_a
    else
      proto_value
    end
  end
end