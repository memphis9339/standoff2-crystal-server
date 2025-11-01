require "../utils/remote_service"

class MarketplaceRemoteService < RemoteService
    def getMarketplaceSettings(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        settings = CrystalProject::MarketplaceSettings.new
        settings.enabled = false

        client.send_response(ToByteMethod(CrystalProject::MarketplaceSettings).new.to_bytes(settings), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getMarketplaceSettings"
            params = request.params
            id = request.id
            if id
                getMarketplaceSettings(params, id, client)
            end
        
        end
    end
end