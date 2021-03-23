local TEnt = {}

function TEnt.new(x,y,w,h,ARGS,img,quad)
	local ent = {
		pos = {x = x, y = y},
		light = {x,y},
		size = {x = w, y = h},
		img = img,
		quad = quad,
		interactable = false,
		content = {},
		number = math.random(1,9999999999999999999999),
		id = "portal",
	}
	if ARGS then
		ent.idtype = ARGS[1] or 1
	else
		ent.idtype = 1
	end

	--if quad ~= nil then
	--	ent.draw = function()
	--		love.graphics.draw(ent.img,ent.quad,ent.pos.x,ent.pos.y)
	--	end
	--else
		ent.draw = function()
			--love.graphics.draw(ent.img,ent.pos.x,ent.pos.y)
			love.graphics.rectangle("fill", ent.pos.x,ent.pos.y,ent.size.x,ent.size.y)
		end
	--end

	ent.update = function(dt)
		for i,Player in ipairs(Players) do
			if phi.boundingBox(Player,ent) then
				ent.interactable = true
			else
				ent.interactable = false
			end
		end
	end

	ent.action = function(self)
		for i, tent in ipairs(Game.interactables) do
			if tent.id == "portal" and tent.number ~= ent.number and tent.idtype == ent.idtype then
				phi.kill(self)
				self.pos.y = tent.pos.y - self.size.y
				self.pos.x = tent.pos.x + self.size.x / 2
				phi.add(self)
			end
		end
	end


	table.insert(Game.interactables,ent)
	looper.loopMe(ent)
	phi.add_box(ent)
	Game.renderer.renderMe(ent,2)
	return ent
end

return TEnt
