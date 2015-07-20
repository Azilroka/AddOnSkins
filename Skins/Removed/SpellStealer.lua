local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('SpellStealer') then return end

function AS:SpellStealer()
	AS:SkinFrame(SSFrame)
	AS:StripTextures(SSFrameList)
--	SSFrametitle:FontTemplate(LSM:Fetch('font', E.db.datatexts.font), 12, E.db.datatexts.fontOutline)
	SSFrametitle:ClearAllPoints()
	SSFrametitle:Point('CENTER', SSFrame, 'CENTER', 0, 0)
--	SSFrameList.DisplayText:FontTemplate(LSM:Fetch('font', E.db.datatexts.font), 10, E.db.datatexts.fontOutline)
	SSFrameList.DisplayText:Point('LEFT', SSFrameList, 'LEFT', 2, -2)
--[[		-- My way of getting around not being able to resize the actual List Frame
	local SSFrameListBG = CreateFrame('Frame', 'NewSSFrameListBG', SSFrame)
	SSFrameListBG:SetTemplate('Transparent')
	SSFrameListBG:SetPoint('TOPLEFT', SSFrameList, 'TOPLEFT', 0, 0)
	SSFrameListBG:SetPoint('BOTTOMRIGHT', SSFrameList, 'BOTTOMRIGHT', 0, -4)
]]
end

AS:RegisterSkin('SpellStealer', AS.SpellStealer)