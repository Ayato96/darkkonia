function onLogin(cid)
if getPlayerStorageValue(cid, 40045) == -1 then
	if getPlayerVocation(cid) == 0 then
		doPlayerAddItem(cid, 2512, 1)--Wooden Shield
		doPlayerAddItem(cid, 2461, 1)--Leather Helmet
		doPlayerAddItem(cid, 2467, 1)--Leather Armor
		doPlayerAddItem(cid, 2649, 1)--Leather Legs
		doPlayerAddItem(cid, 2643, 1)--Leather Boots
		local container = doPlayerAddItem(cid, 2000, 1)
		doAddContainerItem(container, 2671, 3)--Ham
		doAddContainerItem(container, 2120, 1)--Rope
		doAddContainerItem(container, 2382, 1)--Club
		doAddContainerItem(container, 2376, 1)--Sword
		doAddContainerItem(container, 2386, 1)--Axe
		doPlayerSendTextMessage(cid,22,""..getPlayerName(cid).." ahora tienes los primeros items de "..getPlayerVocationName(cid)..".")
	end
	if getPlayerVocation(cid) == 1 then
		doPlayerAddItem(cid, 2518, 1)--Beholder Shield
		doPlayerAddItem(cid, 8820, 1)--Mage hat
		doPlayerAddItem(cid, 8819, 1)--Magician's robe
		doPlayerAddItem(cid, 2478, 1)--Brass Legs
		doPlayerAddItem(cid, 2643, 1)--Leather Boots
		local container = doPlayerAddItem(cid, 2000, 1)
		doAddContainerItem(container, 2190, 1)--Wand Of Vortex
		doAddContainerItem(container, 2175, 1)--Spell Book
		doAddContainerItem(container, 2671, 3)--Ham
		doAddContainerItem(container, 2120, 1)--Rope
		doAddContainerItem(container, 2160, 1)--Crystal Coin
		doPlayerSendTextMessage(cid,22,""..getPlayerName(cid).." ahora tienes los primeros items de "..getPlayerVocationName(cid)..".")
	end
	if getPlayerVocation(cid) == 2 then
		doPlayerAddItem(cid, 2518, 1)--Beholder Shield
		doPlayerAddItem(cid, 8820, 1)--Mage hat
		doPlayerAddItem(cid, 8819, 1)--Magician's robe
		doPlayerAddItem(cid, 2478, 1)--Brass Legs
		doPlayerAddItem(cid, 2643, 1)--Leather Boots
		local container = doPlayerAddItem(cid, 2000, 1)
		doAddContainerItem(container, 2182, 1)--Snakekbite Rod
		doAddContainerItem(container, 2175, 1)--Spell Book
		doAddContainerItem(container, 2671, 3)--Ham
		doAddContainerItem(container, 2120, 1)--Rope
		doAddContainerItem(container, 2160, 1)--Crystal Coin
		doPlayerSendTextMessage(cid,22,""..getPlayerName(cid).." ahora tienes los primeros items de "..getPlayerVocationName(cid)..".")
	end
	if getPlayerVocation(cid) == 3 then
		doPlayerAddItem(cid, 2518, 1)--Beholder Shield
		doPlayerAddItem(cid, 2457, 1)--Steel Helmet
		doPlayerAddItem(cid, 2465, 1)--Brass Armor
		doPlayerAddItem(cid, 2478, 1)--Brass Legs
		doPlayerAddItem(cid, 2643, 1)--Leather Boots
		local container = doPlayerAddItem(cid, 2000, 1)
		doAddContainerItem(container, 8602, 1)--Jagged Sword
		doAddContainerItem(container, 2389, 2)--Spear
		doAddContainerItem(container, 2456, 1)--Bow
		doAddContainerItem(container, 2671, 3)--Ham
		doAddContainerItem(container, 2120, 1)--Rope
		doAddContainerItem(container, 2160, 1)--Crystal Coin
		doPlayerSendTextMessage(cid,22,""..getPlayerName(cid).." ahora tienes los primeros items de "..getPlayerVocationName(cid)..".")
	end
	if getPlayerVocation(cid) == 4 then
		doPlayerAddItem(cid, 2518, 1)--Beholder Shield
		doPlayerAddItem(cid, 2457, 1)--Steel Helmet
		doPlayerAddItem(cid, 2465, 1)--Brass Armor
		doPlayerAddItem(cid, 2478, 1)--Brass Legs
		doPlayerAddItem(cid, 2643, 1)--Leather Boots
		local container = doPlayerAddItem(cid, 2000, 1)
		doAddContainerItem(container, 8602, 1)--Jagged Sword
		doAddContainerItem(container, 2439, 1)--Daramanian mace
		doAddContainerItem(container, 8601, 1)--Steel Axe
		doAddContainerItem(container, 2671, 3)--Ham
		doAddContainerItem(container, 2120, 1)--Rope
		doAddContainerItem(container, 2160, 1)--Crystal Coin
		doPlayerSendTextMessage(cid,22,""..getPlayerName(cid).." ahora tienes los primeros items de "..getPlayerVocationName(cid)..".")
	end
		setPlayerStorageValue(cid, 40045, 1)
	end
return true
end