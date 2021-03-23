require("assets/world/map")
Players = {}
Game = {}
function Game.assets()
	Game.interactables = {}
	Game.lights = {}
	Game.lights.index = 0
	function Game.lights.add(obj)
  Game.lights.index = Game.lights.index + 1
  Game.lights[Game.lights.index] = {obj.pos.x + obj.size.x / 2,obj.pos.y + obj.size.y / 2}
end
	Game.ui = require("engine/ui")
	Game.map = require("engine/chunk_loader")
	Game.renderer = require("engine/simple_renderer"):init(5)
	Game.renderer.id = renderer.renderMe(Game.renderer,3)
	Player = require("engine/objects/player"):new(20,20,4)
	Game.lights.add(Player)
	Game.lights.add(require("engine/objects/tile_entities/portal").new(15 * 32,30 * 32,32,32))
	Game.lights.add(require("engine/objects/tile_entities/portal").new(9 * 32,23 * 32,32,32))
		require("engine/objects/collectible/ability"):init().new(12 * 32,20 * 32,money,"super_jump")
		require("engine/objects/collectible/ability"):init().new(14 * 32,20 * 32,money,"wall_jump")
		require("engine/objects/collectible/ability"):init().new(34 * 32,0 * 32,money,"sprint")
		require("engine/objects/collectible/key"):init().new(27 * 32,30 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(34 * 32,32 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(35 * 32,32 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(36 * 32,32 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(34 * 32,31 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(35 * 32,31 * 32,money,_,1)
		require("engine/objects/collectible/coin"):init().new(36 * 32,31 * 32,money,_,1)
		require("engine/objects/tile_entities/door").new(31 * 32,28 * 32,32, 4 * 32)
		require("engine/objects/tile_entities/door").new(32 * 32,28 * 32,32, 4 * 32)
	--[[require("engine/objects/collectible/coin"):init().new(11 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(12 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(13 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(14 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(19 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(20 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(21 * 32,19 * 32,money,"coin",3)
	require("engine/objects/collectible/coin"):init().new(22 * 32,19 * 32,money,"coin",3)]]
end


function Game.load()
	if is_phone then
		
	end

local game_map,game_bg = get_world()
for y = 1, #get_world() do
	for x = 1, #get_world()[y] do
		Game.map.generate(x,y,game_bg,1,false,true)
		Game.map.generate(x,y,game_map,2)
	end
end

end


function Game.update(dt)
	Game.lights[1] = {Player.pos.x,Player.pos.y,1}
	if is_phone then

	end
	if love.keyboard.isDown("k") then
		Player.blockLeft = true
		Player.blockRight = true
		Player.vel.x = 0
		for i = 1,7 do
		unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y / 2,{0.8,0.8,0.8,0.5},8.1,0,0},5)
		unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y / 2,{0.4,0.4,0.4,0.5},8.1,0,0},5)
		unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y / 2,{0.7,0.7,0.7,0.5},8.1,0,0},5)


		end end
	--for i = 1,2 do
	--unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y,{1,0,0},10,0,0})
	--unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y,{1,0.7,0},10,0,0})
	--unity.new({Player.pos.x + Player.size.x / 2,Player.pos.y + Player.size.y,{1,0.9,0},10,0,0})
	--end

end


function Game.draw()
	--love.graphics.setBackgroundColor(0,0.7,1)
	Game.ui.makeGraph(Player.health,0,false,{1,0,0})
	Game.ui.makeGraph(Player.stamina,40,true,{4,2,0})
	Game.ui.makeGraph(Player.sjump,70,true,{0,6,9})
	Game.ui.makeGraph(Game.ui.percent(Player.wjump_counter,Player.wjump_max),100,true,{3,6,0})

	if is_phone then
	
	end

end


return Game
