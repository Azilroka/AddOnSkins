local AS, L, S, R = unpack(AddOnSkins)

function R:oRA3()
	local SkinOra = function(module)
		if module == "main" and not oRA3Frame.IsSkinned then
			local buttonNames = {["oRA3Disband"] = true, ["oRA3Options"] = true}
			S:StripTextures(oRA3Frame, true)
			S:CreateBackdrop(oRA3Frame)
			oRA3Frame:SetSize(oRA3Frame:GetWidth()-30, oRA3Frame:GetHeight()-45)
			oRA3Frame:SetHitRectInsets(0,0,0,0)
			for i, child in ipairs({oRA3Frame:GetChildren()}) do
				local otype = child:GetObjectType()
				local name = child:GetName()
				if otype == "Button" then
					if (name) then
						if buttonNames[name] then
							S:HandleButton(child)
							if name == "oRA3Options" then
								child:SetPoint("TOPRIGHT", -10, -37)
							end
							if name == "oRA3Disband" then
								child:SetPoint("TOPLEFT", 102, -37)
							end
						elseif strfind(name,"oRA3FrameTab") then
							S:HandleTab(child)
							if child:GetName() == "oRA3FrameTab1" then
								child:SetPoint("BOTTOMLEFT", 11, 1)
							end
						end
					else
						if child:GetParent() == oRA3Frame then
							child:SetPoint("TOPRIGHT", 0, 0)
							S:HandleCloseButton(child)
						end
					end
				end
				if otype == "ScrollFrame" then
					if name and name == "oRA3ScrollFrame" then
						S:StripTextures(child)
						S:HandleScrollBar(oRA3ScrollFrameScrollBar)
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
					S:HandleButton(child)
				end
				if otype == "ScrollFrame" and name and name == "oRA3ScrollFrame" then
					S:StripTextures(child)
					S:CreateBackdrop(child)
					S:HandleScrollBar(oRA3ScrollFrameScrollBar)
				end
			end
			oRA3Frame:SetScript('OnUpdate', function(self)
				for i = 1, 4 do
					local header = _G["oRA3ScrollHeader"..i]
					if header and not header.IsSkinned then
						S:HandleFrame(header)
						header.IsSkinned = true
					end
				end
			end)
			S:Kill(oRA3ScrollFrameTop)
			S:Kill(oRA3ScrollFrameBottom)
			oRA3Frame.IsSkinned = true
		end

		if module == "tanks" and not oRA3TankTopScrollFrame.IsSkinned then
			S:StripTextures(oRA3TankTopScrollFrame)
			S:StripTextures(oRA3TankBottomScrollFrame)
			S:HandleScrollBar(oRA3TankTopScrollFrameScrollBar)
			S:HandleScrollBar(oRA3TankBottomScrollFrameScrollBar)
			for i = 1, 10 do
				S:HandleCheckBox(_G["oRA3TankHideButton"..i])
			end
			oRA3TankTopScrollFrame.IsSkinned = true
		end

		if module == "readycheck" and oRA3ReadyCheck and not oRA3ReadyCheck.IsSkinned then
			S:StripTextures(oRA3ReadyCheck, true)
			S:CreateBackdrop(oRA3ReadyCheck)
			for i,child in ipairs({oRA3ReadyCheck:GetChildren()}) do
				if child:IsObjectType("Button") and not (child:GetScript("OnDragStart") or child == oRA3ReadyCheck.bar) then
					S:HandleCloseButton(child)
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

AS:RegisterSkin('oRA3')
