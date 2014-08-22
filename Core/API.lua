local AS = unpack(AddOnSkins)

function AS:InitAPI()
	-- [[ API FUNCTIONS ]] --

	local function FontString(parent, name, fontName, fontHeight, fontStyle)
		local fs = parent:CreateFontString(nil, "OVERLAY")
		fs:SetFont(fontName, fontHeight, fontStyle)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(AS.Mult, -AS.Mult)

		if not name then
			parent.Text = fs
		else
			parent[name] = fs
		end

		return fs
	end

	local function AddAPI(object)
		local mt = getmetatable(object).__index

		if not object.FontString then mt.FontString = FontString end
	end

	local Handled = {["Frame"] = true}

	local Object = CreateFrame("Frame")
	AddAPI(Object)
	AddAPI(Object:CreateTexture())
	AddAPI(Object:CreateFontString())

	Object = EnumerateFrames()

	while Object do
		if (not Handled[Object:GetObjectType()]) then
			AddAPI(Object)
			Handled[Object:GetObjectType()] = true
		end

		Object = EnumerateFrames(Object)
	end
end