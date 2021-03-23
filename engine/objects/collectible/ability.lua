local Collect = {}
local colls = {}
function Collect:init()
	local collect = {layer = 5}
	local parts = {}
	local idblacklist = {420}
	function collect.new(x,y,img,type)
		local coll = {
			id = collect.id(),
			pos = {x = x + 8,y = y + 8	},
			size = {x = 16,y = 16},
			layer = 4,
			type = type,
			}
			coll.draw = function()
				love.graphics.draw(img,coll.pos.x,coll.pos.y)
			end
			tagger:new(coll,"name_tag","tab",coll.type)
      		phi.add_box(coll)
			coll.update = function(dt)
		for i,Player in ipairs(Players) do
			if phi.boundingBox(Player,coll) then
			   	Player.abilities[coll.type] = true
				table.remove(idblacklist,coll.id)
				for i, paris in ipairs(colls) do
					if paris == coll then
						table.remove(colls,i)
					end
					looper.stopMe(coll)
					phi.kill_box(coll)
					tagger:kill(coll)
				end
			end
		end
	end

			looper.loopMe(coll)
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
	renderer.renderMe(collect)
	return collect
end

return Collect
