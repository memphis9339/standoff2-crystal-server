require "../utils/remote_service"

class InventoryRemoteService < RemoteService
    def create_item_def(item_def_id, display_name, can_be_traded, collection, rarity = nil, buy_currency_id = nil, buy_value = nil)
        #can be traded = can be saled on marketplace
        item = CrystalProject::InventoryItemDefinition.new
        item.id = item_def_id
        item.display_name = display_name
        item.properties = [] of CrystalProject::InventoryItemDefinition::PropertiesEntry
    
        collection_entry = CrystalProject::InventoryItemDefinition::PropertiesEntry.new
        collection_entry.key = "collection"
        collection_entry.value = collection.to_s
        item.properties.not_nil! << collection_entry
    
        if rarity
            rarity_entry = CrystalProject::InventoryItemDefinition::PropertiesEntry.new
            rarity_entry.key = "value"
            rarity_entry.value = rarity.to_s
            item.properties.not_nil! << rarity_entry
        end
    
        item.can_be_traded = can_be_traded
        
        item.buy_price = [] of CrystalProject::CurrencyAmount
        if buy_currency_id && buy_value
            buy_price = CrystalProject::CurrencyAmount.new
            buy_price.currency_id = buy_currency_id
            buy_price.old_value = 0
            buy_price.value = buy_value.to_f32
            item.buy_price.not_nil! << buy_price
        end
        
        item
    end

    def create_inventory_item(item_id, item_def_id)
        #can be traded = can be saled on marketplace

        item = CrystalProject::InventoryItem.new
        item.id = item_id
        item.item_definition_id = item_def_id
        item.quantity = 1
        item.flags = 0
        item.date = 0

        item
    end

    def getInventoryItemDefinitions(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        result = [] of CrystalProject::InventoryItemDefinition
        #im too lazy to add every weapon, so here only 1 knife and basic cases
        butterfly = create_item_def(47503, "Butterfly \"Dragon Glass\"", false, 9, 6)

        origin_case = create_item_def(301, "Origin Case", false, 2, nil, 102, 100)
        origin_box = create_item_def(401, "Origin Box", false, 2, nil, 101, 100)

        furious_case = create_item_def(302, "Furious Case", false, 4, nil, 102, 100)
        furious_box = create_item_def(402, "Furious Box", false, 4, nil, 101, 100)

        rival_case = create_item_def(303, "Rival Case", false, 6, nil, 102, 100)
        rival_box = create_item_def(403, "Rival Box", false, 6, nil, 101, 100)

        fable_case = create_item_def(304, "Fable Case", false, 8, nil, 102, 100)
        fable_box = create_item_def(404, "Fable Box", false, 8, nil, 101, 100)

        result << butterfly
        result << origin_case
        result << origin_box
        result << furious_case
        result << furious_box
        result << rival_case
        result << rival_box
        result << fable_case
        result << fable_box

        client.send_response(ToByteMethod(Array(CrystalProject::InventoryItemDefinition)).new.to_bytes(result), id)
    end

    def getPlayerInventory(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        inv = CrystalProject::PlayerInventory.new

        inv.inventory_items = [] of CrystalProject::InventoryItem
        inv.currencies = [] of CrystalProject::CurrencyAmount

        gold = CrystalProject::CurrencyAmount.new
        gold.currency_id = 102
        gold.value = 1337

        silver = CrystalProject::CurrencyAmount.new
        silver.currency_id = 101
        silver.value = 9339

        item = create_inventory_item(0, 47503)
        inv.inventory_items.not_nil! << item

        inv.currencies.not_nil! << gold
        inv.currencies.not_nil! << silver
        client.send_response(ToByteMethod(CrystalProject::PlayerInventory).new.to_bytes(inv), id)
    end

   def getInventoryItemPropertyDefinitions(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        define = CrystalProject::InventoryItemPropertyDefinitions.new
        propert = CrystalProject::InventoryItemPropertyDefinition.new
        propert.name = "xz"
        define.definitions = [] of CrystalProject::InventoryItemPropertyDefinitions::DefinitionsEntry
  
        entry = CrystalProject::InventoryItemPropertyDefinitions::DefinitionsEntry.new
        entry.key = "xz"
        entry.value = propert
  
        define.definitions.not_nil! << entry
  
        define.item_definition_id = 71005
        client.send_response(ToByteMethod(CrystalProject::InventoryItemPropertyDefinitions).new.to_bytes(define), id)
    end

    def setInventoryItemFlags(params : Array(CrystalProject::BinaryValue)?, id : String, client : UserClient)
        client.send_response(ToByteMethod.null, id)
    end
    
    

    def invoke(request : CrystalProject::RpcRequest, client : UserClient)
        if request.method_name == "getInventoryItemDefinitions"
            params = request.params
            id = request.id
            if id
                getInventoryItemDefinitions(params, id, client)
            end
        elsif request.method_name == "getPlayerInventory"
             params = request.params
            id = request.id
            if id
                getPlayerInventory(params, id, client)
            end
        elsif request.method_name == "getInventoryItemPropertyDefinitions"
            params = request.params
            id = request.id
            if id
                getInventoryItemPropertyDefinitions(params, id, client)
            end
        elsif request.method_name == "setInventoryItemFlags"
            params = request.params
            id = request.id
            if id
                setInventoryItemFlags(params, id, client)
            end
        end
    end
end