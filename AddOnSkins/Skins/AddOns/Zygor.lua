local AS, L, S, R = unpack(AddOnSkins)

function R:ZygorGuidesViewer()
	S:StripTextures(ZygorGuidesViewerFrame_Border, true)
	S:HandleFrame(ZygorGuidesViewerFrame, nil, nil, true)

	for i = 1, 6 do
		S:HandleFrame(_G['ZygorGuidesViewerFrame_Step'..i], true)
	end
end

AS:RegisterSkin('ZygorGuidesViewer')
