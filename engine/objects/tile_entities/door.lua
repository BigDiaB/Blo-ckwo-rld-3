local TEnt = {}
local Doors = {}
TEnt.draw = function() for i = 1,#Doors do Doors[i].draw() end end
function TEnt.new(x,y,w,h,ARGS,img,quad)
	local ent = {
		pos = {x = x, y = y},
		light = {x,y},
		size = {x = w, y = h},
		img = img,
		quad = quad,
		vel = {x = 0},
		drawes = true,
		interactable = false,
	}

	--if quad ~= nil then
	--	ent.draw = function()
	--		love.graphics.draw(ent.img,ent.quad,ent.pos.x,ent.pos.y)
	--	end
	--else
		ent.draw = function()
			--love.graphics.draw(ent.img,ent.pos.x,ent.pos.y)
			if ent.size.y / 32 == 1 then
			love.graphics.draw(door_s,ent.pos.x,ent.pos.y)
			elseif ent.size.y / 32 == 2 then
			love.graphics.draw(door_m,ent.pos.x,ent.pos.y)
			else
			love.graphics.draw(door_l,ent.pos.x,ent.pos.y)
			end
		end
	--end

	ent.update = function(dt)
		for i,Player in ipairs(Players) do
			if phi.boundingBox(Player,ent,20) then
			   ent.interactable = true
			else
				ent.interactable = false
			end
		end
	end

	ent.action = function(self)
	if self.inventory.bulk[1]["key"] > 0 then
	self.inventory.bulk[1]["key"] = self.inventory.bulk[1]["key"] - 1
		for i, enti in ipairs(Game.interactables) do
	  if enti == ent then
	  table.remove(Game.interactables,i)
	  end
	  end
	for i, enti in ipairs(Doors) do
	  if enti == ent then
	  ent.drawes = false
  	 phi.kill(ent)
  	 looper.stopMe(ent)
	   table.remove(Doors,i)
	  end
	 end
		end
	end

  phi.add(ent)
	table.insert(Game.interactables,ent)
	table.insert(Doors,ent)
	looper.loopMe(ent)
	return ent
end
Game.renderer.renderMe(TEnt,3)
return TEnt
