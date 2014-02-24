local A, C, L, G = unpack(ShestakUI)
local AddOnName, Engine = ...
local AddOn = LibStub('AceAddon-3.0'):NewAddon('AddOnSkins', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0')

Engine[1] = AddOn
AddOnSkins = Engine

AddOn.FrameLocks = {}
AddOn.Locale = L
AddOn.T = A
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetRealmName()
AddOn.Noop = function() return end
AddOn.Title = select(2, GetAddOnInfo(AddOnName))
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.Version = GetAddOnMetadata(AddOnName, 'Version')

local Frame = CreateFrame('Frame')
Frame:Hide()
Frame:SetTemplate()

AddOn.LSM = LibStub('LibSharedMedia-3.0')
AddOn.Blank = AddOn.LSM:Fetch('background', 'Solid')
AddOn.NormTex = AddOn.LSM:Fetch('statusbar', 'Tukui')
AddOn.Font = AddOn.LSM:Fetch('font', 'PT Sans Narrow Bold')
AddOn.PixelFont = AddOn.LSM:Fetch('font', 'Visitor TT2 BRK')
AddOn.ActionBarFont = AddOn.LSM:Fetch('font', 'Arial')
AddOn.UIScale = UIParent:GetScale()
AddOn.Mult = 768/strmatch(GetCVar('gxResolution'), '%d+x(%d+)')/AddOn.UIScale
AddOn.BackdropColor = { Frame:GetBackdropColor() }
AddOn.BorderColor = { Frame:GetBackdropBorderColor() }

AddOn.DataTextFontSize = 12--[[
AddOn.InfoLeft = G.Panels.DataTextLeft
AddOn.InfoRight = G.Panels.DataTextRight
AddOn.ChatBackgroundRight = G.Panels.RightChatBackground
AddOn.ChatBackgroundLeft = G.Panels.LeftChatBackground
AddOn.TabsRightBackground = G.Panels.RightChatTabsBackground
AddOn.TabsLeftBackground = G.Panels.LeftChatTabsBackground
AddOn.Minimap = G.Maps.Minimap
AddOn.ActionBar1 = G.ActionBars.Bar1
AddOn.ActionBar2 = G.ActionBars.Bar2
AddOn.ActionBar3 = G.ActionBars.Bar3
AddOn.ActionBar4 = G.ActionBars.Bar4
]]
function AddOn:Delay(delay, func, ...)
	A.Delay(delay, func, ...)
end