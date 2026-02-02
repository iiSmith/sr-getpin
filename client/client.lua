local isCoolDown = false

local function Notify(text, texttype, length)
    if Config.FrameWork == 'qb' then
        exports["qb-core"]:GetCoreObject().Functions.Notify(text, texttype, length)
    elseif Config.FrameWork == 'qbx' then
        exports.qbx_core:Notify(text, texttype, length)
    end
end

local function GetPIN(PhoneNum)
    return lib.callback.await('sr-getpin:cb:GetPIN', false, PhoneNum) or Config.Texts.PIN_not_found
end

local function getPIN()
    if isCoolDown then
        Notify(Config.Texts.Cant_now, 'error', 5000)
        return
    end
    local input = lib.inputDialog(Config.Texts.input_header, {
        {
            type = 'number',
            label = Config.Texts.input_label,
            required = true
        },
    })

    if input then
        local num = input[1]
        local hasphone = lib.callback.await('sr-getpin:cb:HasPhone', false)
        print(hasphone)
        if not hasphone then return Notify(Config.Texts.phone_not_found, 'error', 5000) end
        if Config.CoolDown.enable then
            isCoolDown = true
            Wait(250)
            SetTimeout(Config.CoolDown.CoolDownTime * 60 * 1000, function()
                isCoolDown = false
            end)
        end
        local success = Config.MiniGmae()
        if success then
            local alert = lib.alertDialog({
                header = 'Phone PIN',
                content = string.format(Config.Texts.alert_content, GetPIN(num), num),
                centered = true,
                cancel = true
            })
            if alert == 'confirm' or alert == 'cancel' then
                Notify(string.format(Config.Texts.alert_content, GetPIN(num), num), 'success', 10000)
            end
        end
    end
end

if Config.Command.enable then
    RegisterCommand(Config.Command.CommandName, getPIN)
end

RegisterNetEvent('sr-getpin:client:GetPIN', getPIN)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
      if Config.FrameWork ~= 'qb' and Config.FrameWork ~= 'qbx' then
        warn('[ERROR] Invalid Config.FrameWork value detected. Please set it to [ qb or qbx ]')
        print('^1[ERROR]^4 Invalid Config.FrameWork value detected. Please set it to [ qb or qbx ]')
      end
   end
end)