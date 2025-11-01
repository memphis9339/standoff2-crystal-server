## Generated from structs.proto for crystal_project
require "protobuf"

module CrystalProject
  enum Platform
    UNKNOWN = 0
    Unknown = 0
    ANDROID = 1
    Android = 1
    IOS = 2
    Ios = 2
  end
  enum OnlineStatus
    STATE_OFFLINE = 0
    StateOffline = 0
    STATE_ONLINE = 1
    StateOnline = 1
    STATE_BUSY = 2
    StateBusy = 2
    STATE_AWAY = 3
    StateAway = 3
    STATE_SNOOZE = 4
    StateSnooze = 4
    STATE_LOOKING_TO_TRADE = 5
    StateLookingToTrade = 5
    STATE_LOOKING_TO_PLAY = 6
    StateLookingToPlay = 6
  end
  enum PropertyType
    INT = 0
    Int = 0
    FLOAT = 1
    Float = 1
    STRING = 2
    String = 2
    BOOLEAN = 3
    Boolean = 3
  end
  enum StatDefType
    STATDEF_INT = 0
    STATDEFINT = 0
    STATDEF_FLOAT = 1
    STATDEFFLOAT = 1
    STATDEF_AVGRATE = 2
    STATDEFAVGRATE = 2
  end
  enum RelationshipStatus
    NONE = 0
    None = 0
    BLOCKED = 1
    Blocked = 1
    REQUEST_RECIPIENT = 2
    RequestRecipient = 2
    FRIEND = 3
    Friend = 3
    REQUEST_INITIATOR = 4
    RequestInitiator = 4
    IGNORED = 5
    Ignored = 5
  end
  enum LobbyPlayerType
    ANY = 0
    Any = 0
    MEMBER = 1
    Member = 1
    SPECTATOR = 2
    Spectator = 2
  end
  enum ClanMemberRolePermission
    CHANGE_CLAN_SETTINGS = 0
    ChangeClanSettings = 0
    ACCEPT_MEMBER = 1
    AcceptMember = 1
    INVITE_MEMBER = 2
    InviteMember = 2
    KICK_MEMBER_LESS = 3
    KickMemberLess = 3
    KICK_MEMBER_EQUAL = 4
    KickMemberEqual = 4
    ASSIGN_ROLE_LESS = 5
    AssignRoleLess = 5
    ASSIGN_ROLE_EQUAL = 6
    AssignRoleEqual = 6
    CREATE_CLAN_BATTLE = 7
    CreateClanBattle = 7
    JOIN_CLAN_BATTLE = 8
    JoinClanBattle = 8
    UPGRADE_CLAN_MEMBERS_COUNT = 9
    UpgradeClanMembersCount = 9
  end
  enum SettingType
    SETTING_STRING = 0
    SETTINGSTRING = 0
    SETTING_INTEGER = 1
    SETTINGINTEGER = 1
    SETTING_FLOAT = 2
    SETTINGFLOAT = 2
    SETTING_BOOL = 3
    SETTINGBOOL = 3
  end
  enum PropertySetByType
    GAME_SERVER = 0
    GameServer = 0
    OFFICIAL_GAME_SERVER = 1
    OfficialGameServer = 1
    CLIENT = 2
    Client = 2
  end
  
  struct BinaryValue
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :is_null, :bool, 1
      repeated :array, :bytes, 2
      optional :one, :bytes, 3
    end
  end
  
  struct RpcRequest
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :service_name, :string, 2
      optional :method_name, :string, 3
      repeated :params, BinaryValue, 4
    end
  end
  
  struct Exception
    include ::Protobuf::Message
    
    struct ParamsEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, :string, 2
      end
    end
    
    contract_of "proto3" do
      optional :id, :int64, 1
      optional :code, :int32, 2
      repeated :params, Exception::ParamsEntry, 3
    end
  end
  
  struct RpcResponse
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :exception, Exception, 2
      optional :return, BinaryValue, 3
    end
  end
  
  struct EventResponse
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :listener_name, :string, 1
      optional :event_name, :string, 2
      repeated :params, BinaryValue, 3
    end
  end
  
  struct ResponseMessage
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :rpc_response, RpcResponse, 1
      optional :event_response, EventResponse, 2
    end
  end
  
  struct ProtoBoolean
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :bool, 1
    end
  end
  
  struct BooleanArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :bool, 1
    end
  end
  
  struct Byte
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :bytes, 1
    end
  end
  
  struct ByteArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :bytes, 1
    end
  end
  
  struct Double
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :double, 1
    end
  end
  
  struct DoubleArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :double, 1
    end
  end
  
  struct Enum
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :int32, 1
    end
  end
  
  struct ProtoFloat
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :float, 1
    end
  end
  
  struct FloatArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :float, 1
    end
  end
  
  struct Integer
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :int32, 1
    end
  end
  
  struct IntegerArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :int32, 1
    end
  end
  
  struct Long
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :int64, 1
    end
  end
  
  struct LongArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :int64, 1
    end
  end
  
  struct ProtoString
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :value, :string, 1
    end
  end
  
  struct ProtoStringArray
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :value, :string, 1
    end
  end
  
  struct AuthGoogle
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :game_id, :string, 1
      optional :game_version, :string, 2
      optional :platform, Platform, 3
      optional :auth_code, :string, 4
      optional :locale, :string, 5
    end
  end
  
  struct Handshake
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :ticket, :string, 1
    end
  end
  
  struct Attribute
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :type, PropertyType, 1
      optional :int, :int32, 2
      optional :float, :float, 3
      optional :string, :string, 4
      optional :boolean, :bool, 5
    end
  end
  
  struct Attributes
    include ::Protobuf::Message
    
    struct MapEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, Attribute, 2
      end
    end
    
    contract_of "proto3" do
      repeated :map, Attributes::MapEntry, 1
    end
  end
  
  struct PlayerStatus
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :player_id, :string, 1
      optional :play_in_game, PlayInGame, 2
      optional :online_status, OnlineStatus, 3
    end
  end
  
  struct PhotonGame
    include ::Protobuf::Message
    
    struct CustomPropertiesEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, :string, 2
      end
    end
    
    contract_of "proto3" do
      optional :region, :string, 1
      optional :room_id, :string, 2
      optional :app_version, :string, 3
      repeated :custom_properties, PhotonGame::CustomPropertiesEntry, 4
    end
  end
  
  struct PlayInGame
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :game_code, :string, 1
      optional :game_version, :string, 2
      optional :lobby_id, :string, 3
      optional :photon_game, PhotonGame, 4
    end
  end
  
  struct Player
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :uid, :string, 2
      optional :name, :string, 3
      optional :avatar_id, :string, 4
      optional :time_in_game, :int32, 5
      optional :player_status, PlayerStatus, 6
      optional :logout_date, :int64, 7
      optional :registration_date, :int64, 8
      optional :attributes, Attributes, 9
    end
  end
  
  struct Achievement
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :name, :string, 1
      optional :display_name, :string, 2
      optional :display_description, :string, 3
      optional :unlock_time, :int64, 4
      optional :achieved, :bool, 5
      optional :icon, :bytes, 6
      optional :hidden, :bool, 7
    end
  end
  
  struct PlayerStat
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :name, :string, 1
      optional :int_value, :int32, 2
      optional :float_value, :float, 3
      optional :window, :float, 4
      optional :type, StatDefType, 5
    end
  end
  
  struct Stats
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :stat, PlayerStat, 1
      repeated :achievement, Achievement, 2
    end
  end
  
  struct PlayerFriend
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :player, Player, 1
      optional :relationship_status, RelationshipStatus, 2
      optional :last_relationship_update, :int64, 3
    end
  end
  
  struct LobbyInvite
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :lobby_id, :string, 1
      optional :invite_creator, PlayerFriend, 2
      optional :date, :int64, 3
      optional :player_type, LobbyPlayerType, 4
    end
  end
  
  struct CurrencyAmount
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :currency_id, :int32, 1
      optional :old_value, :int32, 2
      optional :value, :float, 3
    end
  end
  
  struct ClanMemberRole
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :int32, 1
      optional :name, :string, 2
      optional :level, :int32, 3
      optional :descripption, :string, 4
      repeated :permissions, ClanMemberRolePermission, 5
    end
  end
  
  struct ClanSettings
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :initial_members_count, :int32, 1
      optional :members_count_limit, :int32, 2
      optional :memberc_count_upgrade_cost, CurrencyAmount, 3
      optional :change_clan_name_or_tag_cost, CurrencyAmount, 4
      optional :clan_create_cost, CurrencyAmount, 5
    end
  end
  
  struct InventoryItemDefinition
    include ::Protobuf::Message
    
    struct PropertiesEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, :string, 2
      end
    end
    
    contract_of "proto3" do
      optional :id, :int32, 1
      optional :display_name, :string, 2
      repeated :properties, InventoryItemDefinition::PropertiesEntry, 3
      repeated :buy_price, CurrencyAmount, 4
      repeated :sell_price, CurrencyAmount, 5
      optional :can_be_traded, :bool, 6
    end
  end
  
  struct Storage
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :filename, :string, 1
      optional :file, :bytes, 2
    end
  end
  
  struct GameSetting
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :key, :string, 1
      optional :value, :string, 2
      optional :int_value, :int32, 3
      optional :float_value, :float, 4
      optional :bool_value, :bool, 5
      optional :type, SettingType, 6
    end
  end
  
  struct ChatUser
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :player, PlayerFriend, 1
      optional :group, Group, 2
      optional :message, :string, 3
      optional :timestamp, :int64, 4
      optional :unread_msgs_count, :int32, 5
    end
  end
  
  struct Group
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :avatar_id, :string, 3
      repeated :players, Player, 4
    end
  end
  
  struct MarketplaceSettings
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :commission_percent, :float, 1
      optional :min_commission, :float, 2
      optional :currency_id, :int32, 3
      optional :enabled, :bool, 4
    end
  end
  
  struct PlayerInventory
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :currencies, CurrencyAmount, 1
      repeated :inventory_items, InventoryItem, 2
    end
  end
  
  struct InventoryItemProperty
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :type, PropertyType, 1
      optional :int_value, :int32, 2
      optional :float_value, :float, 3
      optional :string_value, :string, 4
      optional :boolean_value, :bool, 5
    end
  end
  
  struct InventoryItem
    include ::Protobuf::Message
    
    struct PropertiesEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, InventoryItemProperty, 2
      end
    end
    
    contract_of "proto3" do
      optional :id, :int32, 1
      optional :item_definition_id, :int32, 2
      optional :quantity, :int32, 3
      optional :flags, :int32, 4
      optional :date, :int64, 5
      repeated :properties, InventoryItem::PropertiesEntry, 6
    end
  end
  
  struct InventoryItemPropertyDefinition
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :name, :string, 1
      optional :property_type, PropertyType, 2
      optional :save_in_trade, :bool, 3
      optional :set_by_type, PropertySetByType, 4
    end
  end
  
  struct InventoryItemPropertyDefinitions
    include ::Protobuf::Message
    
    struct DefinitionsEntry
      include ::Protobuf::Message
      
      contract_of "proto3" do
        optional :key, :string, 1
        optional :value, InventoryItemPropertyDefinition, 2
      end
    end
    
    contract_of "proto3" do
      optional :item_definition_id, :int32, 1
      repeated :definitions, InventoryItemPropertyDefinitions::DefinitionsEntry, 2
    end
  end
  
  struct InventoryItemAmount
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :inventory_item_definition_id, :int32, 1
      optional :value, :int32, 2
    end
  end
  
  struct ExchangeEntity
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :items, InventoryItemAmount, 1
      repeated :currencies, CurrencyAmount, 2
    end
  end
  
  struct RecipeInfo
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :recipe, :string, 1
      repeated :entities, ExchangeEntity, 2
    end
  end
  
  struct RewardInfo
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :items, InventoryItemAmount, 1
      repeated :currencies, CurrencyAmount, 2
      repeated :recipes, RecipeInfo, 3
    end
  end
  
  struct GamePassLevel
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :level, :int32, 1
      optional :min_points, :int32, 2
      optional :reward, RewardInfo, 3
    end
  end
  
  struct GamePass
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :code, :string, 2
      optional :key_item_definition_id, :int32, 3
      repeated :levels, GamePassLevel, 4
      optional :current_level, :int32, 5
    end
  end
  
  struct CurrentGameEvent
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :id, :string, 1
      optional :code, :string, 2
      optional :date_since, :int64, 3
      optional :date_until, :int64, 4
      optional :duration_days, :int32, 5
      repeated :game_passes, GamePass, 6
      optional :points, :int32, 7
      optional :current_day, :int32, 8
    end
  end
  
  struct GetCurrentGameEventsResponse
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :game_events, CurrentGameEvent, 1
    end
  end
  
  struct GetCurrentChallengesResponse
    include ::Protobuf::Message
    
    contract_of "proto3" do
      repeated :challenges, CurrentChallenge, 1
    end
  end
  
  struct LocalizedTitle
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :name, :string, 1
      optional :description, :string, 2
    end
  end
  
  struct DayRange
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :from, :int32, 1
      optional :to, :int32, 2
    end
  end
  
  struct CurrentChallenge
    include ::Protobuf::Message
    
    contract_of "proto3" do
      optional :game_event_challenge_id, :string, 1
      optional :code, :string, 2
      optional :key_item_definition_id, :int32, 3
      optional :localized_title, LocalizedTitle, 4
      optional :action, :string, 5
      optional :day_range, DayRange, 6
      optional :type, :string, 7
      optional :event_points, :int32, 8
      optional :target_points, :int32, 9
      optional :current_points, :int32, 10
      optional :reward, RewardInfo, 11
    end
  end
  end
