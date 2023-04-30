local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

function R:Blizzard_BarbershopUI()
	if not AS:IsSkinEnabled('Blizzard_BarbershopUI', 'barber') then return end

	local frame = _G.BarberShopFrame
	S:HandleButton(frame.ResetButton, nil, nil, nil, true, nil, nil, nil, true)
	S:HandleButton(frame.CancelButton, nil, nil, nil, true, nil, nil, nil, true)
	S:HandleButton(frame.AcceptButton, nil, nil, nil, true, nil, nil, nil, true)
end

local function HandleButton(button)
	S:HandleNextPrevButton(button)

	-- remove these to fix error on SetHighlightAtlas from AlphaHighlightButtonMixin
	button:SetScript('OnMouseUp', nil)
	button:SetScript('OnMouseDown', nil)
end

function R:Blizzard_CharacterCustomize()
	if not AS:IsSkinEnabled('Blizzard_CharacterCustomize', 'barber') then return end

	-- backdrop is ugly, so dont use a style
	local frame = _G.CharCustomizeFrame
	S:HandleButton(frame.SmallButtons.ResetCameraButton, nil, nil, true)
	S:HandleButton(frame.SmallButtons.ZoomOutButton, nil, nil, true)
	S:HandleButton(frame.SmallButtons.ZoomInButton, nil, nil, true)
	S:HandleButton(frame.SmallButtons.RotateLeftButton, nil, nil, true)
	S:HandleButton(frame.SmallButtons.RotateRightButton, nil, nil, true)

	hooksecurefunc(frame, 'SetSelectedCategory', function(list)
		if list.selectionPopoutPool then
			for popout in list.selectionPopoutPool:EnumerateActive() do
				if not popout.IsSkinned then
					HandleButton(popout.DecrementButton)
					HandleButton(popout.IncrementButton)

					local button = popout.Button
					button.HighlightTexture:SetAlpha(0)
					button.NormalTexture:SetAlpha(0)

					S:StripTextures(button.Popout)
					S:SetTemplate(button.Popout)

					S:HandleButton(button, nil, nil, nil, true)
					S:SetInside(button.backdrop, nil, 4, 4)

					popout.IsSkinned = true
				end
			end
		end

		local optionPool = list.pools and list.pools:GetPool('CharCustomizeOptionCheckButtonTemplate')
		if optionPool then
			for button in optionPool:EnumerateActive() do
				if not button.isSkinned then
					S:HandleCheckBox(button.Button)
				end
			end
		end
	end)
end

AS:RegisterSkin('Blizzard_BarbershopUI', nil, 'ADDON_LOADED')
AS:RegisterSkin('Blizzard_CharacterCustomize', nil, 'ADDON_LOADED')
