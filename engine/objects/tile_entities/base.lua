local TEnt = {}

function TEnt.new(x,y,w,h,ARGS,img,quad)
	local ent = {
		pos = {x = x, y = y},
		light = {x,y},
		size = {x = w, y = h},
		img = img,
		quad = quad,
		interactable = false,
		content = {}
	}
	
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
		terminal.print(math.random(1,99999))
	end


	table.insert(Game.interactables,ent)
	looper.loopMe(ent)
	Game.renderer.renderMe(ent,1)
	return ent
end

return TEnt