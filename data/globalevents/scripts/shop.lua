-- ### CONFIG ###
-- message send to player by script "type" (types you can check in "global.lua")
SHOP_MSG_TYPE = 19
-- time (in seconds) between connections to SQL database by shop script
SQL_interval = 30
-- ### END OF CONFIG ###
function onThink(interval, lastExecution)
    local result_plr = db.getResult("SELECT * FROM z_ots_comunication WHERE `type` = 'login';")
    if(result_plr:getID() ~= -1) then
        while(true) do
            id = tonumber(result_plr:getDataInt("id"))
            action = tostring(result_plr:getDataString("action"))
            delete = tonumber(result_plr:getDataInt("delete_it"))
            cid = getCreatureByName(tostring(result_plr:getDataString("name")))
            if isPlayer(cid) == TRUE then
                local itemtogive_id = tonumber(result_plr:getDataInt("param1"))
                local itemtogive_count = tonumber(result_plr:getDataInt("param2"))
                local container_id = tonumber(result_plr:getDataInt("param3"))
                local container_count = tonumber(result_plr:getDataInt("param4"))
                local add_item_type = tostring(result_plr:getDataString("param5"))
                local add_item_name = tostring(result_plr:getDataString("param6"))
                local received_item = 0
                local full_weight = 0
                if add_item_type == 'container' then
                    full_weight = getItemWeightById(itemtogive_id, 1)
                end
                local free_cap = getPlayerFreeCap(cid)
                if full_weight <= free_cap then
                    if add_item_type == 'container' then
                        local new_container = doCreateItemEx(container_id, 1)
                        local iter = 0
                        while iter ~= container_count do
                            doAddContainerItem(new_container, itemtogive_id, itemtogive_count)
                            iter = iter + 1
                        end
                        received_item = doPlayerAddItemEx(cid, new_container)
                    else
                        local new_item = doCreateItemEx(itemtogive_id, itemtogive_count)
                        received_item = doPlayerAddItemEx(cid, new_item)
                    end
                    if received_item == RETURNVALUE_NOERROR then
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'Voce acaba de receber o item >> '.. add_item_name ..' << de nosso shopping, obrigado por ser um ilustrissimo donate!')
                        db.executeQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
                        db.executeQuery("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
                        doPlayerSave(cid)
					else
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'Seu item >> '.. add_item_name ..' << esta esperando por voce. Por favor faça o local para este item em sua mochila e aguarde cerca de 30 segundos para obte-lo.')
                    end
                else
                        doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'Seu item >> '.. add_item_name ..' << esta esperando por voce. O peso do item e '.. full_weight ..' oz., Vc tem no momento '.. free_cap ..' oz. de capacidade livre. Coloque alguns itens no deposito e espere cerca de 30 segundos para obte-lo.')
                end
            end
            if not(result_plr:next()) then
                break
            end
        end
        result_plr:free()
    end
    return TRUE
end