require("system.keys")

frogger = nil
playerx = 1
playery = 10

lineSpaceing = 1

function Init()
    cge.SetTitle("Testing")
end

function OnUserCreate()
    frogger = cge.CreateSprite("./test/assets/frog.spr")

    return true
end

function OnUserUpdate(fElapsedTime)
    if input.IsKeyPressed(Keys.SDL_SCANCODE_A) then
        playerx = playerx - 1
    end

    if input.IsKeyPressed(Keys.SDL_SCANCODE_D) then
        playerx = playerx + 1
    end

    if input.IsKeyPressed(Keys.SDL_SCANCODE_S) then
        playery = playery + 1
    end

    if input.IsKeyPressed(Keys.SDL_SCANCODE_W) then
        playery = playery - 1
    end

    if input.IsMousePressed(Mouse.SDL_BUTTON_LEFT) then
        playerx = playerx + 5
        playery = playery + 5
    end

    cge.Fill(0, 0, cge.ScreenWidth(), cge.ScreenHeight(), pixel.SPACE, colour.BG_BLACK)
    cge.FillCircle(25, 25, 5, pixel.SPACE, colour.BG_RED)

    cge.DrawString(0, 0, "frogger", colour.FG_WHITE)
    cge.DrawString(0, 1 + lineSpaceing, "x:" .. input.GetMouseX(), colour.FG_WHITE)
    cge.DrawString(0, 2 + lineSpaceing, "y:" .. input.GetMouseY(), colour.FG_WHITE)
    cge.DrawString(0, 3 + lineSpaceing, "t:" .. tostring(fElapsedTime), colour.FG_WHITE)
    cge.DrawSprite(playerx, playery, frogger)
    cge.Draw(1, 25, pixel.SOLID, colour.FG_RED)
    return true
end