require "../utils/remote_service"

class MatchmakingRemoteService < RemoteService
    def getInvitesToLobby(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        invite = CrystalProject::LobbyInvite.new
    
        client.send_response(ToByteMethod(CrystalProject::LobbyInvite).new.to_bytes(invite), id)
    end
    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getInvitesToLobby"
            params = request.params
            id = request.id
            if id
                getInvitesToLobby(params, id, client)
            end
        
        end
    end
end