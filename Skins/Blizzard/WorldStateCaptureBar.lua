local AS = unpack(AddOnSkins)

function AS:Blizzard_WorldStateCaptureBar(event, addon)
	local Horde = "Interface\\AddOns\\AddOnSkins\\Media\\Icons\\Horde"
	local Alliance = "Interface\\AddOns\\AddOnSkins\\Media\\Icons\\Alliance"
	local FFA = "Interface\\AddOns\\AddOnSkins\\Media\\Icons\\FFA"

	local CreateCaptureBar = function(ID)
		if not _G['WorldStateCaptureBar'..ID] then return end
		AS:StripTextures(_G['WorldStateCaptureBar'..ID], true)
		AS:StripTextures(_G['WorldStateCaptureBar'..ID..'Indicator'], true)
		_G['WorldStateCaptureBar'..ID..'LeftBar']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'RightBar']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'MiddleBar']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'IndicatorLeft']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'IndicatorRight']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'LeftLine']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'RightLine']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'LeftIconHighlight']:SetTexture(nil)
		_G['WorldStateCaptureBar'..ID..'RightIconHighlight']:SetTexture(nil)

		if _G['CaptureBar'..ID] then return end
		local Bar = CreateFrame('StatusBar', 'CaptureBar'..ID, _G['WorldStateCaptureBar'..ID])
		Bar:SetFrameLevel(0)
		Bar:SetPoint('CENTER', UIParent, 'CENTER', 0, 360)
		AS:CreateBackdrop(Bar)
		Bar:SetSize(160, 16)
		Bar:SetStatusBarTexture(AS.NormTex)
		Bar:SetStatusBarColor(1, 1, 1)
		Bar:SetMinMaxValues(0, 100)
		Bar:SetValue(100)

		Bar.AllianceBar = CreateFrame('StatusBar', nil, Bar)
		Bar.AllianceBar:SetFrameLevel(1)
		Bar.AllianceBar:SetPoint('LEFT', Bar, 'LEFT', 0, 0)
		Bar.AllianceBar:SetSize(160, 16)
		Bar.AllianceBar:SetStatusBarTexture(AS.NormTex)
		Bar.AllianceBar:SetStatusBarColor(0, .44, .87)
		Bar.AllianceBar:SetMinMaxValues(0, 100)

		Bar.AllianceIcon = Bar:CreateTexture(nil, 'ARTWORK')
		Bar.AllianceIcon:SetTexture(Alliance)
		Bar.AllianceIcon:SetPoint('RIGHT', Bar, 'LEFT', 0, 0)
		Bar.AllianceIcon:SetSize(32, 32)

		Bar.HordeBar = CreateFrame('StatusBar', nil, Bar)
		Bar.HordeBar:SetFrameLevel(1)
		Bar.HordeBar:SetPoint('LEFT', Bar, 'LEFT', 0, 0)
		Bar.HordeBar:SetSize(160, 16)
		Bar.HordeBar:SetStatusBarTexture(AS.NormTex)
		Bar.HordeBar:SetStatusBarColor(.77, .12, .23)
		Bar.HordeBar:SetMinMaxValues(0, 100)
		Bar.HordeBar:SetReverseFill(true)

		Bar.HordeIcon = Bar:CreateTexture(nil, 'ARTWORK')
		Bar.HordeIcon:SetTexture(Horde)
		Bar.HordeIcon:SetPoint('LEFT', Bar, 'RIGHT', 0, 0)
		Bar.HordeIcon:SetSize(32, 32)

		Bar.SparkBar = CreateFrame('StatusBar', nil, Bar)
		Bar.SparkBar:SetFrameLevel(3)
		Bar.SparkBar:SetPoint('LEFT', Bar, 'LEFT', 0, 0)
		Bar.SparkBar:SetSize(160, 16)
		Bar.SparkBar:SetStatusBarTexture(0, 0, 0, 0)
		Bar.SparkBar:SetMinMaxValues(0, 100)
		Bar.SparkBar:SetReverseFill(true)

		Bar.SparkBar.Spark = CreateFrame('Frame', nil, Bar.SparkBar)
		Bar.SparkBar.Spark:SetFrameLevel(3)
		AS:SetTemplate(Bar.SparkBar.Spark)
		Bar.SparkBar.Spark:SetSize(4, 18)
		Bar.SparkBar.Spark:SetPoint('CENTER', Bar.SparkBar:GetStatusBarTexture(), 'LEFT', 0, 0)

		Bar.SparkBar.Spark.Texture = Bar.SparkBar.Spark:CreateTexture(nil, 'ARTWORK')
		Bar.SparkBar.Spark.Texture:SetPoint('CENTER', Bar.SparkBar.Spark, 'CENTER', 0, 0)
		Bar.SparkBar.Spark.Texture:SetSize(32, 32)
	end

	local style = 1
	local UpdateCaptureBar = function(ID, Current, Neutral)
		local Bar = _G['CaptureBar'..ID]
		if not Bar then CreateCaptureBar(ID) end
		local FactionZone = (100 - Neutral) / 2
		if style == 1 then
			Bar.AllianceBar:SetValue(FactionZone)
			Bar.HordeBar:SetValue(FactionZone)
			Bar.SparkBar:SetValue(Current)
			Bar.SparkBar:Show()
		end
		if style == 2 then
			Neutral = Neutral / 2
			Bar.AllianceBar:SetValue(Current - Neutral)
			Bar.HordeBar:SetValue(100 - Current - Neutral)
 			if Current > 90 then Bar.AllianceBar:SetValue(Current) end
			if Current < 10 then Bar.HordeBar:SetValue(100 - Current) end
			Bar.SparkBar:Hide()
		end
		if style == 3 then
			Bar.AllianceBar:SetValue(Current)
			Bar.HordeBar:SetValue(100 - Current)
			Bar.SparkBar:Hide()
		end
		if style == 4 then
			Bar.AllianceBar:SetValue(FactionZone)
			Bar.HordeBar:SetValue(FactionZone)
			Bar.SparkBar:SetValue(Current)
			Bar.SparkBar:Show()
			AS:StripTextures(Bar.SparkBar.Spark)
			Bar.SparkBar.Spark.Texture:Show()
			Bar.SparkBar.Spark.Texture:SetTexture(FFA)
			if Current <= FactionZone then Bar.SparkBar.Spark.Texture:SetTexture(Horde) end
			if Current >= (FactionZone + Neutral) then Bar.SparkBar.Spark.Texture:SetTexture(Alliance) end
			Bar.HordeIcon:Hide()
			Bar.AllianceIcon:Hide()
		end
	end

	hooksecurefunc(ExtendedUI['CAPTUREPOINT'], 'create', CreateCaptureBar)
	hooksecurefunc(ExtendedUI['CAPTUREPOINT'], 'update', UpdateCaptureBar)
end

AS:RegisterSkin('Blizzard_WorldStateCaptureBar', AS.Blizzard_WorldStateCaptureBar)