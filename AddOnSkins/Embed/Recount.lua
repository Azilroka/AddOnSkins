local AS = unpack(AddOnSkins)
if not AS:CheckAddOn('Recount') then return end

-- Cache global variables
--Lua functions
local _G = _G
--WoW API / Variables
-- GLOBALS:

function AS:Embed_Recount()
	local EmbedParent = _G.EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and _G.EmbedSystem_RightWindow or _G.EmbedSystem_LeftWindow end

	_G.Recount_MainWindow:SetParent(EmbedParent)
	_G.Recount_MainWindow:ClearAllPoints()
	_G.Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
	_G.Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	_G.Recount_MainWindow:SetFrameLevel(AS:CheckOption('EmbedFrameLevel'))

	if AS:CheckOption('Recount') then
		if _G.Recount_MainWindow.Backdrop then
			AS:SetTemplate(_G.Recount_MainWindow.Backdrop, AS:CheckOption('EmbedBackdropTransparent') and 'Transparent')
			if AS:CheckOption('EmbedBackdrop') then
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
	Recount.db.profile.MainWindow.AutoHide = false

	_G.Recount:SetStrataAndClamp()
	_G.Recount:LockWindows(true)
	_G.Recount:ResizeMainWindow()
end
