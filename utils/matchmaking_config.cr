require "json"

class ServerMatchmakingConfig
  property search_range : Array(Int32)
  property region_search_intervals : Hash(String, Int32)
  property calibration_matches : Int32
  property player_ttl : Int32
  property ban_durations : Array(Int32)
  property search_room_create_interval : Int32
  property search_room_size_step : Int32
  property search_step_delay : Int32
  property required_level : Int32

  DEFAULT_SEARCH_INTERVAL_COUNT = 10

  def initialize(
    search_range : Array(Int32),
    region_search_intervals : Hash(String, Int32),
    calibration_matches : Int32,
    player_ttl : Int32,
    ban_durations : Array(Int32),
    search_room_create_interval : Int32,
    search_room_size_step : Int32,
    search_step_delay : Int32,
    required_level : Int32
  )
    @search_range = search_range
    @region_search_intervals = region_search_intervals
    @calibration_matches = calibration_matches
    @player_ttl = player_ttl
    @ban_durations = ban_durations
    @search_room_create_interval = search_room_create_interval
    @search_room_size_step = search_room_size_step
    @search_step_delay = search_step_delay
    @required_level = required_level
  end

  def to_json_h
    {
      "SearchRange" => @search_range,
      "RegionSearchIntervals" => @region_search_intervals,
      "CalibrationMatches" => @calibration_matches,
      "PlayerTTL" => @player_ttl,
      "BanDurations" => @ban_durations,
      "SearchRoomCreateInterval" => @search_room_create_interval,
      "SearchRoomSizeStep" => @search_room_size_step,
      "SearchStepDelay" => @search_step_delay,
      "RequiredLevel" => @required_level
    }
  end

  def to_json
    to_json_h.to_json
  end
end