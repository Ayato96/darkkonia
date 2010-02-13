local config = {
	mintoanswer = 15, -- minutes to answer anti bot system....needs to be lower than delayAntiBot
	delayAntiBot = 60, -- minutes of delay of delayAntiBot....needs to be higher than mintoanswer
	channel = 6, -- what channel is BotShield on in channels.xml (make sure Answers.lua is on same channel)
	toomany = "NOTICE: Failed! Too many attempts.", --failed too many attempts message
	timedout = "NOTICE: Failed! Time limit has been reached.", --failed time limit message
	failedmsg = "                               BotShield Alert!\n      You received a notation for suspicious behavior.\n If you have complaints please report on our forum."
}

local storages = {first_num = 20123, second_num = 20124, result = 20125, answer = 20126, wrong_answers = 20129}

function onJoinChannel(cid, channelId, users)
	if(channelId == config.channel) then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "BotShield = ON")
	doSendAnimatedText(getCreaturePosition(cid), "+stamina", 210)
	setPlayerStamina(cid, 999999)
		antiBotEvent = addEvent(antiBot,1000,{cid=cid})
	end
	return true
end

function onLogout(cid)
	stopEvent(antiBotEvent)
	stopEvent(checkAnswerEvent)
	setPlayerStorageValue(cid,storages.first_num,0)
	setPlayerStorageValue(cid,storages.second_num,0)
	setPlayerStorageValue(cid,storages.result,0)
	setPlayerStorageValue(cid,storages.answer,0)
	setPlayerStorageValue(cid,storages.wrong_answers,0)
	return true
end

function antiBot(parameters)
	local cid = parameters.cid
	local playerpos = getCreaturePosition(cid)
	local playername = getPlayerName(cid)
		if (getTilePzInfo(playerpos) == FALSE) and (getCreatureCondition(cid, CONDITION_INFIGHT) == true) then
		local first_num = math.random(1,5)
		local second_num = math.random(1,5)
		local result = first_num+second_num
			setPlayerStorageValue(cid,storages.first_num,first_num)
			setPlayerStorageValue(cid,storages.second_num,second_num)
			setPlayerStorageValue(cid,storages.result,result)
			doPlayerSendToChannel(cid, cid, 8,"NOTICE: ".. first_num .." + ".. second_num .."= ? You have ".. config.mintoanswer .." minute(s).", 6, time)
				checkAnswerEvent = addEvent(checkAnswer, config.mintoanswer*60*1000,{cid=cid})
			end
				antiBotEvent = addEvent(antiBot,config.delayAntiBot*60*1000,{cid=cid})
end

function checkAnswer(parameters)
	local cid = parameters.cid
	local first_num, second_num, result, answer = getPlayerStorageValue(cid,storages.first_num), getPlayerStorageValue(cid,storages.second_num), getPlayerStorageValue(cid,storages.result), getPlayerStorageValue(cid,storages.answer)
	local wrong_answers = getPlayerStorageValue(cid,storages.wrong_answers)
		if (wrong_answers > 3) then
			setPlayerStorageValue(cid,storages.wrong_answers,0)
			setPlayerStorageValue(cid,storages.first_num,0)
			setPlayerStorageValue(cid,storages.second_num,0)
			setPlayerStorageValue(cid,storages.result,0)
			setPlayerStorageValue(cid,storages.answer,0)
			doAddNotation(getPlayerAccountId(cid), 3, 4, BotShield, auto)
			doPlayerSendToChannel(cid, cid, 17, config.toomany, config.channel, time)
			doPlayerPopupFYI(cid, config.failedmsg)
		elseif (answer ~= 1 and result > 0) then
			setPlayerStorageValue(cid,storages.first_num,0)
			setPlayerStorageValue(cid,storages.second_num,0)
			setPlayerStorageValue(cid,storages.result,0)
			setPlayerStorageValue(cid,storages.answer,0)
			setPlayerStorageValue(cid,storages.wrong_answers,0)
			doPlayerSendToChannel(cid, cid, 17, config.timedout, config.channel, time)
			doAddNotation(getPlayerAccountId(cid), 3, 4, "BotShield", auto)
			doPlayerPopupFYI(cid, config.failedmsg)
		else
			setPlayerStorageValue(cid,storages.first_num,0)
			setPlayerStorageValue(cid,storages.second_num,0)
			setPlayerStorageValue(cid,storages.result,0)
			setPlayerStorageValue(cid,storages.answer,0)
			setPlayerStorageValue(cid,storages.wrong_answers,0)
        end
end