function onSay(cid, words, param)
	local param = param.explode(param, ',')
	if param then
	teleport = doCreateTeleport(1387, {x=param[1], y=param[2], z=param[3]}, getPlayerPosition(cid))
		doSetItemSpecialDescription(teleport, 'The portal may enter '..param[4]..' people left.')
		doSetItemActionId(teleport, 100+param[4])
	else
		doPlayerSendCancel(cid, "You must set param.")
	end
	return true
end