require "../utils/remote_service"

class ClanRemoteService < RemoteService
    def create_role(id, name, desc, level)
        role = CrystalProject::ClanMemberRole.new
        role.id = id
        role.name = name
        role.descripption = desc
        role.level = level
        
        role
    end

    def getPlayerInviteRequestsCount(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod(Int32).new.to_bytes(0), id)
    end

    def getPlayerClosedJoinRequestsCount(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
       client.send_response(ToByteMethod(Int32).new.to_bytes(0), id)
    end

    def getClan(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
       client.send_response(ToByteMethod.null, id)
    end

    def getClanSettings(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
       settings = CrystalProject::ClanSettings.new
       amm = CrystalProject::CurrencyAmount.new
       amm.currency_id = 102
       amm.value = 500

       settings.clan_create_cost = amm
       settings.change_clan_name_or_tag_cost = amm
       settings.initial_members_count = 0
       settings.memberc_count_upgrade_cost = amm
       settings.members_count_limit = 10

       client.send_response(ToByteMethod(CrystalProject::ClanSettings).new.to_bytes(settings), id)
    end

    def getRoles(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
       roles = [] of CrystalProject::ClanMemberRole
       
       member = create_role(1000, "Member", "Clan member role.", 0)
       veteran = create_role(100, "Veteran", "Clan veteran role.", 1)
       co_leader = create_role(10, "Co-Leader", "Clan Co-Leader role.", 2)
       leader = create_role(1, "Leader", "Clan Leader role.", 3)

       roles << member
       roles << veteran
       roles << co_leader
       roles << leader

       client.send_response(ToByteMethod(Array(CrystalProject::ClanMemberRole)).new.to_bytes(roles), id)
    end

    

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getPlayerInviteRequestsCount"
            params = request.params
            id = request.id
            if id
                getPlayerInviteRequestsCount(params, id, client)
            end
        elsif request.method_name == "getPlayerClosedJoinRequestsCount"
            params = request.params
            id = request.id
            if id
                getPlayerClosedJoinRequestsCount(params, id, client)
            end
        elsif request.method_name == "getClan"
            params = request.params
            id = request.id
            if id
                getClan(params, id, client)
            end
        elsif request.method_name == "getClanSettings"
            params = request.params
            id = request.id
            if id
                getClanSettings(params, id, client)
            end
        elsif request.method_name == "getRoles"
            params = request.params
            id = request.id
            if id
                getRoles(params, id, client)
            end
        end
    end
end