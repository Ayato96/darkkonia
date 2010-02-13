--[[
	Train System
	by Shawak
	Version 1.0
]]--

local interval = 700
local noLogoutCondition = createConditionObject(CONDITION_INFIGHT, 24*60*60*1000)

local Rails = {
		[7121]= {
				[0]={new={0, -1, 0}, t=7132, d=0},
				[2]={new={0,  1, 0}, t=7132, d=2}
				},
		[7122]= {
				[1]={new={ 1, 0, 0}, t=7131, d=1},
				[3]={new={-1, 0, 0}, t=7131, d=3}
				},
		[7123]={
				[3]={new={0,  1, 0}, t=7132, d=2},
				[0]={new={ 1, 0, 0}, t=7131, d=1}
				},
		[7124]={
				[0]={new={-1, 0, 0}, t=7131, d=3},
				[1]={new={0,  1, 0}, t=7132, d=2}
				},
		[7125]={
				[2]={new={ 1, 0, 0}, t=7131, d=1},
				[3]={new={0, -1, 0}, t=7132, d=0}
				},
		[7126]={
				[1]={new={0, -1, 0}, t=7132, d=0},
				[2]={new={-1, 0, 0}, t=7131, d=3}
				},
		[7127]={
				[2]={new={0,  1, 0}, t=7132, d=2},
				[1]={new={0, -1, 0}, t=7132, d=0},
				[0]={new={0,  1, 0}, t=7132, d=0}
				},
		[7128]={
				[1]={new={ 1, 0, 0}, t=7131, d=1},
				[0]={new={-1, 0, 0}, t=7131, d=3},
				[3]={new={-1, 0, 0}, t=7131, d=3}
				},
		[7129]={
				[2]={new={-1, 0, 0}, t=7131, d=3},
				[3]={new={-1, 0, 0}, t=7131, d=3},
				[1]={new={ 1, 0, 0}, t=7131, d=1}
				},
		[7130]={
				[2]={new={0,  1, 0}, t=7132, d=2},
				[3]={new={-1, 0, 0}, t=7132, d=0},
				[0]={new={0, -1, 0}, t=7132, d=0}
				}
}

function getRailStackpos(frompos)
i = 1
nowRail = 0
	while TRUE do
				if i >= 6 then
					break
				end
				frompos.stackpos = i
				railItem = getThingfromPos(frompos)
				if railItem.uid ~= false then
				if isCreature(railItem.uid) == false then
				if Rails[railItem.itemid] ~= false then
					nowRail = railItem.itemid
					break
				elseif isInArray(stops, railItem.itemid) == true then
					nowRail = railItem.itemid
					break
				end
			end
		end
		i = i+1
	end
	if nowRail ~= nil then
				if nowRail > 100 then
					return frompos
					end
		else
		return false
	end
end

function stopRailing(p)
	doRemoveCondition(p.cid, CONDITION_INFIGHT)
	doCreatureSetNoMove(p.cid, 0)
	return true
end

function move(p)
cid = p.cid
dir = p.dir
p_Pos = getPlayerPosition(cid)
nowRail = getThingfromPos(getRailStackpos(p_Pos))
	if nowRail.actionid == 105 then
			sec = 1
			doSetItemOutfit(cid, Rails[nowRail.itemid][dir].t, (sec*1000)-400)
		return addEvent(stopRailing, sec*1000, {cid = cid})
	end
	if Rails[nowRail.itemid] ~= false then
		nextPos = {
			x=p_Pos.x+Rails[nowRail.itemid][dir].new[1],
			y=p_Pos.y+Rails[nowRail.itemid][dir].new[2],
			z=p_Pos.z+Rails[nowRail.itemid][dir].new[3],
			stackpos = 255
		}
			doSetItemOutfit(cid, Rails[nowRail.itemid][dir].t, interval)
			doTeleportThing(cid, nextPos, TRUE)
		addEvent(move, 0, {cid = cid, dir = Rails[nowRail.itemid][dir].d})
	end
return true
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if isPlayer(cid) == true then
	nowRail = getThingfromPos(getRailStackpos(getPlayerPosition(cid)))
	if nowRail.actionid == 0 or nowRail.actionid > 104 then
		return print("The rail doesn't have an right actionid.")
	end
		doAddCondition(cid, noLogoutCondition)
		doCreatureSetNoMove(cid, 1)
		addEvent(move, 0, {cid = cid, dir = nowRail.actionid-101})
	end
return true
end