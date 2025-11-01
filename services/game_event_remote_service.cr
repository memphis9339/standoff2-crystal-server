require "../utils/remote_service"

class GameEventRemoteService < RemoteService
  def getCurrentGameEvents(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
    response = CrystalProject::GetCurrentGameEventsResponse.new
    response.game_events = [] of CrystalProject::CurrentGameEvent
    
    game_event = CrystalProject::CurrentGameEvent.new
    game_event.id = "1"
    game_event.code = ""
    game_event.date_since = Time.utc.to_unix_ms
    game_event.date_until = (Time.utc + 30.days).to_unix_ms
    game_event.duration_days = 30
    game_event.points = 0
    game_event.current_day = 1
    game_event.game_passes = [] of CrystalProject::GamePass
    
    free_pass = CrystalProject::GamePass.new
    free_pass.id = "pass"
    free_pass.code = "Free Pass"
    free_pass.key_item_definition_id = 0
    free_pass.current_level = 1
    
    gold_pass = CrystalProject::GamePass.new
    gold_pass.id = "pass2"
    gold_pass.code = "Gold Pass"
    gold_pass.key_item_definition_id = 602
    gold_pass.current_level = 1
    
    game_event.game_passes.not_nil! << free_pass
    game_event.game_passes.not_nil! << gold_pass
    
    response.game_events.not_nil! << game_event
    
    client.send_response(ToByteMethod(CrystalProject::GetCurrentGameEventsResponse).new.to_bytes(response), id)
  end
  
  def getCurrentChallenges(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
    response = CrystalProject::GetCurrentChallengesResponse.new
    response.challenges = [] of CrystalProject::CurrentChallenge
    
    challenge = CrystalProject::CurrentChallenge.new
    challenge.game_event_challenge_id = ""
    challenge.code = ""
    challenge.key_item_definition_id = 1001
    challenge.action = ""
    challenge.type = ""
    challenge.event_points = 100
    challenge.target_points = 500
    challenge.current_points = 250
    
    challenge.localized_title = CrystalProject::LocalizedTitle.new
    challenge.localized_title.not_nil!.name = "www"
    challenge.localized_title.not_nil!.description = "zzzz"
    
    challenge.day_range = CrystalProject::DayRange.new
    challenge.day_range.not_nil!.from = 1
    challenge.day_range.not_nil!.to = 7
    
    challenge.reward = CrystalProject::RewardInfo.new
    challenge.reward.not_nil!.items = [] of CrystalProject::InventoryItemAmount
    challenge.reward.not_nil!.currencies = [] of CrystalProject::CurrencyAmount
    challenge.reward.not_nil!.recipes = [] of CrystalProject::RecipeInfo
    
    item1 = CrystalProject::InventoryItemAmount.new
    item1.inventory_item_definition_id = 2001
    item1.value = 5
    challenge.reward.not_nil!.items.not_nil! << item1
    
    item2 = CrystalProject::InventoryItemAmount.new
    item2.inventory_item_definition_id = 2002
    item2.value = 10
    challenge.reward.not_nil!.items.not_nil! << item2
    
    currency1 = CrystalProject::CurrencyAmount.new
    currency1.currency_id = 1
    currency1.old_value = 1000
    currency1.value = 1000.0
    challenge.reward.not_nil!.currencies.not_nil! << currency1
    
    currency2 = CrystalProject::CurrencyAmount.new
    currency2.currency_id = 2
    currency2.old_value = 50
    currency2.value = 50.0
    challenge.reward.not_nil!.currencies.not_nil! << currency2
    
    recipe = CrystalProject::RecipeInfo.new
    recipe.recipe = "zzzzz"
    recipe.entities = [] of CrystalProject::ExchangeEntity
    
    entity = CrystalProject::ExchangeEntity.new
    entity.items = [] of CrystalProject::InventoryItemAmount
    entity.currencies = [] of CrystalProject::CurrencyAmount
    
    entity_item1 = CrystalProject::InventoryItemAmount.new
    entity_item1.inventory_item_definition_id = 3001
    entity_item1.value = 2
    entity.items.not_nil! << entity_item1
    
    entity_item2 = CrystalProject::InventoryItemAmount.new
    entity_item2.inventory_item_definition_id = 3002
    entity_item2.value = 3
    entity.items.not_nil! << entity_item2
    
    entity_currency = CrystalProject::CurrencyAmount.new
    entity_currency.currency_id = 1
    entity_currency.old_value = 100
    entity_currency.value = 100.0
    entity.currencies.not_nil! << entity_currency
    
    recipe.entities.not_nil! << entity
    challenge.reward.not_nil!.recipes.not_nil! << recipe
    
    response.challenges.not_nil! << challenge
    #zaglushki i t.d.
    
    client.send_response(ToByteMethod(CrystalProject::GetCurrentChallengesResponse).new.to_bytes(response), id)
  end
  
  def invoke(request : CrystalProject::RpcRequest, client : UserClient)
    if request.method_name == "getCurrentGameEvents"
      params = request.params
      id = request.id
      if id
        getCurrentGameEvents(params, id, client)
      end
    elsif request.method_name == "getCurrentChallenges"
      params = request.params
      id = request.id
      if id
        getCurrentChallenges(params, id, client)
      end
    end
  end
end