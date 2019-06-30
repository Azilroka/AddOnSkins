local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArkInventory') then return end

function AS:ArkInventory()
	hooksecurefunc(ArkInventory, 'Frame_Main_Paint', function(frame)
		if not ArkInventory.ValidFrame(frame, true) then return	end
		for i = 1, select('#', frame:GetChildren()) do
			local subframe = select(i, frame:GetChildren())
			if subframe.IsSkinned then return end
			local name = subframe:GetName()
			if name then
				if _G[name..'ArkBorder'] then AS:Kill(_G[name..'ArkBorder']) end
				if _G[name..'Background'] then AS:Kill(_G[name..'Background']) end
			end
			AS:SkinFrame(subframe)
			subframe.IsSkinned = true
		end
	end)

	hooksecurefunc(ArkInventory, 'Frame_Main_Anchor_Set', function(loc_id)
		local frame = ArkInventory.Frame_Main_Get(loc_id):GetName()
		AS:SkinEditBox(_G[frame..ArkInventory.Const.Frame.Search.Name..'Filter'])
		local f = _G[frame..ArkInventory.Const.Frame.Search.Name..'Filter']
		local b = _G[frame..ArkInventory.Const.Frame.Search.Name..'Clear']
		if f and f.Backdrop then
			f.Backdrop:SetFrameLevel(0)
			f.Backdrop:SetOutside(f.Backdrop:GetParent(), 1, -2)
		end
		if b then
			AS:SkinButton(b)
			b:SetNormalTexture([[Interface\Buttons\UI-GroupLoot-Pass-Up]])
			b:SetHighlightTexture([[Interface\Buttons\UI-GroupLoot-Pass-Highlight]])
			b:SetPushedTexture([[Interface\Buttons\UI-GroupLoot-Pass-Down]])
		end
	end)

	hooksecurefunc(ArkInventory, 'Frame_Bar_Paint', function(bar)
		local loc_id = bar.ARK_Data.loc_id

		if not bar.IsSkinned then
			local name = bar:GetName()
			if _G[name..'ArkBorder'] then AS:Kill(_G[name..'ArkBorder']) end
			if _G[name..'Background'] then AS:Kill(_G[name..'Background']) end
			bar.IsSkinned = true
		end

		AS:SetTemplate(bar)

		if ArkInventory.Global.Mode.Edit then
			bar:SetBackdropBorderColor(1, 0, 0, 1)
			bar:SetBackdropColor(1, 0, 0, .1)
		else
			bar:SetBackdropBorderColor(_G[bar:GetName()..'ArkBorder']:GetBackdropBorderColor())
		end
	end)

	hooksecurefunc(ArkInventory, 'SetItemButtonTexture', function(frame, texture, r, g, b)
		if not (frame and frame.icon) then
			return
		end

		AS:SkinTexture(frame.icon)
		frame.icon:SetInside()
	end)

	hooksecurefunc(ArkInventory, 'Frame_Item_Update_Border', function(frame)
		if not ArkInventory.ValidFrame(frame, true) then return end
		local obj = _G[frame:GetName()..'ArkBorder']
		if not obj then return end
		AS:Kill(obj)

		AS:SetTemplate(frame)
		frame:SetBackdropBorderColor(obj:GetBackdropBorderColor())
		frame:SetBackdropColor(unpack(AS.BorderColor))
		AS:SkinTexture(frame.icon)
		frame:SetNormalTexture(nil)
		if _G[frame:GetName()] == ARKINV_Frame1ChangerWindowBag1 then
			ARKINV_Frame1ChangerWindowBag1IconTexture:SetTexture('interface\\icons\\inv_misc_bag_07_green')
			AS:SkinTexture(ARKINV_Frame1ChangerWindowBag1IconTexture)
			ARKINV_Frame1ChangerWindowBag1IconTexture:SetInside()
		end
	end)

	hooksecurefunc(ArkInventory, 'Frame_Border_Paint', function(border, slot, file, size, offset, scale, r, g, b, a)
		local parent = border:GetParent()
		parent:SetBackdropBorderColor(r, g, b, a)
		parent:SetBackdropColor(unpack(AS.BackdropColor))
	end)

	hooksecurefunc(ArkInventory, 'Frame_Item_Update_Clickable', function(frame)
		local obj = _G[frame:GetName()..ArkInventory.Const.Frame.Cooldown.Name]
		if obj then
			ElvUI[1]:RegisterCooldown(obj)
		end
	end)
end

AS:RegisterSkin('ArkInventory', AS.ArkInventory)
