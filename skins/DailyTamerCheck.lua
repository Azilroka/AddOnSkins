local E, L, V, P, G, _ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")

local name = 'DailyTamerCheckSkin'
local _tamerquestcheck
function AS:SkinDailyTamerCheck(event)
	-- Stupid hacks we need because of stupid addons :p
	if not _tamerquestcheck then
		_tamerquestcheck = SlashCmdList["DAILYTAMERCHECK"]
		SlashCmdList["DAILYTAMERCHECK"] = function()
			_tamerquestcheck()
			AS:SkinFrame(DailyTamerCheck_mainframe)
		end
		local DTC = ldb:GetDataObjectByName("DailyTamerCheck")
		DTC.OnClick = function(self,button)
			_tamerquestcheck()
			AS:SkinFrame(DailyTamerCheck_mainframe)
		end
	end
end

AS:RegisterSkin(name, AS.SkinDailyTamerCheck)