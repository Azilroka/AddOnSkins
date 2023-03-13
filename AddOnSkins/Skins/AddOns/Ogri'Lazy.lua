local AS, L, S, R = unpack(AddOnSkins)

function R:OgriLazy()
	S:HandleFrame(Relic_View)
	S:HandleCloseButton(Relic_View.close)
	for i = 1, 4 do
		S:HandleIcon(Relic_View.set[i].tex)
	end
	for i = 1, 10 do
		S:HandleIcon(Relic_View.replay[i].tex)
	end
end

AS:RegisterSkin("Ogri'Lazy", R.OgriLazy)
