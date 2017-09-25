local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('BetterQuest') then return end

function AS:BetterQuest()
	local BetterQuest = LibStub("AceAddon-3.0"):GetAddon("BetterQuest")
	hooksecurefunc(BetterQuest, 'UpdateTrackers', function(self)
		for id, _ in pairs(self.db.profile.trackerNames) do
			local settings = self.db.profile.trackers[id]
			if settings and settings.enabled then
				self:UpdateTracker(id)
				local Tracker = _G["BetterQuest_"..id]
				if not Tracker.IsSkinned then
					AS:SkinBackdropFrame(Tracker)
					Tracker:SetBackdrop(nil)
					Tracker.SetBackdrop = AS.Noop
					Tracker.IsSkinned = true
				end
				for i = 1, 100 do
					local Line = i == 1 and _G["BetterQuest_"..id..'_Line'..i..'_Right'] or _G["BetterQuest_"..id..'_Line'..i..'_Left']
					local LineText = Line and Line:GetText() or nil
					if LineText then
						LineText = gsub(LineText, "|TInterface\\Buttons\\UI%-(%a-)Button%-Up:%d-|t", function(x) local z = (x == 'Minus' and '-' or x == 'Plus' and '+') return z and '|cFFFFFFFF'..z..' |r' or '' end)
						Line:SetText(LineText)
					end
				end
			end
		end
	end)

	BetterQuest:UpdateTrackers()
end

AS:RegisterSkin('BetterQuest', AS.BetterQuest)