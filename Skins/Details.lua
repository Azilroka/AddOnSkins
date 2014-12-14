local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Details') then return end

function AS:Details()
	local L = LibStub('AceLocale-3.0'):GetLocale('Details')
	local Details = _G._detalhes

	function Details:AutoEraseConfirm()
		AS:AcceptFrame(L["STRING_OPTIONS_CONFIRM_ERASE"], function(self) Details.tabela_historico:resetar(); self:GetParent():Hide() end)
	end
end

AS:RegisterSkin('Details', AS.Details)