local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local hooksecurefunc = hooksecurefunc

function R:Blizzard_Channels()
	if not AS:IsSkinEnabled('Blizzard_Channels', 'channels') then return end

	local ChannelFrame = _G.ChannelFrame
	local CreateChannelPopup = _G.CreateChannelPopup

	S:HandlePortraitFrame(ChannelFrame)
	S:HandleFrame(CreateChannelPopup)

	S:HandleButton(ChannelFrame.SettingsButton) -- using -4, 4
	S:HandleButton(ChannelFrame.NewButton)
	ChannelFrame.NewButton:ClearAllPoints()
	S:Point(ChannelFrame.NewButton, 'BOTTOMLEFT', ChannelFrame, 4, 4) -- make it match settings button

	S:HandleTrimScrollBar(ChannelFrame.ChannelRoster.ScrollBar)

	S:HandleScrollBar(ChannelFrame.ChannelList.ScrollBar)
	S:Point(ChannelFrame.ChannelList.ScrollBar, 'BOTTOMLEFT', ChannelFrame.ChannelList, 'BOTTOMRIGHT', 0, 15)

	S:HandleCloseButton(CreateChannelPopup.CloseButton)
	S:HandleButton(CreateChannelPopup.OKButton)
	S:HandleButton(CreateChannelPopup.CancelButton)

	S:HandleEditBox(CreateChannelPopup.Name)
	S:HandleEditBox(CreateChannelPopup.Password)

	S:HandleFrame(_G.VoiceChatPromptActivateChannel)
	S:HandleButton(_G.VoiceChatPromptActivateChannel.AcceptButton)
	S:HandleCloseButton(_G.VoiceChatPromptActivateChannel.CloseButton)

	-- Hide the Channel Header Textures
	hooksecurefunc(_G.ChannelButtonHeaderMixin, 'Update', function(s)
		S:SetTemplate(s)
		s.NormalTexture:SetTexture()
	end)
end

AS:RegisterSkin('Blizzard_Channels', nil, 'ADDON_LOADED')
