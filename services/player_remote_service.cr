require "../utils/remote_service"

class PlayerRemoteService < RemoteService
    def getPlayer(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        player = CrystalProject::Player.new
        player.id = "CrystalProject"
        player.uid = "1337"
        player.name = "CrystalProject"
        player.avatar_id = ""
        player.time_in_game = 9339
        player.registration_date = 1337

        client.send_response(ToByteMethod(CrystalProject::Player).new.to_bytes(player), id)
    end

    def setPlayerFirebaseToken(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod.null, id)
    end
    
    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getPlayer"
            params = request.params
            id = request.id
            if id
                getPlayer(params, id, client)
            end
        elsif request.method_name == "setPlayerFirebaseToken"
             params = request.params
            id = request.id
            if id
                setPlayerFirebaseToken(params, id, client)
            end
        end
    end
end