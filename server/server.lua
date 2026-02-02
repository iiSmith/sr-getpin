lib.callback.register('sr-getpin:cb:GetPIN', function(source, PhoneNum)
    if not PhoneNum then return end
    return exports['lb-phone']:GetPin(tostring(PhoneNum))
end)

lib.callback.register('sr-getpin:cb:HasPhone', function(source)
    return exports['lb-phone']:HasPhoneItem(source, exports['lb-phone']:GetEquippedPhoneNumber(source))
end)

if Config.Item.enable then
    if Config.FrameWork == 'qbx' then
        exports.qbx_core:CreateUseableItem(Config.Item.ItemName, function(source)
            TriggerClientEvent('sr-getpin:client:GetPIN', source)
        end)
    elseif Config.FrameWork == 'qb' then
        exports["qb-core"]:GetCoreObject().Functions.CreateUseableItem(Config.Item.ItemName, function(source)
            TriggerClientEvent('sr-getpin:client:GetPIN', source)
        end)
    end
end