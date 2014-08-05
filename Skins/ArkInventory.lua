local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('ArkInventory') then return end

local name = 'ArkInventorySkin'
function AS:SkinArkInventory()
	hooksecurefunc(ArkInventory, 'Frame_Main_Paint', function(frame)
		if not ArkInventory.ValidFrame(frame, true) then return	end
		for i = 1, select('#', frame:GetChildren()) do
			local subframe = select(i, frame:GetChildren())
			local name = subframe:GetName()
			if name then
				if _G[name..'ArkBorder'] then _G[name..'ArkBorder']:Hide() end
				if _G[name..'Background'] then _G[name..'Background']:Hide() end
			end
			AS:SkinFrame(subframe)
		end
	end)

	hooksecurefunc(ArkInventory, 'Frame_Main_Anchor_Set', function(loc_id)
		local frame = ArkInventory.Frame_Main_Get(loc_id):GetName()
		local title = _G[frame..ArkInventory.Const.Frame.Title.Name]
		local search = _G[frame..ArkInventory.Const.Frame.Search.Name]
		local container = _G[frame..ArkInventory.Const.Frame.Container.Name]
		local changer = _G[frame..ArkInventory.Const.Frame.Changer.Name]
		local status = _G[frame..ArkInventory.Const.Frame.Status.Name]
		title:ClearAllPoints()
		title:SetPoint('TOPLEFT')
		title:SetPoint('TOPRIGHT')
		search:ClearAllPoints()
		search:SetPoint('TOPLEFT', title, 'BOTTOMLEFT', 0, -2)
		search:SetPoint('TOPRIGHT', title, 'BOTTOMRIGHT', 0, -2)
		container:ClearAllPoints()
		container:SetPoint('TOPLEFT', search, 'BOTTOMLEFT', 0, -2)
		container:SetPoint('TOPRIGHT', search, 'BOTTOMRIGHT', 0, -2)
		changer:ClearAllPoints()
		changer:SetPoint('TOPLEFT', container, 'BOTTOMLEFT', 0, -2)
		changer:SetPoint('TOPRIGHT', container, 'BOTTOMRIGHT', 0, -2)
		status:ClearAllPoints()
		status:SetPoint('TOPLEFT', changer, 'BOTTOMLEFT', 0, -2)
		status:SetPoint('TOPRIGHT', changer, 'BOTTOMRIGHT', 0, -2)
		ARKINV_Frame4ChangerWindowPurchaseInfo:ClearAllPoints()
		ARKINV_Frame4ChangerWindowPurchaseInfo:SetPoint('TOP', ARKINV_Frame4ChangerWindowGoldAvailable, 'BOTTOM', 0, -12)
		_G[status:GetName()..'EmptyText']:SetPoint('LEFT', 2, 0)
		_G[status:GetName()..'EmptyText']:SetFont(AS.Font, 12)
		_G[status:GetName()..'GoldCopperButton']:SetPoint('RIGHT', -1, 0)
		_G[status:GetName()..'GoldCopperButtonText']:SetFont(AS.Font, 12)
		_G[status:GetName()..'GoldSilverButton']:SetPoint('RIGHT', _G[status:GetName()..'GoldCopperButtonText'], 'LEFT', -1,0)
		_G[status:GetName()..'GoldSilverButtonText']:SetFont(AS.Font, 12)
		_G[status:GetName()..'GoldGoldButton']:SetPoint('RIGHT', _G[status:GetName()..'GoldSilverButtonText'], 'LEFT', -1, 0)
		_G[status:GetName()..'GoldGoldButtonText']:SetFont(AS.Font, 12)
	end)

	hooksecurefunc(ArkInventory, 'Frame_Bar_Paint', function(bar)
		local loc_id = bar.ARK_Data.loc_id
		ArkInventory.LocationOptionSet(loc_id, 'bar', 'name', 'height', 18)
		local name = bar:GetName()
		if _G[name..'ArkBorder'] then _G[name..'ArkBorder']:Hide() end
		if _G[name..'Background'] then _G[name..'Background']:Hide() end
		AS:SkinFrame(bar)

		if ArkInventory.Global.Mode.Edit then
			bar:SetBackdropBorderColor(1, 0, 0, 1)
			bar:SetBackdropColor(1, 0, 0, .1)
		end
	end)

	hooksecurefunc(ArkInventory, 'SetItemButtonTexture', function(frame, texture, r, g, b)
		local obj = _G[frame:GetName()..'IconTexture']
		if not texture then
			obj:Hide()
		else
			obj:SetTexture(texture)
			AS:SkinTexture(obj)
			obj:SetVertexColor(r or 1, r and g or 1, r and b or 1)
			obj:ClearAllPoints()
			obj:SetInside()
		end
	end)

	hooksecurefunc(ArkInventory, 'Frame_Item_Update_Border', function(frame)
		local obj = _G[frame:GetName()..'ArkBorder']
		local r, g, b, a = obj:GetBackdropBorderColor()
		obj:Hide()
		if _G[frame:GetName()] == ARKINV_Frame1ChangerWindowBag1 then ARKINV_Frame1ChangerWindowBag1IconTexture:SetTexture('interface\\icons\\inv_misc_bag_07_green') end
		if _G[frame:GetName()..'Background'] then _G[frame:GetName()..'Background']:Hide() end
		AS:SkinIconButton(frame, true)
		local Backdrop = frame.backdrop or frame.Backdrop
		Backdrop:SetBackdropBorderColor(r,g,b,a)
	end)
end

AS:RegisterSkin(name, AS.SkinArkInventory)