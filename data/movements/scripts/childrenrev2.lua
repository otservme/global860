function onStepIn(cid, item, pos)

  
 function First() 

    doSummonCreature("Lizard Chosen", {x= 33254,y= 31108,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33254,y= 31106,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33258,y= 31105,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33263,y= 31107,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33265,y= 31104,z=7}) 
	
	doSummonCreature("Eternal Guardian", {x= 33261,y= 31111,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33261,y= 31113,z=7})
	
	doSummonCreature("Eternal Guardian", {x= 33287,y= 31110,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33277,y= 31129,z=7}) 
	
	doSummonCreature("Lizard Chosen", {x= 33260,y= 31133,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33256,y= 31128,z=7}) 


    doSummonCreature("Eternal Guardian", {x= 33255,y= 31122,z=7}) 
	
end 
function Second() 
	
	doSummonCreature("Eternal Guardian", {x= 33262,y= 31112,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33262,y= 31114,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33272,y= 31106,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33278,y= 31107,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33277,y= 31107,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33286,y= 31108,z=7}) 
    
    doSummonCreature("Lizard Chosen", {x= 33289,y= 31105,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33268,y= 31129,z=7}) 

end  
function Third() 

    doSummonCreature("Lizard Chosen", {x= 33254,y= 31108,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33254,y= 31106,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33258,y= 31105,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33261,y= 31113,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33271,y= 31105,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33277,y= 31106,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33278,y= 31122,z=7}) 

    doSummonCreature("Eternal Guardian", {x= 33277,y= 31129,z=7}) 
	
	doSummonCreature("Lizard Chosen", {x= 33260,y= 31133,z=7}) 
end 
function Fourth() --  with 2s delay 

    doSummonCreature("Eternal Guardian", {x= 33263,y= 31107,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33265,y= 31104,z=7}) 
	
	doSummonCreature("Eternal Guardian", {x= 33261,y= 31111,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33261,y= 31113,z=7}) 
	doSummonCreature("Eternal Guardian", {x= 33287,y= 31110,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33288,y= 31104,z=7}) 

    doSummonCreature("Lizard Chosen", {x= 33278,y= 31122,z=7}) 
	
	doSummonCreature("Lizard Chosen", {x= 33260,y= 31133,z=7})

end

function Teleport() 
	doItemSetAttribute(getTileItemById({x= 33265,y= 31115,z= 7}, 11094).uid, "aid", 25025)
	local v = getSpectators({x= 33272,y= 31116,z= 7}, 50, 50)
	for i = 1, #v do
		if isPlayer(v[i]) then
			doTeleportThing(v[i], {x=33349, y=31412, z=8})
			setPlayerStorageValue(v[i], 8823, 1)
		end
	end
end

if item.actionid == 25025 then
doItemSetAttribute(item.uid, "aid", 0) 
addEvent(First, 0)
addEvent(Second, 30000)
addEvent(Third, 90000)
addEvent(Fourth, 120000)
addEvent(Teleport, 150000)

end
end
