require "../utils/remote_service"

class GoogleAuthRemoteService < RemoteService
    def protoAuthSecured(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
    
        args = FromByteMethod(CrystalProject::AuthGoogle).new.from_bytes(params.not_nil![0])
        if args
            puts "Client version: #{args.game_version}"
        end
        #i dont know if there is a google api for crystal, so auth code from client isnt handling
    
        response = ToByteMethod(String).new.to_bytes("ISwearThisTokenGood") #spizheno u teylsa
    
        client.send_response(response, id)
    end
    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "protoAuthSecured"
            params = request.params
            id = request.id
            if id
                protoAuthSecured(params, id, client)
            end
        
        end
    end
end