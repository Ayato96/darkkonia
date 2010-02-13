function onStepIn(cid, item, pos)
local blockingTreePosition = {x=xxxx, y=xxxx, z=xxxx, stackpos=2}
local getBlockingTree = getThingfromPos(blockingTreePosition)
	if(isPlayer(cid) == TRUE) then
		doRemoveItem(getBlockingTree.uid)
	end
return true
end 