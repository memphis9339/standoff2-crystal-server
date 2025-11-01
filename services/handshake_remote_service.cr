require "../utils/remote_service"

class HandshakeRemoteService < RemoteService
    def protoHandshake(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
    
        args = FromByteMethod(CrystalProject::Handshake).new.from_bytes(params.not_nil![0])
        if args
            puts "ticket from handshake: #{args.ticket}"
        end
    
        client.send_response(ToByteMethod.null, id)
    end
    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "protoHandshake"
            params = request.params
            id = request.id
            if id
                protoHandshake(params, id, client)
            end
            
        end
    end
end