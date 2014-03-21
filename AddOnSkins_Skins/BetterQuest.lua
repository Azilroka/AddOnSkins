local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BetterQuest') then return end

local name = 'BetterQuestSkin'
function AS:SkinBetterQuest()
	local BetterQuest = LibStub("AceAddon-3.0"):GetAddon("BetterQuest")
	hooksecurefunc(BetterQuest, 'UpdateTrackers', function(self)
		for id, _ in pairs(self.db.profile.trackerNames) do
			local settings = self.db.profile.trackers[id]
			if settings then
				if settings.enabled then
					self:UpdateTracker(id)
					if not _G["BetterQuest_"..id].IsSkinned then
						AS:SkinBackdropFrame(_G["BetterQuest_"..id])
						_G["BetterQuest_"..id]:SetBackdrop(nil)
						_G["BetterQuest_"..id].SetBackdrop = AS.Noop
						_G["BetterQuest_"..id].IsSkinned = true
					end
					for i = 1, 100 do
						local Line = i == 1 and _G["BetterQuest_"..id..'_Line'..i..'_Right'] or _G["BetterQuest_"..id..'_Line'..i..'_Left']
						local LineText = Line and Line:GetText() or nil
						if LineText then
							LineText = gsub(LineText, "|TInterface\\Buttons\\UI%-(%a-)Button%-Up:%d-|t", function(x) return x == 'Minus' and '|cFFFFFFFF-|r ' or x == 'Plus' and '|cFFFFFFFF+|r ' or '' end)
							Line:SetText(LineText)
						end
					end
				end
			end
		end
	end)

	BetterQuest:UpdateTrackers()
end

AS:RegisterSkin(name, AS.SkinBetterQuest)