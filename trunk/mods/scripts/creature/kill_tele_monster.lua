local tele_pos = {x=xxx, y=xxx, z=xxx} -- Position of Teleport
local new_pos = {x=xxx, y=xxx, z=xxx} -- Position of new spot
local timeToPass = 60 -- Seconds to close teleport

function onKill(cid, target)
local creatureName = getCreatureName(target)

	if creatureName == "Morgorath" then
		doCreateTeleport(1387, tele_pos, new_pos)
		doSendMagicEffect(tele_pos, CONST_ME_TELEPORT)
		doCreatureSay(cid, "You have ".. timeToPass .." seconds to enter the teleport before it is closed.", TALKTYPE_ORANGE_1)
		addEvent(removeTeleport, timeToPass * 1000)
	end
end

function removeTeleport()
local teleport = getTileItemById(tele_pos, 1387)

	if teleport.uid > 0 then
		doRemoveItem(teleport.uid)
		doSendMagicEffect(tele_pos, CONST_ME_POFF)
	end
end