totalBalls = 20
balls = {}

function Init()
    cge.SetTitle("Balls!")
end

function OnUserCreate()
    for i = 0, totalBalls do
        local r = math.random(16 + 2)

        balls[i] = {
            px = math.random(cge.ScreenWidth()), py = math.random(cge.ScreenHeight()),
            vx = 0, vy = 0,
            ax = 0, ay = 0,
            radius = r,
            mass = r * 10.0
        }
    end
    return true
end

function OnUserUpdate(fElapsedTime)
    cge.Fill(0, 0, cge.ScreenWidth(), cge.ScreenHeight(), pixel.SPACE, colour.BG_BLACK)
    cge.DrawString(0, 0, "Balls!", colour.FG_WHITE)

    for i, v in ipairs(balls) do
        debug(v.px)
        cge.FillCircle(math.floor(v.px), math.floor(v.py), math.floor(v.radius), pixel.SPACE, colour.FG_WHITE)
    end

    return true
end