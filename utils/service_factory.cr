require "./remote_service"
require "../services/google_auth_remote_service"
require "../services/handshake_remote_service"
require "../services/player_remote_service"
require "../services/game_event_remote_service"
require "../services/player_stats_remote_service"
require "../services/chat_remote_service"
require "../services/friends_remote_service"
require "../services/matchmaking_remote_service"
require "../services/marketplace_remote_service"
require "../services/inventory_remote_service"
require "../services/storage_remote_service"
require "../services/gamesettings_remote_service"
require "../services/clan_messages_remote_service"
require "../services/clan_remote_service"


class ServiceFactory
    def self.get_service_by_name(service_name : String) : RemoteService?
        services = [
            ChatRemoteService,
            ClanMessagesRemoteService,
            ClanRemoteService,
            FriendsRemoteService,
            GameEventRemoteService,
            GameSettingsRemoteService,
            GoogleAuthRemoteService,
            HandshakeRemoteService,
            InventoryRemoteService,
            MarketplaceRemoteService,
            MatchmakingRemoteService,
            PlayerRemoteService,
            PlayerStatsRemoteService,
            StorageRemoteService
        ]


        service_type = services.find do |type|
            type <= RemoteService && type.name.downcase.starts_with?(service_name.downcase)
        end
        
        if service_type
            service_type.new
        else
            nil
        end
    end
end