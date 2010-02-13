local config = {
	storage = 9432,
	version = 1, -- Increase this value after adding new marks, so player can step again and receive new map marks
	marks = {
		{mark = 5, pos = {x = 166, y = 439, z = 7}, desc = "Main City Temple"},
		{mark = 7, pos = {x = 300, y = 200, z = 7}, desc = "NPC with tools!"},
		{mark = 1, pos = {x = 666, y = 666, z = 6}}
	}
}

local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) ~= true or getPlayerStorageValue(cid, config.storage) == config.version) then
		return
	end

	for _, m  in pairs(config.marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
		setPlayerStorageValue(cid, config.storage, config.version)
	return true
end