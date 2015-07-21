local cl_hitmarker = CreateClientConVar("cl_hitmarker", "1", true)
local sound // = Sound("sound/hitmarker.mp3")
loacl time = CurTime()
local fade = 0.8

//resource.AddFile("sound/hitmarker.mp3")

local function PaintHitmarker()
	local curtime = CurTime()

	if time <= curtime then
		hook.Remove("HUDPaint", "Hitmarker")
	end

	local x = ScrW() / 2
	local y = ScrH() / 2
	
	surface.SetDrawColor(Color(255, 255, 255, (time - curtime) / fade))

	surface.DrawLine(x - 15, y - 15, x - 5, y - 5)
	surface.DrawLine(x - 15, y + 15, x - 5, y + 5)
	surface.DrawLine(x + 15, y - 15, x + 5, y - 5)
	surface.DrawLine(x + 15, y + 15, x + 5, y + 5)
end

local function Hitmarker()
	if cl_hitmarker:GetBool() then
		time = CurTime() + fade
		if sound then
			surface.PlaySound(sound)
		end
		hook.Add("HUDPaint", "Hitmarker", PaintHitmarker)
	end
end

net.Receive("Hitmarker", Hitmarker)
