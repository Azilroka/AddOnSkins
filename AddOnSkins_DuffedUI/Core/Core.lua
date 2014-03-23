local AS = unpack(select(2, ...))
local pairs, sort, tinsert, tremove, unpack, floor, select = pairs, sort, tinsert, tremove, unpack, floor, select
local GetAddOnInfo = GetAddOnInfo

UISkinOptions = {}

function AS:OrderedPairs(t, f)
	local a = {}
	for n in pairs(t) do tinsert(a, n) end
	sort(a, f)
	local i = 0
	local iter = function()
		i = i + 1
		if a[i] == nil then return nil
			else return a[i], t[a[i]]
		end
	end
	return iter
end

function AS:CheckAddOn(addon)
	return select(4, GetAddOnInfo(addon))
end

function AS:Print(string)
	print(format('%s %s', AS.Title, string))
end

function AS:Round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function AS:PrintURL(url)
	return format("|cFFFFFFFF[|Hurl:%s|h%s|h]|r", url, url)
end

function AS:SkinButton(frame, strip)
	frame:SkinButton(strip)
end

function AS:SkinScrollBar(frame)
	frame:SkinScrollBar()
	_G[frame:GetName().."ScrollUpButton"]:StripTextures()
	_G[frame:GetName().."ScrollUpButton"]:SetTemplate("Default", true)
	_G[frame:GetName().."ScrollDownButton"]:StripTextures()
	_G[frame:GetName().."ScrollDownButton"]:SetTemplate("Default", true)
	if not _G[frame:GetName().."ScrollUpButton"].text then
		_G[frame:GetName().."ScrollUpButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollUpButton"].text:SetText("▲")
		_G[frame:GetName().."ScrollUpButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollUpButton"].text:SetTextColor(unpack(AS.BorderColor))
	end	
	if not _G[frame:GetName().."ScrollDownButton"].text then
		_G[frame:GetName().."ScrollDownButton"]:FontString("text", AS.ActionBarFont, 12)
		_G[frame:GetName().."ScrollDownButton"].text:SetText("▼")
		_G[frame:GetName().."ScrollDownButton"].text:SetPoint("CENTER", 0, 0)
		_G[frame:GetName().."ScrollDownButton"].text:SetTextColor(unpack(AS.BorderColor))
	end
end

function AS:SkinTab(frame, strip)
	if strip then frame:StripTextures(true) end
	frame:SkinTab()
end

function AS:SkinNextPrevButton(frame, horizonal)
	frame:SkinNextPrevButton(horizonal)
end

function AS:SkinRotateButton(frame)
	frame:SkinRotateButton()
end

function AS:SkinEditBox(frame, width, height)
	frame:SkinEditBox()
	if width then frame:Width(width) end
	if height then frame:Height(height) end
end

function AS:SkinDropDownBox(frame, width)
	frame:SkinDropDownBox(width)
end

function AS:SkinCheckBox(frame)
	frame:SkinCheckBox()
end

function AS:SkinCloseButton(frame, point)
	frame:SkinCloseButton(point)
end

function AS:SkinSlideBar(frame, height, movetext)
	frame:SkinSlideBar(height, movetext)
end

function AS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		AS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function AS:SkinFrame(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template)
end

function AS:SkinBackdropFrame(frame, template, override, kill, setpoints)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:CreateBackdrop(template)
	if setpoints then frame.backdrop:SetAllPoints() end
end

function AS:SkinTitleBar(frame, template, override, kill)
	if not template then template = 'Transparent' end
	if not override then frame:StripTextures(kill) end
	frame:SetTemplate(template, true)
end

function AS:SkinStatusBar(frame, ClassColor)
	AS:SkinBackdropFrame(frame)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function AS:SkinTooltip(tooltip, scale)
	tooltip:HookScript('OnShow', function(frame)
		frame:SetTemplate('Transparent')
		if scale then frame:SetScale(AS.UIScale) end
	end)
end

function AS:SkinTexture(frame)
	frame:SetTexCoord(unpack(AS.TexCoords))
end

function AS:SkinIconButton(frame, shrinkIcon)
	frame:SkinIconButton(shrinkIcon)
	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName()..'IconTexture'] then
		icon = _G[frame:GetName()..'IconTexture']
	elseif frame:GetName() and _G[frame:GetName()..'Icon'] then
		icon = _G[frame:GetName()..'Icon']
	end

	if icon then
		AS:SkinTexture(icon)
	end
end

function AS:Desaturate(frame, point)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:IsObjectType('Texture') then
			local Texture = region:GetTexture()
			if type(Texture) == 'string' and strlower(Texture) == 'interface\\dialogframe\\ui-dialogbox-corner' then
				region:SetTexture(nil)
				region:Kill()
			else
				region:SetDesaturated(true)
			end
		end
	end	
	frame:HookScript('OnUpdate', function(self)
		if self:GetNormalTexture() then
			self:GetNormalTexture():SetDesaturated(true)
		end
		if self:GetPushedTexture() then
			self:GetPushedTexture():SetDesaturated(true)
		end
		if self:GetHighlightTexture() then
			self:GetHighlightTexture():SetDesaturated(true)
		end
	end)
end

function AS:CheckOption(optionName, ...)
	for i = 1,select('#', ...) do
		local addon = select(i, ...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return UISkinOptions[optionName]
end

function AS:SetOption(optionName, value)
	UISkinOptions[optionName] = value
end

function AS:DisableOption(optionName)
	AS:SetOption(optionName, false)
end

function AS:EnableOption(optionName)
	AS:SetOption(optionName, true)
end

function AS:ToggleOption(optionName)
	UISkinOptions[optionName] = not UISkinOptions[optionName]
end

function AS:RegisterSkin(skinName, skinFunc, ...)
	local events = {}
	local priority = 1
	for i = 1,select('#', ...) do
		local event = select(i, ...)
		if not event then break end
		if type(event) == 'number' then
			priority = event
		else
			events[event] = true
		end
	end
	local registerMe = { func = skinFunc, events = events, priority = priority }
	if not AS.register[skinName] then AS.register[skinName] = {} end
	AS.register[skinName][skinFunc] = registerMe
end

function AS:AddNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if _G[frame]:IsVisible() then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

local AcceptFrame
function AS:AcceptFrame(MainText, Function)
	if not AcceptFrame then
		AcceptFrame = CreateFrame('Frame', nil, UIParent)
		AcceptFrame:SetTemplate('Transparent')
		AcceptFrame:SetSize(250, 70)
		AcceptFrame:SetPoint('CENTER', UIParent, 'CENTER')
		AcceptFrame:SetFrameStrata('DIALOG')
		AcceptFrame:FontString('Text', AS.Font, 14)
		AcceptFrame.Text:SetPoint('TOP', AcceptFrame, 'TOP', 0, -10)
		AcceptFrame.Accept = CreateFrame('Button', nil, AcceptFrame)
		AS:SkinButton(AcceptFrame.Accept)
		AcceptFrame.Accept:SetSize(70, 25)
		AcceptFrame.Accept:SetPoint('RIGHT', AcceptFrame, 'BOTTOM', -10, 20)
		AcceptFrame.Accept:FontString('Text', AS.Font, 12)
		AcceptFrame.Accept.Text:SetPoint('CENTER')
		AcceptFrame.Accept.Text:SetText(YES)
		AcceptFrame.Close = CreateFrame('Button', nil, AcceptFrame)
		AS:SkinButton(AcceptFrame.Close)
		AcceptFrame.Close:SetSize(70, 25)
		AcceptFrame.Close:SetPoint('LEFT', AcceptFrame, 'BOTTOM', 10, 20)
		AcceptFrame.Close:SetScript('OnClick', function(self) self:GetParent():Hide() end)
		AcceptFrame.Close:FontString('Text', AS.Font, 12)
		AcceptFrame.Close.Text:SetPoint('CENTER')
		AcceptFrame.Close.Text:SetText(NO)
	end
	AcceptFrame.Text:SetText(MainText)
	AcceptFrame.Accept:SetScript('OnClick', Function)
	AcceptFrame:Show()
end