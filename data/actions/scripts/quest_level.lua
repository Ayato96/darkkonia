local chests =
{
	[1001] = {prize = xxxx},
	[1002] = {prize = xxxx},
	[1003] = {prize = xxxx},
	[1004] = {prize = xxxx}
}

local status = 12345 -- Storage for quest
local questLevel = 100 -- Level to open chest

function onUse(cid, item, fromPosition, itemEx, toPosition)
local name = getItemNameById(chests[item.uid].prize)
local questStatus = getPlayerStorageValue(cid, status)
local playerPos = getCreaturePosition(cid)
if questStatus == 1 then
		doPlayerSendTextMessage(cid, "You have already chosen your reward.")
	return true
end

if getPlayerLevel(cid) >= questLevel then
		doPlayerAddItem(cid, chests[item.uid].prize, 1)
		setPlayerStorageValue(cid, status, 1)
		doSendMagicEffect(playerPos, CONST_ME_GIFT_WRAPS)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have chosen a ".. name .." as your reward.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must be atleast level ".. questLevel .." to open this chest.")
	end
	return true
end