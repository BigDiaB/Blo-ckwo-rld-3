
	require("engine/engine_start"):yes()
	require("assets/terminal/func_vars")
	local Game = require("scenes/game")
	local Editor = require("scenes/editor")
	local tick = require("libs/tick")

function love.load()
	--tick.framerate = 60
	threader.load("threads/cycle_timer",{2})
	sceneMNGR.start(Game)
	loader.load()
	tagger:new(Player,"name_tag","tab","Player")
	end

function love.update(dt)
	if dt < 0.05 then
		if lib.receive(1) == 1 then
			time = time + .1
			if time >= 24 then
				time = 0
			end
		end
		looper.update(dt)
--		if Player.inventory.bulk[1]["coin"] >= 999 then
--			terminal.print("DIE CHEATER!!!")
--			Player.health = 0
--		end
	end
end

function love.draw()
	local shader = love.graphics.newShader(require("assets/world/shader"))
	if Game.lights then
	love.graphics.setShader(shader)
	if time >= 12 then
		shader:send("time",1)
	else
		shader:send("time",0)
	end
    shader:send("light_positions",unpack(Game.lights))
    shader:send("light_size", 50)
    shader:send("number_of_lights", #Game.lights)
    shader:send("camera", {camera.x, camera.y})
	end
    camera.set()
	renderer.draw()
	camera.unset()
	love.graphics.setShader()
	ui_render.draw()
end
