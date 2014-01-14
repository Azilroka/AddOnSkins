local AS = ElvUI[1]:GetModule('AddOnSkins')

if not AS:CheckAddOn('PetTracker') then return end

local name = "PetTrackerSkin"
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor -- Used to just be Anchor, but he overwrote __index and now we have to do this
	AS:SkinFrame(frame.Overlay)
	for i = 1, PetTracker.MaxQuality do
		AS:SkinStatusBar(frame[i])
	end
	
	for i = 1, 3 do
        local button = _G[("PetTrackerAbilityAction%d"):format(i)]
        if button then
            AS:SkinIconButton(button)
        end
    end
end

AS:RegisterSkin(name, AS.SkinPetTracker)