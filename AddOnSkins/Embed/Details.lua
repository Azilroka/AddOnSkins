local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Details') then return end

local ES = AS.EmbedSystem

local _G = _G
local select, type = select, type
local wipe, tinsert  = wipe, tinsert

local Details
local NumberToEmbed

ES.DetailsInstances = {}

function ES:DetailsWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
	if not window then return end

	if (not window:IsEnabled()) then
		window:EnableInstance()
	end

	window._ElvUIEmbed = true

	if window.bars_grow_direction == 2 then
		ofsy = -2
	else
		ofsy = -20
	end

	window:UngroupInstance()

	window.baseframe:ClearAllPoints()
	window.baseframe:SetParent(relativeFrame)
	window.baseframe:SetFrameStrata(relativeFrame:GetFrameStrata())
	window.baseframe:SetFrameLevel(relativeFrame:GetFrameLevel())

	ofsx = ofsx - 1

	if window.show_statusbar then
		height = height - 13
	end

	if (window.skin == "Forced Square") then
		ofsx = ofsx - 1
		if (window:GetId() == 2) then
			window:SetSize(width + 1, height - 20)
		else
			window:SetSize(width, height - 20)
		end
	elseif (window.skin == "ElvUI Frame Style") then
		if (window:GetId() == 2) then
			window:SetSize(width - 1, height - 20)
		else
			if NumberToEmbed == 1 then
				window:SetSize(width - 2, height - 20)
			else
				window:SetSize(width, height - 20)
			end
		end
	elseif (window.skin == "ElvUI Style II") then
		if (window:GetId() == 2) then
			window:SetSize(width, height - 20)
		else
			if NumberToEmbed == 1 then
				window:SetSize(width - 2, height - 20)
			else
				window:SetSize(width - 1, height - 20)
			end
		end
	else
		window:SetSize(width, height - 20)
	end

	window.baseframe:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
	window:SaveMainWindowPosition()
	window:RestoreMainWindowPosition()

	window:LockInstance(true)

	if (window:GetId() == 2) then
		window:MakeInstanceGroup({1})
	end

	if (window:GetId() == 1) then
		--bookmark frame
		_G.Details_SwitchButtonFrame1:SetParent(_G.DetailsBaseFrame1)
		_G.Details_SwitchButtonFrame1:SetFrameLevel(_G.DetailsBaseFrame1:GetFrameLevel() + 3)
		--row frame
		_G.DetailsRowFrame1:SetParent(_G.DetailsBaseFrame1)
		_G.DetailsRowFrame1:SetFrameLevel(_G.DetailsBaseFrame1:GetFrameLevel() + 2)

	elseif (window:GetId() == 2) then
		--bookmark frame
		_G.Details_SwitchButtonFrame2:SetParent(_G.DetailsBaseFrame2)
		_G.Details_SwitchButtonFrame2:SetFrameLevel(_G.DetailsBaseFrame2:GetFrameLevel() + 3)
		--row frame
		_G.DetailsRowFrame2:SetParent(_G.DetailsBaseFrame2)
		_G.DetailsRowFrame2:SetFrameLevel(_G.DetailsBaseFrame2:GetFrameLevel() + 2)
	end
end

function ES:Details()
	if not Details then
		Details = _G._detalhes

		if Details.CreateEventListener then
			local listener = Details:CreateEventListener()
			listener:RegisterEvent("DETAILS_INSTANCE_OPEN")
			listener:RegisterEvent("DETAILS_INSTANCE_CLOSE")

			function listener:OnDetailsEvent (event, ...)
				if (event == "DETAILS_INSTANCE_CLOSE") then
					local instance = select (1, ...)
					if (instance._ElvUIEmbed and _G.DetailsOptionsWindow and _G.DetailsOptionsWindow:IsShown()) then
						Details:Msg("You just closed a window Embed on ElvUI, if wasn't intended click on Reopen.") --> need localization
					end
				elseif (event == "DETAILS_INSTANCE_OPEN") then
					local instance = select(1, ...)
					if (instance._ElvUIEmbed) then
						if (#ES.DetailsInstances >= 2) then
							ES.DetailsInstances[1]:UngroupInstance()
							ES.DetailsInstances[2]:UngroupInstance()

							ES.DetailsInstances[1].baseframe:ClearAllPoints()
							ES.DetailsInstances[2].baseframe:ClearAllPoints()

							ES.DetailsInstances[1]:RestoreMainWindowPosition()
							ES.DetailsInstances[2]:RestoreMainWindowPosition()

							ES.DetailsInstances[2]:MakeInstanceGroup({1})
						end
					end
				end
			end
		end
	end

	wipe(ES.DetailsInstances)

	for _, instance in Details:ListInstances() do
		tinsert(ES.DetailsInstances, instance)
	end

	NumberToEmbed = 0
	if AS:CheckOption('EmbedSystem') then
		NumberToEmbed = 1
	elseif AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Details' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Details' then NumberToEmbed = NumberToEmbed + 1 end
	end

	if (Details:GetMaxInstancesAmount() < NumberToEmbed) then
		Details:SetMaxInstancesAmount(NumberToEmbed)
	end

	local instances_amount = Details:GetNumInstancesAmount()

	for i = instances_amount + 1, NumberToEmbed do
		local new_instance = Details:CreateInstance(i)

		if (type(new_instance) == "table") then
			tinsert(ES.DetailsInstances, new_instance)
		end
	end

	if NumberToEmbed == 1 then
		local EmbedParent = ES.Main
		if AS:CheckOption('EmbedSystemDual') then
			EmbedParent = AS:CheckOption('EmbedRight') == 'Details' and ES.Right or ES.Left
		end
		ES:DetailsWindow(ES.DetailsInstances[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)

		if (ES.DetailsInstances[2]) then
			ES.DetailsInstances[2]._ElvUIEmbed = nil
		end
	elseif NumberToEmbed == 2 then
		ES:DetailsWindow(ES.DetailsInstances[1], ES.Left:GetWidth(), ES.Left:GetHeight(), 'TOPLEFT', ES.Left, 'TOPLEFT', 2, 0)
		ES:DetailsWindow(ES.DetailsInstances[2], ES.Right:GetWidth(), ES.Right:GetHeight(), 'TOPRIGHT', ES.Right, 'TOPRIGHT', -2, 0)
	end
end
