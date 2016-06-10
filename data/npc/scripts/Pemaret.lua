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
local travelNode = keywordHandler:addKeyword({"edron"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to get to Edron for " .. (getConfigInfo("freeTravel") and "free?" or "20 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 20, destination = {x=33176, y=31764, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Maybe later."})

local travelNode = keywordHandler:addKeyword({"eremo"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, you know the good old sage Eremo. I can bring you to his little island. Do you want me to do that?"})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=33315, y=31882, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Maybe later."})

keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I\"m a fisherman and I take along people to Edron. You can also buy some fresh fish."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I\"m a fisherman and I take along people to Edron. You can also buy some fresh fish."})

npcHandler:addModule(FocusModule:new())