local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "PetTrackerSkin"
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor -- Used to just be Anchor, but he overwrote __index and now we have to do this
	AS:SkinFrame(frame.Overlay)
	for i = 1, PetTracker.MaxQuality do
		AS:SkinStatusBar(frame[i])
	end
end

AS:RegisterSkin(name, AS.SkinPetTracker)