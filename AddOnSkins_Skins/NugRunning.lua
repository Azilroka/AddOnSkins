local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('NugRunning') then return end

local name = 'NugRunningSkin'
function AS:SkinNugRunning()
	local NugRunning = NugRunning
	local TimerBar = NugRunning.TimerBar
	local _ConstructTimerBar = NugRunning.ConstructTimerBar

	function NugRunning.ConstructTimerBar(w, h)
		local f = _ConstructTimerBar(w, h)

		f:SetBackdrop(nil)

		local ic = f.icon:GetParent()
		ic:CreateBackdrop("Default")

		f.bar:CreateBackdrop("Default")

		f.bar:SetStatusBarTexture(AS.NormTex)
		f.bar:GetStatusBarTexture():SetDrawLayer("ARTWORK")
		f.bar.bg:SetTexture(AS.NormTex)
		f.bar.bg:SetAlpha(0.3)

		f.timeText:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")
		f.spellText:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")
		f.stacktext:SetFont(AS.PixelFont, 8, "MONOCHROMEOUTLINE")

		TimerBar.Resize(f, w, h)

		return f
	end

	local _Resize = TimerBar.VScale
	function TimerBar.Resize(f, w, h)
		_Resize(f, w, h)

		local ic = f.icon:GetParent()
		ic:ClearAllPoints()
		ic:SetPoint("TOPLEFT", f, 1, -1)
		ic:SetPoint("BOTTOMLEFT", f, 1, 0)

		f.bar:ClearAllPoints()
		f.bar:SetPoint("TOPRIGHT", f, -1, -1)
		f.bar:SetPoint("BOTTOMRIGHT", f, -1, 0)
		f.bar:SetPoint("LEFT", ic, "RIGHT", 5, 0)

		f.timeText:SetJustifyH("RIGHT")
		f.timeText:ClearAllPoints()
		f.timeText:SetPoint("RIGHT", 1, 0)

		f.spellText:SetJustifyH("LEFT")
		f.spellText:ClearAllPoints()
		f.spellText:SetPoint("LEFT", 2, 0)
		f.spellText:SetWidth(f.bar:GetWidth() - 10)
	end
end

AS:RegisterSkin(name, AS.SkinNugRunning)