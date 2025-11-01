class UserClient
    property socket : TCPSocket

    def initialize(socket : TCPSocket)
        @socket = socket
    end

    def send_response(data : CrystalProject::BinaryValue, id : String)
        response_message = CrystalProject::ResponseMessage.new
        rpc_response = CrystalProject::RpcResponse.new
        rpc_response.id = id
        rpc_response.return = data
        response_message.rpc_response = rpc_response
    
        encoded = IO::Memory.new
        response_message.to_protobuf(encoded)
        encoded_bytes = encoded.to_slice
    
        buffer = IO::Memory.new
        buffer.write_bytes(encoded_bytes.size.to_u32, IO::ByteFormat::BigEndian)
        buffer.write(encoded_bytes)
    
        @socket.write(buffer.to_slice)
        @socket.flush
    end
    #here u can implementate other methods like send_event and etc..
end