local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('CLCProt') and AS.MyClass == 'PALADIN') then return end

local name = 'CLCProtSkin'
function AS:SkinCLCProt()
	local function UpdateButtonLayout(frame, button, opt)
		button:Size(opt.size)
		button:ClearAllPoints()
		button:SetPoint(opt.point, clcprotFrame, opt.pointParent, opt.x, opt.y)
		button:SetAlpha(opt.alpha)
		button.stack:ClearAllPoints()
		button.stack:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 4, 0)	
	end

	local function CreateButton(frame, name, size, point, parent, pointParent, offsetx, offsety, bfGroup, isChecked)
		local db = frame.db.profile
		clcprotFrame:SetScale(1)
		clcprotFrame.SetScale = AS.Noop

		name = 'clcprot' .. name
		local button
		if isChecked then
			button = CreateFrame('CheckButton', name , parent)
			button:CreateBackdrop('Default')
			button:StyleButton(true)
		else
			button = CreateFrame('Button', name , parent)
			button:CreateBackdrop('Default')
		end
		local Backdrop = button.backdrop or button.Backdrop
		Backdrop:SetAllPoints()
		button:EnableMouse(false)
		button:Size(size)
		button.texture = button:CreateTexture('$parentIcon', 'OVERLAY')
		button.texture:SetInside()
		button.texture:SetTexture(BGTEX)
		AS:SkinTexture(button.texture)
		button.texture.SetTexCoord = AS.Noop
		button.texture.OldSetTexture = button.texture.SetTexture
		button.texture.SetTexture = function(frame, tex, ...)
			button.texture.OldSetTexture(frame, tex, ...)
			if tex ~= nil then
				button.backdrop:Show();
			else
				button.backdrop:Hide()
			end
		end

		button.border = button:CreateTexture(nil, 'BORDER')
		button.border:Kill()
		button.cooldown = CreateFrame('Cooldown', '$parentCooldown', button)
		button.cooldown:SetInside()
		if IsAddOnLoaded('ElvUI') then ElvUI[1]:RegisterCooldown(button.cooldown) end
		button.stack = button:CreateFontString('$parentCount', 'OVERLAY', 'TextStatusBarText')
		local fontFace, _, fontFlags = button.stack:GetFont()
		button.stack:SetFont(fontFace, 30, fontFlags)
		button.stack:SetJustifyH('RIGHT')
		button.stack:ClearAllPoints()
		button.stack:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 4, 0)
		button.defaultSize = button:GetWidth()
		button.SetScale = AS.Noop
		button:ClearAllPoints()
		button:SetPoint(point, parent, pointParent, offsetx, offsety)

		if frame.LBF then
			frame.LBF:Group('clcprot', bfGroup):AddButton(button)
		end
		button:Hide()
		return button
	end

	local clcprot = LibStub('AceAddon-3.0'):GetAddon('clcprot')
	clcprot.CreateButton = CreateButton
	clcprot.UpdateButtonLayout = UpdateButtonLayout
end

AS:RegisterSkin(name, AS.SkinCLCProt)