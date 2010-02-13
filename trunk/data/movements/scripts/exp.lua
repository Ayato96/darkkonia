-- Credits: Slawkens & Barker
local config = {
	rate = 2.0, -- 2.0 = 2x faster than normal
}

function onDeEquip(cid, item, slot) 
if(item.itemid == 6301) then 
	doPlayerSetExperienceRate(cid, 1.0) 
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your extra experience rate has ended.") 
		doTransformItem(item.uid, 6300) 
	end 
end

function onEquip(cid, item, slot) 
if(item.itemid == 6300) then 
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your extra experience rate has been activated! It is now: " .. config.rate .. "x doubled your former experience rate.") 
		doPlayerSetExperienceRate(cid, config.rate) 
		doTransformItem(item.uid, 6301)
	return true
end 
end