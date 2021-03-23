local Collect = {}
local colls = {}
function Collect:init()
	local collect = {layer = 3}
	local parts = {}
	local idblacklist = {420}
	function collect.new(x,y,img,art,num)
		local coll = {
			id = collect.id(),
			pos = {x = x + 8,y = y + 8},
			layer = 4,
			type = art,
			size = {x = 16,y = 16},
			num = num
			}
			tagger:new(coll,"name_tag","tab","twenty beggar")
			coll.draw = function()
				love.graphics.draw(img,coll.pos.x,coll.pos.y)
			end

			coll.update = function(dt)
		for i,Player in ipairs(Players) do
			if phi.boundingBox(Player,coll) then
			   	Player.inventory.bulk[1]["coin"] = Player.inventory.bulk[1]["coin"] + coll.num
				table.remove(idblacklist,coll.id)
				for i, paris in ipairs(colls) do
					if paris.id == coll.id then
						table.remove(colls,i)
					end
					looper.stopMe(coll)
					tagger:kill(coll)
					phi.kill_box(coll)
				end
			end
		end
	end

			looper.loopMe(coll)
			phi.add_box(coll)
			table.insert(colls,coll)
			idblacklist[coll.id] = coll.id

	end
	function collect.id()
		for i = 1, #idblacklist do
			::retry::
			local id =  math.random(1,999)
			if id ~= idblacklist[i] then
				table.insert(idblacklist,id)
				return id
			else
			collect.id()
			end
		end
	end

	function collect.draw()
		for i = 1,#colls do
			colls[i].draw()
		end
	end
	Game.renderer.renderMe(collect)
	return collect
end

return Collect
