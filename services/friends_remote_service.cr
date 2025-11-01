require "../utils/remote_service"

class FriendsRemoteService < RemoteService
    def getPlayerFriendsIds(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod(String).new.to_bytes(""), id)
    end

    def getPlayerFriends(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        friend = CrystalProject::PlayerFriend.new

        client.send_response(ToByteMethod(CrystalProject::PlayerFriend).new.to_bytes(friend), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getPlayerFriendsIds"
            params = request.params
            id = request.id
            if id
                getPlayerFriendsIds(params, id, client)
            end
        elsif request.method_name == "getPlayerFriends"
            params = request.params
            id = request.id
            if id
                getPlayerFriends(params, id, client)
            end
        end
    end
end