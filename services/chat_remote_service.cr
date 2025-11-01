require "../utils/remote_service"

class ChatRemoteService < RemoteService
    def getUnreadChatUsersCount(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod(Int32).new.to_bytes(0), id)
    end

    def getChatUsers(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        user = CrystalProject::ChatUser.new
        user.message = "xz"
        user.timestamp = 0
        user.unread_msgs_count = 0

        client.send_response(ToByteMethod(CrystalProject::ChatUser).new.to_bytes(user), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getUnreadChatUsersCount"
            params = request.params
            id = request.id
            if id
                getUnreadChatUsersCount(params, id, client)
            end
        elsif request.method_name == "getChatUsers"
            params = request.params
            id = request.id
            if id
                getChatUsers(params, id, client)
            end
        end
    end
end