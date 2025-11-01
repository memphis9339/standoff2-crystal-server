require "../utils/remote_service"

class ClanMessagesRemoteService < RemoteService
    def getUnreadChatMessagesCount(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod(Int32).new.to_bytes(0), id)
    end

    def getUnreadLogMessagesCount(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
       client.send_response(ToByteMethod(Int32).new.to_bytes(0), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getUnreadChatMessagesCount"
            params = request.params
            id = request.id
            if id
                getUnreadChatMessagesCount(params, id, client)
            end
        elsif request.method_name == "getUnreadLogMessagesCount"
            params = request.params
            id = request.id
            if id
                getUnreadLogMessagesCount(params, id, client)
            end
        end
    end
end