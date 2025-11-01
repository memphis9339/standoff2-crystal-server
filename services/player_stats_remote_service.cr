require "../utils/remote_service"

class PlayerStatsRemoteService < RemoteService
  def get_default_stats : Array(Hash(String, Int32 | String))
    stat_names = [
      "level_id",
      "level_xp",
      "ranked_calibration_match_count",
      "ranked_ban_code",
      "ranked_ban_duration",
      "ranked_last_activity_time1",
      "ranked_last_activity_time2",
      "ranked_rank",
      "ranked_current_mmr",
      "ranked_won_match_count",
      "ranked_last_match_status",
      "deathmatch_games_played",
      "defuse_games_played",
      "deathmatch_shots",
      "defuse_shots",
      "deathmatch_hits",
      "defuse_hits",
      "deathmatch_kills",
      "defuse_kills",
      "deathmatch_headshots",
      "defuse_headshots",
      "deathmatch_deaths",
      "defuse_deaths",
      "deathmatch_assists",
      "defuse_assists",
      "ranked_rank",
    ]

    guns = [
      "g22", "usp", "p350", "deagle", "ump45", "mp7", "p90",
      "akr", "akr12", "m4", "m16", "famas", "awm", "m40", "sm1014",
    ]

    guns.each do |gun|
      stat_names << "gun_deathmatch_#{gun}_kills"
      stat_names << "gun_defuse_#{gun}_kills"
      stat_names << "gun_deathmatch_#{gun}_shots"
      stat_names << "gun_defuse_#{gun}_shots"
      stat_names << "gun_deathmatch_#{gun}_hits"
      stat_names << "gun_defuse_#{gun}_hits"
    end

    stat_names.map do |name|
      { "Name" => name, "IntValue" => 0 }
    end
  end

  def getStats(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
    stats = CrystalProject::Stats.new

    stat_list = get_default_stats
    stats.stat = [] of CrystalProject::PlayerStat
    stat_list.each do |stat|
        player_stat = CrystalProject::PlayerStat.new
        player_stat.name = stat["Name"].to_s
        player_stat.int_value = stat["IntValue"].as(Int32)
        stats.stat.not_nil! << player_stat
    end
    client.send_response(ToByteMethod(CrystalProject::Stats).new.to_bytes(stats), id)
  end

  def invoke(request : CrystalProject::RpcRequest, client : UserClient)
    if request.method_name == "getStats"
      params = request.params
      id = request.id

      if id
        getStats(params, id, client)
      end
    
    end
  end
end
