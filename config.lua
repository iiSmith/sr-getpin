Config = {
    FrameWork = 'qbx', -- qb or qbx

    CoolDown = {
        enable = true,
        CoolDownTime = 10 -- min
    },

    Command = {
        enable = true,
        CommandName = 'Getpin'
    },

    Item = {
        enable = true,
        ItemName = 'pinget'
    },

    MiniGmae = function()
        return exports.bl_ui:Untangle(1, {
            numberOfNodes = 6,
            duration = 5000,
        })
    end,

    Texts = {
        Cant_now        = "Can't now",
        PIN_not_found   = 'There is no phone PIN, or phone number is incorrect',
        input_label     = 'Write number here',
        input_header    = 'Phone PIN',
        phone_not_found = 'Phone not found',
        alert_header    = 'Phone PIN',
        alert_content   = 'PIN: %s \n\n For: %s'
    },
}
