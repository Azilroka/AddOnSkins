local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Lightheaded') then return end

local name = 'LightheadedSkin'
function AS:SkinLightHeaded()
	local function DoDis()
		QuestNPCModel:ClearAllPoints()
		QuestNPCModel:SetPoint('TOPLEFT', LightHeadedFrame, 'TOPRIGHT', 5, -10)
		QuestNPCModel:SetAlpha(0.85)
		LightHeadedFrame:Point('LEFT', QuestLogFrame, 'RIGHT', 2, 0)
	end

	local function SkinOptions(self, event, ...)
		local lhp = _G['LightHeaded_Panel']
		if lhp:IsVisible() then
			for i = 1, 9 do
				local cbox = _G['LightHeaded_Panel_Toggle'..i]
				AS:SkinCheckBox(cbox)
			end
			local buttons = {
				'LightHeaded_Panel_Button1',
				'LightHeaded_Panel_Button2',
			}

			for _, button in pairs(buttons) do
				AS:SkinButton(_G[button])
			end

			LightHeaded_Panel_Button2:Disable()
		end
	end
	AS:SkinFrame(LightHeadedFrame)
	AS:SkinFrame(LightHeadedFrameSub)
	AS:SkinFrame(LightHeadedSearchBox)
	AS:SkinTooltip(LightHeadedTooltip)
	LightHeadedScrollFrame:StripTextures()
	local lhframe = LightHeadedFrame		
	lhframe.close:Hide()
	AS:SkinCloseButton(lhframe.close)
	lhframe.handle:Hide()
	local lhframe = LightHeadedFrameSub
	AS:SkinNextPrevButton(lhframe.prev)
	AS:SkinNextPrevButton(lhframe.next)
	lhframe.prev:SetWidth(16)
	lhframe.prev:SetHeight(16)
	lhframe.next:SetWidth(16)
	lhframe.next:SetHeight(16)
	lhframe.prev:SetPoint('RIGHT', lhframe.page, 'LEFT', -25, 0)
	lhframe.next:SetPoint('LEFT', lhframe.page, 'RIGHT', 25, 0)
	AS:SkinScrollBar(LightHeadedScrollFrameScrollBar, 5)
	lhframe.title:SetTextColor(23/255, 132/255, 209/255)	
	local LH_OnLoad = _G['LightHeadedFrame']
	LH_OnLoad:SetScript('OnUpdate', DoDis)
	local LH_Options = _G['LightHeaded_Panel']
end

AS:RegisterSkin(name, AS.SkinLightHeaded)