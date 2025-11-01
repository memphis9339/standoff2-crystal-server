require "socket"
require "./protos/structs.pb"
require "./utils/remote_service"
require "./utils/service_factory"
require "./utils/user_client"

def send_pong(stream)
  stream.read(Bytes.new(1))
  pong = Bytes.new(5)
  IO::ByteFormat::BigEndian.encode(1_u32, pong)
  pong[4] = 1_u8
  stream.write(pong)
end

server = TCPServer.new("0.0.0.0", 2222)
puts "CrystalProject started at 0.0.0.0:2222"

loop do
  client = server.accept
  puts "Connected: #{client.remote_address}"

  spawn do
    user_client = UserClient.new(client)

    begin
      loop do
        header = Bytes.new(4)
        bytes_read = client.read_fully?(header)

        break unless bytes_read

        data_length = IO::ByteFormat::BigEndian.decode(UInt32, header)
        if data_length == 1
          send_pong(client)
          next
        end
        payload = Bytes.new(data_length)

        bytes_read = client.read_fully?(payload)
        break unless bytes_read

        io = IO::Memory.new(payload)
        request = CrystalProject::RpcRequest.from_protobuf(io)

        puts "Received: #{request.service_name}.#{request.method_name}"
        service_name = request.service_name

        if service_name
          service = ServiceFactory.get_service_by_name(service_name)
          if service
            service.invoke(request, user_client)
          else
            puts "Gotcha unhandled service #{request.service_name}.#{request.method_name}!"
          end
        else
          nil
        end
      end

    rescue ex
      puts "Err: #{ex}"
    ensure
      client.close
      puts "Connection closed"
    end
  end
end
