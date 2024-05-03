function find_request_index(player, item)
    local character = player.character
    for i=1, character.request_slot_count do
        local slot = character.get_personal_logistic_slot(i)
        if slot and tostring(slot.name) == tostring(item.name) then
            return true
        end
    end
    return false
end

script.on_event("easy-trash-request", function(event)
    local hovered_item = event.selected_prototype
    if hovered_item then
        local player = game.players[event.player_index]
        local player_has_request = find_request_index(player, hovered_item)
        if not player_has_request then
            local request = { name = hovered_item.name , min = 0, max = 0, index = player.character.request_slot_count + 1}
            player.character.set_personal_logistic_slot(request.index, request)
        end
    end
end)