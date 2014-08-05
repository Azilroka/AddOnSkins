local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('oRA3') then return end

local name = 'oRA3Skin'
function AS:SkinoRA3(event, addon)
	local SkinOra = function(module)
		if module == "main" and not oRA3Frame.IsSkinned then
			local buttonNames = {["oRA3Disband"] = true, ["oRA3Options"] = true}
			oRA3Frame:StripTextures(true)
			oRA3Frame:CreateBackdrop("Transparent")
			oRA3Frame:SetSize(oRA3Frame:GetWidth()-30, oRA3Frame:GetHeight()-45)
			oRA3Frame:SetHitRectInsets(0,0,0,0)
			for i, child in ipairs({oRA3Frame:GetChildren()}) do
				local otype = child:GetObjectType()
				local name = child:GetName()
				if otype == "Button" then
					if (name) then
						if buttonNames[name] then
							AS:SkinButton(child)
							if name == "oRA3Options" then
								child:SetPoint("TOPRIGHT", -10, -37)
							end
							if name == "oRA3Disband" then
								child:SetPoint("TOPLEFT", 102, -37)
							end
						elseif strfind(name,"oRA3FrameTab") then
							AS:SkinTab(child)
							if child:GetName() == "oRA3FrameTab1" then
								child:SetPoint("BOTTOMLEFT", 11, 1)
							end
						end
					else
						if child:GetParent() == oRA3Frame then
							child:SetPoint("TOPRIGHT", 0, 0)
							AS:SkinCloseButton(child)
						end
					end
				end
				if otype == "ScrollFrame" then
					if name and name == "oRA3ScrollFrame" then
						child:StripTextures()
						AS:SkinScrollBar(oRA3ScrollFrameScrollBar)
					end
				end
			end
			local contentFrame = oRA3ListFrame:GetParent()
			if contentFrame then 
				contentFrame:SetPoint("BOTTOMRIGHT", -10, 33)
			end
			for i, child in ipairs({oRA3ListFrame:GetChildren()}) do
				local otype = child:GetObjectType()
				local name = child:GetName()
				if otype == "Button" and name and strfind(name,"oRA3ListButton") then
					AS:SkinButton(child)
				end
				if otype == "ScrollFrame" and name and name == "oRA3ScrollFrame" then
					child:StripTextures()
					child:CreateBackdrop('Transparent')
					AS:SkinScrollBar(oRA3ScrollFrameScrollBar)
				end
			end
			oRA3Frame:SetScript('OnUpdate', function(self)
				for i = 1, 4 do
					local header = _G["oRA3ScrollHeader"..i]
					if header and not header.IsSkinned then
						AS:SkinFrame(header)
						header.IsSkinned = true
					end
				end
			end)
			oRA3ScrollFrameTop:Kill()
			oRA3ScrollFrameBottom:Kill()
			oRA3Frame.IsSkinned = true
		end

		if module == "tanks" and not oRA3TankTopScrollFrame.IsSkinned then
			oRA3TankTopScrollFrame:StripTextures()
			oRA3TankBottomScrollFrame:StripTextures()
			AS:SkinScrollBar(oRA3TankTopScrollFrameScrollBar)
			AS:SkinScrollBar(oRA3TankBottomScrollFrameScrollBar)
			for i = 1, 10 do
				AS:SkinCheckBox(_G["oRA3TankHideButton"..i])
			end
			oRA3TankTopScrollFrame.IsSkinned = true
		end

		if module == "readycheck" and not oRA3ReadyCheck.IsSkinned then
			oRA3ReadyCheck:StripTextures(true)
			oRA3ReadyCheck:CreateBackdrop("Transparent")
			for i,child in ipairs({oRA3ReadyCheck:GetChildren()}) do
				if child:IsObjectType("Button") and not (child:GetScript("OnDragStart") or child == oRA3ReadyCheck.bar) then
					AS:SkinCloseButton(child)
					break
				end
			end
			oRA3ReadyCheck.IsSkinned = true
		end
	end
	hooksecurefunc(oRA3, "ToggleFrame", function() SkinOra("main") end)
	local ReadyCheckModule = oRA3:GetModule("ReadyCheck")
	if (ReadyCheckModule) then
		hooksecurefunc(ReadyCheckModule, "READY_CHECK", function() SkinOra("readycheck") end)
	end
	local TanksModule = oRA3:GetModule("Tanks")
	if (TanksModule) then
		if TanksModule.CreateFrame then
			hooksecurefunc(TanksModule, "CreateFrame", function() SkinOra("tanks") end)
		else
			SkinOra("tanks")
		end
	end
end

AS:RegisterSkin(name, AS.SkinoRA3, 'ADDON_LOADED')