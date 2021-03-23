local Player = {}
function Player:new(x,y,gravity,name)
	local player = {
	funcs = {},
	gravity = gravity,
	name = name or "Player",
	light = {x,y},
	gravbase = gravity,
	pos = {x = x, y = y},
	vel = {x = 0, y = 0},
	size = {x = 16,y = 32},
	layer = 3,
	id = 1,
	}
	function player:load()
		self.debug = true
		self.updates = {}
		self.drawers = {}
		self.kills = {}
		require("engine/objects/modules/interact").init(self)
		require("engine/objects/modules/animations").init(self)
		require("engine/objects/modules/combat").init(self)
		require("engine/objects/modules/inventory").init(self)
		require("engine/objects/modules/input").init(self)
		require("engine/objects/modules/physics").init(self)
	end
	function player:draw() for l,drawer in ipairs(self.drawers) do drawer()	end end
	function player:ui() for k,ui in ipairs(self.uis) do ui() end end
	function player:destroy() for j, kill in ipairs(self.kills) do kill() end self = nil end
	function player.update(dt) for i,update in ipairs(player.updates) do update(dt) end end
	loader.loadMe(player)
	looper.loopMe(player) looper.loopMe(player)
	Game.renderer.renderMe(player)
	table.insert(Players,player)
	return player
end
return Player
