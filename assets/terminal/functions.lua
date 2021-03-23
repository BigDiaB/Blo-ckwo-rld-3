local Functions = {}
	function Functions:init(Terminal)
		local functions = {

			help4 = function(name)
				if name == "me" then
					Terminal.print("/kill		who?")
					Terminal.print("/setTime2	what?")
					Terminal.print("/giveAb2	 what?  		who?")
					Terminal.print("/takeAbFrom  what?		  who?")
					Terminal.print("/giveKey2	how many?  	who?")
					Terminal.print("/giveCoin2   how many?  	who?")
					Terminal.print("/help4	   who?")
				else
					Terminal.print("I dont know "..name.." ... no help for you!!")
				end
			end,
			kill = function(obj)
			obj.health = 0
			Terminal.print("U ded")
			end,
			setTime2 = function(newTime)
				time = newTime
			terminal.print("Time set to" .. newTime)
			end,
			giveAb2 = function(ab,obj)
			  obj.abilities[ab] = true
			  terminal.print(obj.name.. " learned ".. ab.. " what a genius!!")
			end,
			takeAbFrom = function(ab, obj)
			  obj.abilities[ab] = false
			  terminal.print(obj.name.. " forgot ".. ab.. " what an idiot!!")
			end,
			giveKey2 = function(num, obj)
			  obj.inventory.bulk[1]["key"] = obj.inventory.bulk[1]["key"] + num
			  terminal.print(obj.name.. " cheated ".. num .. " keys")
			  terminal.print("He now has: "..obj.inventory.bulk[1]["key"].. " keys")
			end,
			giveCoin2 = function(num, obj)
			  obj.inventory.bulk[1]["coin"] = obj.inventory.bulk[1]["coin"] + num
			  terminal.print(obj.name.. " cheated ".. num .. " coins")
			  terminal.print("He now has: "..obj.inventory.bulk[1]["coin"].. " coins")
			end,
		}

		return functions
	end
return Functions
