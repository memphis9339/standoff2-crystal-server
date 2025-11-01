require "../utils/remote_service"
require "../utils/region"
require "../utils/matchmaking_config"

class GameSettingsRemoteService < RemoteService
    def getGameSettings(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        server = PhotonServer.new("test", "test", "127.0.0.1", "127.0.0.1", true, true).to_json

        search_range = [0, 20, 40, 60, 100, 150, 200]
        region_intervals = {"US" => 10, "EU" => 15}
        ban_durations = [60, 300, 600]

        config = ServerMatchmakingConfig.new(
            search_range,
            region_intervals,
            calibration_matches: 5,
            player_ttl: 100_000,
            ban_durations: ban_durations,
            search_room_create_interval: 4,
            search_room_size_step: 2,
            search_step_delay: 1000,
            required_level: 10
        ).to_json
        
        settings = [] of CrystalProject::GameSetting

        regions = CrystalProject::GameSetting.new
        regions.key = "regions"
        regions.value = server

        matchmaking_config = CrystalProject::GameSetting.new
        matchmaking_config.key = "ranked_client_matchmaking_config"
        matchmaking_config.value = config

        settings << regions
        settings << matchmaking_config

        client.send_response(ToByteMethod(Array(CrystalProject::GameSetting)).new.to_bytes(settings), id)
    end

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getGameSettings"
            params = request.params
            id = request.id
            if id
                getGameSettings(params, id, client)
            end
        
        end
    end
end