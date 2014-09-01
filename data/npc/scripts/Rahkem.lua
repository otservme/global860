  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a humble preacher of the true revelation in the temple of the mourned flesh. I heal and teach magic spells to those who are spiritual enough."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mourned Rahkem."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is a tool in the hands of the false gods, but it also serves to free us from our mortal prisons."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here we mourn our mortal existence. Our flesh is our weakness and our curse, the bait for all the trials and tribulations the false gods let loose on the world."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our immortal ruler, may he be blessed, is the keeper of our enlightenment and our saviour."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The eternal burrowers are the keepers of all the secrets their kind has unearthed in countless aeons."})
keywordHandler:addKeyword({'ashmunrah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The foolish old pharaoh withheld knowledge and power from his son, knowing that he would surpass him in every aspect. But in his infinite mercy his son granted him the chance to ascend."})
keywordHandler:addKeyword({'uman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The beings Uman and Zathroth merged forever in the blaze that followed when the last of the true gods perished."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The beings Uman and Zathroth merged forever in the blaze that followed when the last of the true gods perished."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Banor was the most devout minion of the false gods. Their lickspittle lapdog. Seeing they needed additional strength they granted him some of their powers, and he became a lesser false god himself."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is likely that our world is a part of one of the dead true gods or one of his manifestations that somehow escaped destruction. We must assume this is all that is left of the original universe."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cities that bow to the false gods will be afflicted with plague and fear until they embrace the wisdom of the pharaoh."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cities that bow to the false gods will be afflicted with plague and fear until they embrace the wisdom of the pharaoh."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cities that bow to the false gods will be afflicted with plague and fear until they embrace the wisdom of the pharaoh."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cities that bow to the false gods will be afflicted with plague and fear until they embrace the wisdom of the pharaoh."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves suffered, but they have drawn wrong conclusions. If they do not listen to the revelations of our immortal pharaoh, pain and grief will prove to be better teachers this time."})
keywordHandler:addKeyword({'dwar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves suffered, but they have drawn wrong conclusions. If they do not listen to the revelations of our immortal pharaoh, pain and grief will prove to be better teachers this time."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The foolish elves hold on to life too hard to see the way to salvation. However, if we teach them to remove the shackles of flesh through pain and suffering, they might begin to see their mistake."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The foolish elves hold on to life too hard to see the way to salvation. However, if we teach them to remove the shackles of flesh through pain and suffering, they might begin to see their mistake."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The foolish elves hold on to life too hard to see the way to salvation. However, if we teach them to remove the shackles of flesh through pain and suffering, they might begin to see their mistake."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We call Daraman the one-eyed prophet, for he clearly saw that ascension is possible, but he was blind to the fact that mortality itself and not mere temptation is the first obstacle that must be overcome."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The continent was named after Daraman, the prophet during the reign of Ashmunrah. The new pharaoh acknowledged the power that is in names and did not change the name when he acceded to the throne."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The followers of Daraman suffer the curse of the flesh. They can't reach ascension because they never really take the all-important initial step - they only pretend to do so."})
keywordHandler:addKeyword({'initial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In his preachings Daraman taught that you can conquer the tempations of the flesh through denial. However, the truth is that this constant struggle between temptation and the will blurs your vision, so no follower of Daraman can focus on ascension."})
keywordHandler:addKeyword({'Ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This city is a marvel of old. Our forefathers built it here on the ruins of an even older civilisation."})
keywordHandler:addKeyword({'mortality'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mortality is our prison. It makes us vulnerable for the temptations of the false gods."})
keywordHandler:addKeyword({'false'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The so-called gods are just the weakest of their kind. They are pitiful remnants from the terrible godswar between the elder gods which tore the universe appart."})
keywordHandler:addKeyword({'godswar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In ancient times the elder gods waged war upon each other. Those that call themselves gods today were the lowest of their minions. When the last of the true gods died the great suffering begun."})
keywordHandler:addKeyword({'great suffering'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The universe is dying. Death placed his mark on everything. Only the pharaoh can grant us freedom from mortality and open up the path of true ascension to us."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The sentient beings are all that is left of the essence of the elder gods. We can awake the dormant powers that slumber in us all. But ascension is a thorny path to follow."})
keywordHandler:addKeyword({'thorny'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our mortal shells make us vulnerable to the temptations of the false gods. Only by leaving our mortality behind, we can study the true path of ascension. The balance of Akh'rah Uthun has to be changed to our favour."})
keywordHandler:addKeyword({"Akh'rah"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Akh'rah Uthun is the unity of the Akh, our body, the Rah, our soul and the Uthun, our memories and experiences."})
keywordHandler:addKeyword({'balance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As long as it is mortal the body breeds temptations and distractions. Its needs make it easy for the false gods to lead us from the path of enlightenment and to ultimately steal our souls."})
keywordHandler:addKeyword({'soul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When a mortal is bound to one of the false gods by his faith this god will harvest his Rah on his death and strip away his Uthun, casting it into the void."})
keywordHandler:addKeyword({'Akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your flesh is traitorous and weak. The pharaoh grants the power to conquer death to those who serve him well. Once they have entered this state of being neither dead nor alive they are ready to enter the path of ascension."})
keywordHandler:addKeyword({'undea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath is freedom from mortal needs. It is the first obvious step to divinity."})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Rah is the ultimate treasure. The false gods need the stolen Rah to sustain their usurped powers."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The memory is what makes our personality. It is what defines us ... and its utterly worthless to the gods. For this reason destroy it to harvest our Rah."})
keywordHandler:addKeyword({'mourn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We mortals are all to be mourned for our prison of flesh. Only through loyal servitude to the pharaoh, praised be his existence, may we escape this prison and find our true destiny."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The arena is a fitting place to test your mortal shell and to feed the power of the Rah and the Uthun."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The residence of our immortal king is a temple in its own right because it is the home of a true god."})
keywordHandler:addKeyword({'bles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'donat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well, I can offer "premium light" and "remove vial".. but only for premium players!'})
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local talkstorage = 9911
local endstorage = 9901

if msgcontains(msg, 'wooden stake') then
	if getPlayerStorageValue(cid, endstorage) == 7 then
		npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
		setPlayerStorageValue(cid, talkstorage, 1)
end
elseif msgcontains(msg, 'yes') then	
	if getPlayerStorageValue(cid, talkstorage) == 1 then
		npcHandler:say("So receive my prayer: 'Let there be power and compassion'. Now, bring your stake to Brewster in Port Hope for the next line of the prayer. I will inform him what to do.", cid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		setPlayerStorageValue(cid, endstorage, 8)
		setPlayerStorageValue(cid, talkstorage, 2)
		end	
	end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  