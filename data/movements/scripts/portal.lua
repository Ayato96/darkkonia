function onStepIn(cid, item, position, fromPosition)
	if item.actionid > 100 then
		doSetItemSpecialDescription(item.uid, 'The portal may enter '..(item.actionid-101)..' people left.')
		doSetItemActionId(item.uid, item.actionid-1)
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	if item.actionid == 100 then
		doSendMagicEffect(position, 2)
		doRemoveItem(item.uid, 1)
	end
	return true
end