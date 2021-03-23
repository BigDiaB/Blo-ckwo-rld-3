local engine_start = {}

function engine_start:yes()
	love.graphics.setDefaultFilter('nearest', 'nearest');
	is_phone = love.system.getOS() == "Android"
	loader = require("engine/objloader"):init()
	looper = require("engine/gameloop"):init()
	ui_render = require("engine/ui_renderer"):init(2)
	renderer = require("engine/renderer"):init(5)
	threader = require("engine/threader"):init()
	phi = require("libs/physician")
	unity = require("libs/unity"):init()
	world = require("libs/bump").newWorld(32)
	sceneMNGR = require("scenes/manager"):init()
	terminal = require("engine/terminal")
	lib = require("libs/thread_lib")
	tagger = require("engine/tag")
	camera = require("engine/camera")
	smallfont = love.graphics.newFont(10)
	middlefont = love.graphics.newFont(15)
	time = 12
end

return engine_start