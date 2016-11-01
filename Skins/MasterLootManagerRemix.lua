local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('MasterLootManagerRemix') then return end

function AS:MasterLootManagerRemix()
	if not strfind(GetAddOnMetadata('MasterLootManagerRemix', 'Version'), '2.4') then AS:Print('MasterLootManagerRemix Aborted due to incompatible version.') return end
	local StripAllTextures = {
		MasterLootManagerMain,
		MasterLootLoggerFrame,
		MasterLootLoggerFrameContentScrollFrame,
		MasterLootLoggerAddEditFrame,
	}

	local SetTemplateD = { 
		MasterLootLoggerFrameContentColumnHeader1,
		MasterLootLoggerFrameContentColumnHeader2,
		MasterLootLoggerFrameContentColumnHeader3,
		MasterLootLoggerFrameContentColumnHeader4,
		MasterLootLoggerFrameContentColumnHeader5,
		MasterLootLoggerFrameContentColumnHeader6,																			
	}

	local SetTemplateT = {
		MasterLootManagerMain,
		MasterLootManagerMain_ScrollFrame,
		MasterLootLoggerFrame,
		MasterLootLoggerAddEditFrame,
	}	

	local buttons = {
		MasterLootManagerMain_Countdown,
		MasterLootManagerMain_SelectItem,
		MasterLootManagerMain_AnnounceLoot,
		MasterLootManagerMain_AnnounceMainSpec,
		MasterLootManagerMain_AnnounceOffSpec,
		MasterLootManagerMain_AnnounceNoSpec,
		MasterLootManagerMain_AwardLoot,
		MasterLootManagerMain_Settings,
		MasterLootManagerMain_AssignDE,
		MasterLootManagerMain_AssignBank,
		MasterLootLoggerFrameContentExportButton,
		MasterLootLoggerFrameContentClearButton,
		MasterLootLoggerFrameContentAddButton,
		MasterLootLoggerFrameContentEditButton,
		MasterLootLoggerFrameContentDeleteButton,
		MasterLootLoggerAddEditFrameConfirm,
	}

	local checkboxes = {
		MasterLootLoggerAddEditFrameItem,
		MasterLootLoggerAddEditFrameSource,
		MasterLootLoggerAddEditFrameWinner,
		MasterLootLoggerAddEditFrameValue,
		MasterLootLoggerAddEditFrameMonth,
		MasterLootLoggerAddEditFrameDay,
		MasterLootLoggerAddEditFrameYear,
		MasterLootLoggerAddEditFrameHour,
		MasterLootLoggerAddEditFrameMinute,
	}

	for _, object in pairs(StripAllTextures) do
		AS:StripTextures(object)
	end	

	for _, object in pairs(SetTemplateD) do
		AS:SkinFrame(object, 'Default', true)
	end	

	for _, object in pairs(SetTemplateT) do
		AS:SkinFrame(object, false, true)
	end	

	for _, button in pairs(buttons) do
		AS:SkinButton(button)
	end	

	for _, button in pairs(checkboxes) do
		AS:SkinCheckBox(button)
	end	

	MasterLootManagerMain_AssignDE:SetPoint('TOPLEFT', MasterLootManagerMain_SelectDE, 'TOPRIGHT', 10, -2)
	MasterLootManagerMain_AssignBank:SetPoint('TOPLEFT', MasterLootManagerMain_SelectBank, 'TOPRIGHT', 10, -2)
	MasterLootManagerMain_ScrollFrame:SetPoint('TOPLEFT', MasterLootManagerMain, 'TOPLEFT', 10, -105)
	MasterLootManagerMain_ScrollFrame:SetPoint('TOPRIGHT', MasterLootManagerMain, 'TOPRIGHT', -26, -105)
	MasterLootLoggerFrameContentColumnHeader1:ClearAllPoints()
	MasterLootLoggerFrameContentColumnHeader1:SetPoint('LEFT', MasterLootLoggerButton1, 'TOPLEFT', 0, 20)
	MasterLootLoggerFrameContentColumnHeader2:SetPoint('LEFT', MasterLootLoggerFrameContentColumnHeader1, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentColumnHeader3:SetPoint('LEFT', MasterLootLoggerFrameContentColumnHeader2, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentColumnHeader4:SetPoint('LEFT', MasterLootLoggerFrameContentColumnHeader3, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentColumnHeader5:SetPoint('LEFT', MasterLootLoggerFrameContentColumnHeader4, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentColumnHeader6:SetPoint('LEFT', MasterLootLoggerFrameContentColumnHeader5, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentClearButton:SetPoint('LEFT', MasterLootLoggerFrameContentExportButton, 'RIGHT', 5, 0)
	MasterLootLoggerFrameContentAddButton:SetPoint('RIGHT', MasterLootLoggerFrameContentEditButton, 'LEFT', -5, 0)
	MasterLootLoggerFrameContentEditButton:SetPoint('RIGHT', MasterLootLoggerFrameContentDeleteButton, 'LEFT', -5, 0)
	MasterLootLoggerAddEditFrameMonth:SetPoint('TOPLEFT', MasterLootLoggerAddEditFrameDateLabel, 'BOTTOMLEFT', 0, 0)
	MasterLootLoggerAddEditFrameDay:SetPoint('LEFT', MasterLootLoggerAddEditFrameMonth, 'RIGHT', 2, 0)
	MasterLootLoggerAddEditFrameYear:SetPoint('LEFT', MasterLootLoggerAddEditFrameDay, 'RIGHT', 2, 0)
	MasterLootLoggerAddEditFrameHour:SetPoint('TOPLEFT', MasterLootLoggerAddEditFrameTimeLabel, 'BOTTOMLEFT', 0, 0)
	MasterLootLoggerAddEditFrameMinute:SetPoint('LEFT', MasterLootLoggerAddEditFrameHour, 'RIGHT', 0, 0)
	MasterLootLoggerAddEditFrameMonth:SetJustifyH('CENTER')
	MasterLootLoggerAddEditFrameMonth:SetWidth(25)
	MasterLootLoggerAddEditFrameDay:SetJustifyH('CENTER')
	MasterLootLoggerAddEditFrameDay:SetWidth(25)
	MasterLootLoggerAddEditFrameYear:SetJustifyH('CENTER')
	MasterLootLoggerAddEditFrameYear:SetWidth(45)
	MasterLootLoggerAddEditFrameHour:SetJustifyH('CENTER')
	MasterLootLoggerAddEditFrameHour:SetWidth(25)
	MasterLootLoggerAddEditFrameMinute:SetJustifyH('CENTER')
	MasterLootLoggerAddEditFrameMinute:SetWidth(25)
	AS:SkinDropDownBox(MasterLootManagerMain_SelectDE, 150)
	AS:SkinDropDownBox(MasterLootManagerMain_SelectBank, 150)
	AS:SkinDropDownBox(MasterLootLoggerAddEditFrameType, 150)
	AS:SkinScrollBar(MasterLootManagerMain_ScrollFrame_Slider, 5)
	AS:SkinScrollBar(MasterLootLoggerFrameContentScrollFrameScrollBar)
	AS:SkinCloseButton(MasterLootLoggerFrameCloseButton)
	AS:SkinCloseButton(MasterLootLoggerAddEditFrameCloseButton)
end

AS:RegisterSkin('MasterLootManagerRemix', AS.MasterLootManagerRemix)