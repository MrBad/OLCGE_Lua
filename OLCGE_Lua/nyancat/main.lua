nyan_cookie = nil
nyan_head = nil
nyan_tail = {}
nyan_legs = {}
time_rainbow = 0.0
time_nyan_cookie = 0.0;
time_nyan_main = 0.0;
star = {}

function Init()
    cge.SetTitle("Nyan Cat")
end

function OnUserCreate()
	nyan_cookie  = cge.CreateSprite("./nyancat/sprites/nyan_cookie.spr")
	nyan_head    = cge.CreateSprite("./nyancat/sprites/nyan_head.spr")

	nyan_tail[0] = cge.CreateSprite("./nyancat/sprites/nyan_tail_0.spr")
	nyan_tail[1] = cge.CreateSprite("./nyancat/sprites/nyan_tail_1.spr")
	nyan_tail[2] = cge.CreateSprite("./nyancat/sprites/nyan_tail_2.spr")
	nyan_tail[3] = cge.CreateSprite("./nyancat/sprites/nyan_tail_3.spr")
	nyan_tail[4] = cge.CreateSprite("./nyancat/sprites/nyan_tail_4.spr")
	nyan_tail[5] = cge.CreateSprite("./nyancat/sprites/nyan_tail_5.spr")

	nyan_legs[0] = cge.CreateSprite("./nyancat/sprites/nyan_legs_0.spr")
	nyan_legs[1] = cge.CreateSprite("./nyancat/sprites/nyan_legs_1.spr")
	nyan_legs[2] = cge.CreateSprite("./nyancat/sprites/nyan_legs_2.spr")
	nyan_legs[3] = cge.CreateSprite("./nyancat/sprites/nyan_legs_3.spr")
	nyan_legs[4] = cge.CreateSprite("./nyancat/sprites/nyan_legs_4.spr")
	nyan_legs[5] = cge.CreateSprite("./nyancat/sprites/nyan_legs_5.spr")
	
	star = { 
		[0] = { ffspeed = 15.0, fxspeed = 105.0, fframe = 1.0, fx = 45.0, y = -2 },
		[1] = { ffspeed = 15.0, fxspeed =  69.0, fframe = 3.0, fx = 75.0, y =  8 },
		[2] = { ffspeed = 15.0, fxspeed =  69.0, fframe = 1.0, fx = -2.0, y = 21 },
		[3] = { ffspeed = 15.0, fxspeed =  69.0, fframe = 5.0, fx =  8.0, y = 46 },
		[4] = { ffspeed =-15.0, fxspeed =  87.0, fframe = 5.0, fx = 79.0, y = 60 },
		[5] = { ffspeed = 15.0, fxspeed = 138.0, fframe = 2.0, fx = 40.0, y = 73 }
	}

    return true
end

function draw_star(index)
	s = star[index];
	x = math.floor(s.fx);
	
	if s.fframe < 1.0 then
		cge.Draw(x + 3, s.y + 3, 0x2588, 0xFF)
	elseif s.fframe < 2.0 then
		cge.Draw(x + 3, s.y + 2, 0x2588, 0xFF)
		cge.Draw(x + 2, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 4, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 4, 0x2588, 0xFF)
	elseif s.fframe < 3.0 then
		cge.Draw(x + 3, s.y + 1, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 2, 0x2588, 0xFF)
		cge.Draw(x + 1, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 2, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 4, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 5, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 4, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 5, 0x2588, 0xFF)
	elseif s.fframe < 4.0 then
		cge.Draw(x + 3, s.y + 0, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 1, 0x2588, 0xFF)
		cge.Draw(x + 0, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 1, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 5, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 6, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 5, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 6, 0x2588, 0xFF)
	elseif s.fframe < 5.0 then
		cge.Draw(x + 3, s.y + 0, 0x2588, 0xFF)
		cge.Draw(x + 1, s.y + 1, 0x2588, 0xFF)
		cge.Draw(x + 5, s.y + 1, 0x2588, 0xFF)
		cge.Draw(x + 0, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 6, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 1, s.y + 5, 0x2588, 0xFF)
		cge.Draw(x + 5, s.y + 5, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 6, 0x2588, 0xFF)
	elseif s.fframe < 6.0 then
		cge.Draw(x + 3, s.y + 0, 0x2588, 0xFF)
		cge.Draw(x + 0, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 6, s.y + 3, 0x2588, 0xFF)
		cge.Draw(x + 3, s.y + 6, 0x2588, 0xFF)
	end
end

function OnUserUpdate(fElapsedTime)
    cge.Fill(0, 0, 80, 80, 0x2592, 0x1F)
	
	cge.Fill(0, 31, 31, 34, 0x2588, 0xCC)
	cge.Fill(0, 34, 31, 37, 0x2593, 0xEC)
	cge.Fill(0, 37, 31, 40, 0x2588, 0xEE)
	cge.Fill(0, 40, 31, 43, 0x2588, 0xAA)
	cge.Fill(0, 43, 31, 46, 0x2593, 0x9B)
	cge.Fill(0, 46, 31, 48, 0x2592, 0x59)
	
	time_test = 0.004 -- tweak this for speed
	time_rainbow = time_rainbow + time_test * 7.5
	if time_rainbow >= 2.0 then time_rainbow = time_rainbow - 2.0 end
	
	if time_rainbow >= 1.0 then
		cge.Fill( 0, 30,  3, 31, 0x2588, 0xCC)
		cge.Fill(12, 30, 21, 31, 0x2588, 0xCC)
		cge.Fill( 0, 33,  3, 34, 0x2593, 0xEC)
		cge.Fill(12, 33, 21, 34, 0x2593, 0xEC)
		cge.Fill( 0, 36,  3, 37, 0x2588, 0xEE)
		cge.Fill(12, 36, 21, 37, 0x2588, 0xEE)
		cge.Fill( 0, 39,  3, 40, 0x2588, 0xAA)
		cge.Fill(12, 39, 21, 40, 0x2588, 0xAA)
		cge.Fill( 0, 42,  3, 43, 0x2593, 0x9B)
		cge.Fill(12, 42, 21, 43, 0x2593, 0x9B)
		cge.Fill( 0, 45,  3, 46, 0x2592, 0x59)
		cge.Fill(12, 45, 21, 46, 0x2592, 0x59)
		cge.Fill( 3, 48, 12, 49, 0x2592, 0x59)
		cge.Fill(21, 48, 30, 49, 0x2592, 0x59)
	else
		cge.Fill( 3, 30, 12, 31, 0x2588, 0xCC)
		cge.Fill(21, 30, 31, 31, 0x2588, 0xCC)
		cge.Fill( 3, 33, 12, 34, 0x2593, 0xEC)
		cge.Fill(21, 33, 31, 34, 0x2593, 0xEC)
		cge.Fill( 3, 36, 12, 37, 0x2588, 0xEE)
		cge.Fill(21, 36, 31, 37, 0x2588, 0xEE)
		cge.Fill( 3, 39, 12, 40, 0x2588, 0xAA)
		cge.Fill(21, 39, 31, 40, 0x2588, 0xAA)
		cge.Fill( 3, 42, 12, 43, 0x2593, 0x9B)
		cge.Fill(21, 42, 31, 43, 0x2593, 0x9B)
		cge.Fill( 3, 45, 12, 46, 0x2592, 0x59)
		cge.Fill(21, 45, 31, 46, 0x2592, 0x59)
		cge.Fill( 0, 48,  3, 49, 0x2592, 0x59)
		cge.Fill(12, 48, 21, 49, 0x2592, 0x59)
	end
	
	for i=0,5 do
		s = star[i]
		
		s.fframe = s.fframe + (time_test * s.ffspeed)
		if s.fframe >= 6.0 then s.fframe = s.fframe - 6.0
		elseif s.fframe <= 0 then s.fframe = s.fframe + 6.0 end
			
		s.fx = s.fx - (time_test * s.fxspeed)
		if s.fx < -15.0 then s.fx = s.fx + 100.0 end
			
		draw_star(i)
	end
	
	time_nyan_main = time_nyan_main + time_test * 15.0
	if time_nyan_main >= 6.0 then time_nyan_main = time_nyan_main - 6.0 end
	
	if time_nyan_main < 1.0 then cge.DrawSprite(26, 44, nyan_legs[0])
	elseif time_nyan_main < 2.0 then cge.DrawSprite(26, 44, nyan_legs[1])
	elseif time_nyan_main < 3.0 then cge.DrawSprite(26, 45, nyan_legs[2])
	elseif time_nyan_main < 4.0 then cge.DrawSprite(26, 45, nyan_legs[3])
	elseif time_nyan_main < 5.0 then cge.DrawSprite(26, 45, nyan_legs[4])
	elseif time_nyan_main < 6.0 then cge.DrawSprite(26, 45, nyan_legs[5]) end

	time_nyan_cookie = time_nyan_cookie + time_test * 7.5
	if time_nyan_cookie >= 3.0 then time_nyan_cookie = time_nyan_cookie - 3.0 end
	
	if time_nyan_cookie < 1.0 then
		cge.DrawSprite(29, 29, nyan_cookie)
	else
		cge.DrawSprite(29, 30, nyan_cookie)
	end
	
	if time_nyan_main < 1.0 then cge.DrawSprite(39, 34, nyan_head)
	elseif time_nyan_main < 2.0 then cge.DrawSprite(40, 34, nyan_head)
	elseif time_nyan_main < 3.0 then cge.DrawSprite(40, 35, nyan_head)
	elseif time_nyan_main < 4.0 then cge.DrawSprite(40, 35, nyan_head)
	elseif time_nyan_main < 5.0 then cge.DrawSprite(39, 35, nyan_head)
	elseif time_nyan_main < 6.0 then cge.DrawSprite(39, 34, nyan_head) end

	if time_nyan_main < 1.0 then cge.DrawSprite(22, 36, nyan_tail[0])
	elseif time_nyan_main < 2.0 then cge.DrawSprite(22, 36, nyan_tail[1])
	elseif time_nyan_main < 3.0 then cge.DrawSprite(22, 37, nyan_tail[2])
	elseif time_nyan_main < 4.0 then cge.DrawSprite(22, 37, nyan_tail[3])
	elseif time_nyan_main < 5.0 then cge.DrawSprite(22, 37, nyan_tail[4])
	elseif time_nyan_main < 6.0 then cge.DrawSprite(22, 37, nyan_tail[5]) end
   
    return true
end