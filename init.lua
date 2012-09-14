-- init for Tukui_ElvUI_Skins

if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
local addon,Engine = ...

local AddOn = {};

Engine[1] = AddOn
UISkins = Engine

local s
if ElvUI then
	local E, L, V, P, G, DF = unpack(ElvUI)
	local S = E:GetModule('Skins')
	AddOn.s = S
	AddOn.c = E
	AddOn.ccolor = E.myclass
	s = S
else
	local T, C, L = unpack(Tukui)
	AddOn.s = T
	AddOn.c = C
	AddOn.ccolor = T.myclass
	s = T
end