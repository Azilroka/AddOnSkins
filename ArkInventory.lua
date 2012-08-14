if not IsAddOnLoaded("ArkInventory") then return end
local ArkInventory = LibStub("AceAddon-3.0"):GetAddon("ArkInventory")
if not ArkInventory then return end

local _G = _G
Mod_AddonSkins:RegisterSkin("ArkInventory",function(Skin,skin,Layout,layout,config)
	--[[ ArkInventory config paths ]]
	--This is so wasteful of memory! 
	local BAR_PADDING_INTERNAL = { "bar", "pad", "internal" }
	local BAR_PADDING_LABEL = { "bar", "name", "height" }
	local BAR_PADDING_EXTERNAL = { "bar", "pad", "external" }
	local WINDOW_PADDING = { "window", "pad" }
	
	-- Hook paint function to strip background and borders
	ArkInventory.Frame_Main_Paint_ = ArkInventory.Frame_Main_Paint
	ArkInventory.Frame_Main_Paint = function(frame)
		--ArkInventory.Frame_Main_Paint_(frame) -- MASSIVE MEMORY WASTE, so don't bother to call
		if not ArkInventory.ValidFrame(frame, true) then return	end
		for i = 1, select("#",frame:GetChildren()) do
			local subframe = select(i,frame:GetChildren())
			local name = subframe:GetName()
			if name then
				if _G[name.."ArkBorder"] then _G[name.."ArkBorder"]:Hide() end
				if _G[name.."Background"] then _G[name.."Background"]:Hide() end
			end
			skin:SkinBackgroundFrame(subframe)
			-- Whew! We just saved the wasteful creation of over 7 tables!
		end
	end
	
	--[[ Item Containers ]]
	ArkInventory.Frame_Container_Draw_ = ArkInventory.Frame_Container_Draw
	ArkInventory.Frame_Container_Draw = function(frame)
		local loc_id = frame.ARK_Data.loc_id
		-- lock a few settings
		ArkInventory.LocationOptionSet(loc_id, BAR_PADDING_EXTERNAL, 2)
		ArkInventory.LocationOptionSet(loc_id, WINDOW_PADDING, 0)
		ArkInventory.Frame_Container_Draw_(frame)
	end
	
	--[[ Scaling ]]
	ArkInventory.Frame_Main_Scale_ = ArkInventory.Frame_Main_Scale
	ArkInventory.Frame_Main_Scale = function(frame)
		-- Lock the scale at 1 to protect our pixel-perfect borders!
		frame:SetScale(1)
		ArkInventory.Frame_Main_Anchor_Set(frame.ARK_Data.loc_id)
	end
	
	--[[ Anchoring ]]
	ArkInventory.Frame_Main_Anchor_Set_ = ArkInventory.Frame_Main_Anchor_Set
	ArkInventory.Frame_Main_Anchor_Set = function(loc_id)
		ArkInventory.Frame_Main_Anchor_Set_(loc_id)
		local frame = ArkInventory.Frame_Main_Get(loc_id)
		frame = frame:GetName()
		local title = _G[frame..ArkInventory.Const.Frame.Title.Name]
		local search = _G[frame..ArkInventory.Const.Frame.Search.Name]
		local container = _G[frame..ArkInventory.Const.Frame.Container.Name]
		local changer = _G[frame..ArkInventory.Const.Frame.Changer.Name]
		local status = _G[frame..ArkInventory.Const.Frame.Status.Name]
		title:ClearAllPoints()
		title:SetPoint("TOPLEFT")
		title:SetPoint("TOPRIGHT")
		search:ClearAllPoints()
		search:SetPoint("TOPLEFT",title,"BOTTOMLEFT",0,-2)
		search:SetPoint("TOPRIGHT",title,"BOTTOMRIGHT",0,-2)
		container:ClearAllPoints()
		container:SetPoint("TOPLEFT",search,"BOTTOMLEFT",0,-2)
		container:SetPoint("TOPRIGHT",search,"BOTTOMRIGHT",0,-2)
		changer:ClearAllPoints()
		changer:SetPoint("TOPLEFT",container,"BOTTOMLEFT",0,-2)
		changer:SetPoint("TOPRIGHT",container,"BOTTOMRIGHT",0,-2)
		status:ClearAllPoints()
		status:SetPoint("TOPLEFT",changer,"BOTTOMLEFT",0,-2)
		status:SetPoint("TOPRIGHT",changer,"BOTTOMRIGHT",0,-2)
		-- Reanchor & resize internal components
		-- Status
		ArkInventory.Const.Frame.Status.Height = config.fontSize + config.borderWidth * 4
		_G[status:GetName().."EmptyText"]:SetPoint("LEFT",config.borderWidth,0)
		_G[status:GetName().."EmptyText"]:SetFont(config.font,config.fontSize,config.fontFlags)
		-- Restructure the gold display
		_G[status:GetName().."GoldCopperButton"]:SetPoint("RIGHT",-config.borderWidth,0)
		_G[status:GetName().."GoldCopperButtonText"]:SetFont(config.font,config.fontSize,config.fontFlags)
		--_G[status:GetName().."GoldCopperButtonText"]:SetPoint("RIGHT",-13,1)
		
		_G[status:GetName().."GoldSilverButton"]:SetPoint("RIGHT",_G[status:GetName().."GoldCopperButtonText"],"LEFT",-config.borderWidth,0)
		_G[status:GetName().."GoldSilverButtonText"]:SetFont(config.font,config.fontSize,config.fontFlags)
		--_G[status:GetName().."GoldSilverButtonText"]:SetPoint("RIGHT",-13,1)
		
		_G[status:GetName().."GoldGoldButton"]:SetPoint("RIGHT",_G[status:GetName().."GoldSilverButtonText"],"LEFT",-config.borderWidth,0)
		_G[status:GetName().."GoldGoldButtonText"]:SetFont(config.font,config.fontSize,config.fontFlags)
		--_G[status:GetName().."GoldSilverButtonText"]:SetPoint("RIGHT",-13,1)
		
	end
	
	ArkInventory.Const.Frame.Title.Height2 = 32
	
	-- Skin each bar
	ArkInventory.Frame_Bar_Paint_ = ArkInventory.Frame_Bar_Paint
	ArkInventory.Frame_Bar_Paint = function(bar)
		-- Option overrides
		local loc_id = bar.ARK_Data.loc_id
		ArkInventory.LocationOptionSet(loc_id, BAR_PADDING_INTERNAL, 2)
		ArkInventory.LocationOptionSet(loc_id, BAR_PADDING_LABEL, 18)
		ArkInventory.Frame_Bar_Paint_(bar)
		if not bar then return end
		local name = bar:GetName()
		if _G[name.."ArkBorder"] then _G[name.."ArkBorder"]:Hide() end
		if _G[name.."Background"] then _G[name.."Background"]:Hide() end
		skin:SkinFrame(bar)
		-- Edit mode
		if ArkInventory.Global.Mode.Edit then
			bar:SetBackdropBorderColor(1,0,0,1)
			bar:SetBackdropColor(1,0,0,.1)
		end
	end
	
	--[[ Item Icons ]]
	ArkInventory.SetItemButtonTexture_ = ArkInventory.SetItemButtonTexture
	ArkInventory.SetItemButtonTexture = function(frame, texture, r, g, b)
		if not frame or not _G[frame:GetName().."IconTexture"] then return end
		local obj = _G[frame:GetName().."IconTexture"]
		if not texture then
			obj:Hide()
		else
			obj:SetTexture(texture)
			obj:SetTexCoord(unpack(config.buttonZoom))
			obj:SetVertexColor(r or 1, r and g or 1, r and b or 1)
			obj:ClearAllPoints()
			obj:SetPoint("TOPLEFT",config.borderWidth,-config.borderWidth)
			obj:SetPoint("BOTTOMRIGHT",-config.borderWidth,config.borderWidth)
		end
	end
	
	--[[ Item Border ]]
	ArkInventory.Frame_Item_Update_Border_ = ArkInventory.Frame_Item_Update_Border
	ArkInventory.Frame_Item_Update_Border = function(frame)
		ArkInventory.Frame_Item_Update_Border_(frame)
		if not frame or not _G[frame:GetName().."ArkBorder"] then return end
		local obj = _G[frame:GetName().."ArkBorder"]
		local r,g,b,a = obj:GetBackdropBorderColor()
		obj:Hide()
		skin:SkinFrame(frame)
		frame:SetBackdropBorderColor(r,g,b,a)

	end
end)
--[[
do
	
	-- hook the main draw function
	ArkInventory.Frame_Main_Draw_ = ArkInventory.Frame_Main_Draw
	ArkInventory.Frame_Main_Draw = function( frame )
		ArkInventory.Frame_Main_Draw_( frame )
		local af = frame:GetName( )
		for _, v in pairs{ "Title", "Search", "Container", "Changer", "Status" } do
			TukuiDB:SetTemplate( _G[af..v] )
		end
	end
	
	TukuiDB:SetTemplate( _G["ARKINV_RulesTitle"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrame"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameViewTitle"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameViewSearch"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameViewSort"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameViewTable"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameViewMenu"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrame"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameModifyTitle"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameModifyMenu"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameModifyData"] )
	TukuiDB:SetTemplate( _G["ARKINV_RulesFrameModifyDataScrollTextBorder"] )
	
	TukuiDB:SetTemplate( _G["ARKINV_SearchTitle"] )
	TukuiDB:SetTemplate( _G["ARKINV_SearchFrameViewSearch"] )
	TukuiDB:SetTemplate( _G["ARKINV_SearchFrameViewTable"] )
	TukuiDB:SetTemplate( _G["ARKINV_SearchFrame"] )
	
	TukuiDB:SetTemplate( _G["ARKINV_Frame4Log"] )
	
	-- hook the anchors
	ArkInventory.Frame_Main_Anchor_Set_ = ArkInventory.Frame_Main_Anchor_Set
	ArkInventory.Frame_Main_Anchor_Set = function( loc_id, rescale )
		local frame = ArkInventory.Frame_Main_Get( loc_id )
		
		local f1 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name]
		local f2 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Search.Name]
		local f3 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]
		local f4 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Changer.Name]
		local f5 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name]
		
		frame:ClearAllPoints( )
		f1:ClearAllPoints( )
		f2:ClearAllPoints( )
		f3:ClearAllPoints( )
		f4:ClearAllPoints( )
		f5:ClearAllPoints( )
		
		if loc_id == 3 or loc_id == 4 or loc_id == 5 then
			frame:SetPoint( "BOTTOMLEFT", InfoLeft, "TOPLEFT", 0, TukuiDB:Scale( 5 ) )
			
			f5:SetPoint( "BOTTOMLEFT", frame )
			f5:SetPoint( "RIGHT", frame )
		
			f4:SetPoint( "BOTTOMLEFT", f5, "TOPLEFT", 0, -3 )
			f4:SetPoint( "RIGHT", frame )
		
			f3:SetPoint( "BOTTOMLEFT", f4, "TOPLEFT", 0, -3 )
			f3:SetPoint( "RIGHT", frame )
		
			f2:SetPoint( "BOTTOMLEFT", f3, "TOPLEFT", 0, -4 )
			f2:SetPoint( "RIGHT", frame )

			f1:SetPoint( "BOTTOMLEFT", f2, "TOPLEFT", 0, -3 )
			f1:SetPoint( "RIGHT", frame )
		else
			frame:SetPoint( "BOTTOMRIGHT", InfoRight, "TOPRIGHT", 0, TukuiDB:Scale( 5 ) )
			
			f5:SetPoint( "BOTTOMRIGHT", frame )
			f5:SetPoint( "LEFT", frame )
		
			f4:SetPoint( "BOTTOMRIGHT", f5, "TOPRIGHT", 0, -3 )
			f4:SetPoint( "LEFT", frame )
		
			f3:SetPoint( "BOTTOMRIGHT", f4, "TOPRIGHT", 0, -3 )
			f3:SetPoint( "LEFT", frame )
		
			f2:SetPoint( "BOTTOMRIGHT", f3, "TOPRIGHT", 0, -4 )
			f2:SetPoint( "LEFT", frame )

			f1:SetPoint( "BOTTOMRIGHT", f2, "TOPRIGHT", 0, -3 )
			f1:SetPoint( "LEFT", frame )
		end
		
		if ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "locked" } ) then
			frame:RegisterForDrag( )
		else
			frame:RegisterForDrag( "LeftButton" )
		end

		if rescale then
			ArkInventory.Frame_Main_Anchor_Save( frame )
		end
	end
	
	-- Set some settings to make it look better
	for i = 1, 9 do
		ArkInventory.LocationOptionSet( i, { "changer", "hide" }, true )
		ArkInventory.LocationOptionSet( i, { "title", "size" }, ArkInventory.Const.Window.Title.SizeThin )
	
		if TukuiDB["panels"].tinfowidth >= 405 then
			ArkInventory.LocationOptionSet( i, { "window", "width" }, 12 )
		elseif TukuiDB["panels"].tinfowidth >= 370 and TukuiDB["panels"].tinfowidth < 405 then
			ArkInventory.LocationOptionSet( i, { "window", "width" }, 11 )
		elseif TukuiDB["panels"].tinfowidth >= 335 and TukuiDB["panels"].tinfowidth < 370 then
			ArkInventory.LocationOptionSet( i, { "window", "width" }, 10 )
		else
			ArkInventory.LocationOptionSet( i, { "window", "width" }, 9 )
		end
	end
end
]]