require "../utils/remote_service"

class StorageRemoteService < RemoteService
    def readAllFiles(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        storage = CrystalProject::Storage.new
        storage.filename = "crystal_project"

        client.send_response(ToByteMethod(CrystalProject::Storage).new.to_bytes(storage), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "readAllFiles"
            params = request.params
            id = request.id
            if id
                readAllFiles(params, id, client)
            end
        
        end
    end
end
