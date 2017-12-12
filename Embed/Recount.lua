local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Recount') then return end

local _G = _G

function AS:Embed_Recount()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = strlower(AS:CheckOption('EmbedRight')) == 'recount' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	_G.Recount_MainWindow:SetParent(EmbedParent)
	_G.Recount_MainWindow:ClearAllPoints()
	_G.Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
	_G.Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	_G.Recount_MainWindow:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))

	if AS:CheckOption('Recount') then
		if _G.Recount_MainWindow.Backdrop then
			_G.Recount_MainWindow.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
			if AS:CheckOption('RecountBackdrop') then
				_G.Recount_MainWindow.Backdrop:Show()
			else
				_G.Recount_MainWindow.Backdrop:Hide()
			end
		end
	end

	Recount.db.profile.Locked = true
	Recount.db.profile.Scaling = 1
	Recount.db.profile.ClampToScreen = true
	Recount.db.profile.FrameStrata = AS:CheckOption('EmbedFrameStrata')

	_G.Recount:SetStrataAndClamp()
	_G.Recount:LockWindows(true)
	_G.Recount:ResizeMainWindow()
end
