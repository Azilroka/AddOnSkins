local AS = unpack(AddOnSkins)

if not (AS:CheckAddOn('CLCProt') and AS.MyClass == 'PALADIN') then return end

function AS:CLCProt()
	local function UpdateButtonLayout(frame, button, opt)
		button:SetSize(opt.size, opt.size)
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
			AS:StyleButton(button)
		else
			button = CreateFrame('Button', name , parent)
		end
		AS:SkinButton(button)

		button:EnableMouse(false)
		button:SetSize(size, size)
		button.texture = button:CreateTexture('$parentIcon', 'OVERLAY')
		button.texture:SetInside()
		button.texture:SetTexture(BGTEX)
		AS:SkinTexture(button.texture)
		button.texture.SetTexCoord = AS.Noop
		button.texture.OldSetTexture = button.texture.SetTexture
		button.texture.SetTexture = function(frame, tex, ...)
			button.texture.OldSetTexture(frame, tex, ...)
		end

		button.border = button:CreateTexture(nil, 'BORDER')
		button.border:Kill()
		button.cooldown = CreateFrame('Cooldown', '$parentCooldown', button, "CooldownFrameTemplate")
		button.cooldown:SetInside()
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

AS:RegisterSkin('CLCProt', AS.CLCProt)