//resource.AddFile("sound/hitmarker.mp3") adding file later

local alpha = 255

local function PaintHitmarker()
	if 0 >= alpha then
		alpha = 255
		hook.Remove("HUDPaint", "Hitmarker")
	end

	local x = ScrW() / 2
	local y = ScrH() / 2
	
	surface.SetDrawColor(Color(255, 255, 255, alpha))

	surface.DrawLine(x - 15, y - 15, x - 5, y - 5 )
	surface.DrawLine(x - 15, y + 15, x - 5, y + 5 )
	surface.DrawLine(x + 15, y - 15, x + 5, y - 5 )
	surface.DrawLine(x + 15, y + 15, x + 5, y + 5)
	alpha = alpha - 5
end

local function Hitmarker()
	//LocalPlayer():EmitSound("hitmarker.mp3", 130) adding file later
	alpha = 255
	hook.Add("HUDPaint", "Hitmarker", PaintHitmarker)
end

net.Receive("Hitmarker", Hitmarker)
