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
        cge.FillCircle(math.floor(v.px), math.floor(v.py), math.floor(v.radius), pixel.SPACE, colour.BG_RED)
    end

    return true
end

function DoCirclesOverlap(x1, y1, r1, x2, y2, r2)
    return math.abs((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2)) <= (r1 + r2)*(r1 + r2)
end

function IsPointInCircle(x1, y1, r1, px, py) 
    return math.abs((x1 - px)*(x1 - px) + (y1 - py)*(y1 - py)) < (r1 * r1);
end