local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end


-- Don"t forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({"isle of the kings"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Isle of The Kings " .. (getConfigInfo("freeTravel") and "free?" or "30 gps?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=32189, y=31958, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go {Isle of The Kings}."})
keywordHandler:addKeyword({"go"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go {Isle of The Kings}."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})

npcHandler:addModule(FocusModule:new())