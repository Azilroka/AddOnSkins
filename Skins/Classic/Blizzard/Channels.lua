if AddOnSkins.Retail then return end
local AS = unpack(AddOnSkins)

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
local ChannelButtonHeaderMixin = ChannelButtonHeaderMixin
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function AS:Blizzard_Channels(event, addon)
	if addon ~= 'Blizzard_Channels' then return end

	AS:SkinBackdropFrame(_G.ChannelFrame)
	_G.ChannelFrame.Backdrop:SetPoint('TOPLEFT', -1, -1)
	_G.ChannelFrame.Backdrop:SetPoint('BOTTOMRIGHT', -1, 2)

	AS:SkinBackdropFrame(_G.CreateChannelPopup)

	AS:SkinButton(_G.ChannelFrame.NewButton)
	AS:SkinButton(_G.ChannelFrame.SettingsButton)

	_G.ChannelFrame.ChannelRoster.ScrollFrame.scrollBar.ScrollDownButton = _G.ChannelFrame.ChannelRoster.ScrollFrame.scrollDown
	_G.ChannelFrame.ChannelRoster.ScrollFrame.scrollBar.ScrollUpButton = _G.ChannelFrame.ChannelRoster.ScrollFrame.scrollUp

	AS:SkinScrollBar(_G.ChannelFrame.ChannelRoster.ScrollFrame.scrollBar)
	_G.ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:SetPoint('TOPLEFT', _G.ChannelFrame.ChannelRoster.ScrollFrame, 'TOPRIGHT', 1, -13)
	_G.ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:SetPoint('BOTTOMLEFT', _G.ChannelFrame.ChannelRoster.ScrollFrame, 'BOTTOMRIGHT', 1, 13)

	AS:SkinBackdropFrame(_G.ChannelFrame.ChannelRoster.ScrollFrame)
	_G.ChannelFrame.ChannelRoster.ScrollFrame:SetPoint('TOPLEFT', 3, 1)
	_G.ChannelFrame.ChannelRoster.ScrollFrame:SetPoint('BOTTOMRIGHT', -3, 5)

	AS:SkinScrollBar(_G.ChannelFrame.ChannelList.ScrollBar)
	_G.ChannelFrame.ChannelList.ScrollBar:SetPoint('BOTTOMLEFT', _G.ChannelFrame.ChannelList, 'BOTTOMRIGHT', 0, 15)

	AS:SkinBackdropFrame(_G.ChannelFrame.ChannelList)

	_G.ChannelFrame.ChannelList.Backdrop:SetPoint('TOPLEFT', -3, 4)
	_G.ChannelFrame.ChannelList.Backdrop:SetPoint('BOTTOMRIGHT', 0, -1)
	_G.ChannelFrame.ChannelList:SetPoint('TOPLEFT', _G.ChannelFrame, 'TOPLEFT', 4, -66)
	_G.ChannelFrame.ChannelList:SetPoint('BOTTOMLEFT', _G.ChannelFrame, 'BOTTOMLEFT', 4, 33)

	AS:SkinCloseButton(_G.CreateChannelPopup.CloseButton)
	AS:SkinButton(_G.CreateChannelPopup.OKButton)
	AS:SkinButton(_G.CreateChannelPopup.CancelButton)

	AS:SkinEditBox(_G.CreateChannelPopup.Name)
	AS:SkinEditBox(_G.CreateChannelPopup.Password)

	AS:SkinBackdropFrame(_G.VoiceChatPromptActivateChannel)
	AS:SkinButton(_G.VoiceChatPromptActivateChannel.AcceptButton)
	AS:SkinCloseButton(_G.VoiceChatPromptActivateChannel.CloseButton)

	-- Hide the Channel Header Textures
	hooksecurefunc(ChannelButtonHeaderMixin, "Update", function(self)
		AS:SkinButton(self)
		self.NormalTexture:SetTexture("")
		self.HighlightTexture:SetTexture("")
	end)

	AS:UnregisterSkinEvent(addon, event)
end

AS:RegisterSkin("Blizzard_Channels", AS.Blizzard_Channels, 'ADDON_LOADED')
