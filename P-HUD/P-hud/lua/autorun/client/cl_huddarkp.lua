surface.CreateFont("HUD_Font", {
    font = "Arial",
    size = 20,
    weight = 600,
})

local function DrawHUD()
    local ply = LocalPlayer()
    local health = ply:Health()
    local hunger = ply:getDarkRPVar("Energy")
    local job = ply:getDarkRPVar("job") or "No Job"
    local money = ply:getDarkRPVar("money")

    local scrW, scrH = ScrW(), ScrH()
    local hudWidth = math.floor(scrW * 0.175)
    local hudHeight = math.floor(scrH * 0.03)
    local hudPadding = math.floor(scrH * 0.007)
    local cornerRadius = math.floor(hudHeight * 0.5)

    local hudPosX = hudPadding
    local hudPosY = math.Clamp(scrH - hudHeight - hudPadding, scrH - hudHeight * 1.5 - hudPadding * 2, scrH - hudHeight - hudPadding)


    local healthBarWidth = health * hudWidth / 100
    draw.RoundedBox(cornerRadius, hudPosX, hudPosY - hudHeight - hudPadding - 2, hudWidth, hudHeight, Color(26, 26, 26, 200))
    draw.RoundedBox(cornerRadius, hudPosX, hudPosY - hudHeight - hudPadding - 2, healthBarWidth, hudHeight, Color(0, 255, 0))


    local hungerBarWidth = hunger * hudWidth / 100
    draw.RoundedBox(cornerRadius, hudPosX, hudPosY, hudWidth, hudHeight, Color(238, 94, 6))
    draw.RoundedBox(cornerRadius, hudPosX, hudPosY, hungerBarWidth, hudHeight, Color(255, 165, 0))


    local moneyBarPosX = scrW - hudWidth - hudPadding
    draw.RoundedBox(cornerRadius, moneyBarPosX, hudPosY, hudWidth, hudHeight, Color(26, 26, 26, 200))
    draw.RoundedBox(cornerRadius, moneyBarPosX, hudPosY, hudWidth, hudHeight, Color(0, 0, 255))

    -- Texts of the different bars draw.SimpleText("Life: " .. health, "HUD_Font", hudPosX + hudWidth / 2, hudPosY - hudHeight - hudPadding + hudHeight / 2 - 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    draw.SimpleText("Faim: " .. hunger, "HUD_Font", hudPosX + hudWidth / 2, hudPosY + hudHeight / 2 - 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Argent: € " .. money, "HUD_Font", moneyBarPosX + hudWidth / 2, hudPosY + hudHeight / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    local jobBarPosX = hudPosX
    local jobBarPosY = hudPadding
    local jobBarWidth = hudWidth
    local jobBarHeight = hudHeight
    draw.RoundedBox(cornerRadius, jobBarPosX, jobBarPosY, jobBarWidth, jobBarHeight, Color(26, 26, 26, 150))
    draw.SimpleText(job, "HUD_Font", jobBarPosX + jobBarWidth / 2, jobBarPosY + jobBarHeight / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

hook.Add("HUDPaint", "DarkRP_HUD", DrawHUD)
