local config = {
		channel = 6, -- what channel is BotShield on in channels.xml (make sure BotShield.lua is on same channel)
		accepted = "Accepted.", --what channel says when player passes test
		toomany = "Correct, too many attempts though, you may relog to prevent punishment if you aren't AFK." --message if correct after too many tries
}

function onSay(cid, words, param, channel)
local storages = {first_num = 20123, second_num = 20124, result = 20125, answer = 20126, wrong_answers = 20129}
local first_num, second_num, result, answer = getPlayerStorageValue(cid,storages.first_num), getPlayerStorageValue(cid,storages.second_num), getPlayerStorageValue(cid,storages.result), getPlayerStorageValue(cid,storages.answer)

		if (answer ~= 1 and result > 0) then
			doPlayerSendToChannel(cid, cid, 7, words, config.channel, time)
				if (words == result) then
						if (getPlayerStorageValue(cid,storages.wrong_answers) <= 3) then
							doPlayerSendToChannel(cid, cid, 15, config.accepted, config.channel, time)
							setPlayerStorageValue(cid,storages.wrong_answers,0)
							setPlayerStorageValue(cid,storages.answer,1)
							setPlayerStorageValue(cid,storages.first_num,0)
							setPlayerStorageValue(cid,storages.second_num,0)
							setPlayerStorageValue(cid,storages.result,0)
						else
							doPlayerSendToChannel(cid, cid, 8, config.toomany, config.channel, time)
						end
						else
							wrong_answers_now = getPlayerStorageValue(cid,storages.wrong_answers)
							setPlayerStorageValue(cid,storages.wrong_answers,wrong_answers_now+1)
							doPlayerSendToChannel(cid, cid, 8, "Incorrect. ".. getPlayerStorageValue(cid,storages.wrong_answers).."/3 failed attempts.", config.channel, time)
				end
		end
end