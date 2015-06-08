local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('DailyTamerCheck') then return end

function AS:DailyTamerCheck()
	local function SkinFrame()
		if DailyTamerCheck_mainframe.IsHooked then return end
		DailyTamerCheck_mainframe:HookScript('OnUpdate', function(self)
			if self.IsSkinned then return end
			AS:SkinFrame(self)
			self:SetScale(UIParent:GetScale())
			for i = 1, self:GetNumChildren() do
				local object = select(i, self:GetChildren())
				if object:IsObjectType('Button') and not object.IsSkinned then
					AS:SkinButton(object)
					object.IsSkinned = true
				end
				if object:IsObjectType('Frame') then
					if not object.texture then
						AS:SkinFrame(object)
					else
						AS:SkinTexture(object.texture)
					end
				end
			end
			self.IsSkinned = true
		end)
		DailyTamerCheck_mainframe.IsHooked = true
	end

	for i = 1, Minimap:GetNumChildren() do
		local object = select(i, Minimap:GetChildren())
		if object:IsObjectType('Button') and strfind(object:GetName(), 'DailyTamerCheck') then
			object:HookScript('PostClick', SkinFrame)
		end
	end

	hooksecurefunc(SlashCmdList, "DAILYTAMERCHECK", SkinFrame)
end

AS:RegisterSkin('DailyTamerCheck', AS.DailyTamerCheck)