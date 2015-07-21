util.AddNetworkString("Hitmarker")

local function Hitmarker(targ, dmg)
	if dmg:GetAttacker():IsPlayer() then
		net.Start("Hitmarker")
		net.Send(dmg:GetAttacker())
	end
end

hook.Add("EntityTakeDamage", "Hitmarker", Hitmarker)
