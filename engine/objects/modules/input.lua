local Inputs = {}
local gamepad = require("engine/gamepad")
if gamepad.get() then
check_gamepad = true
end

function Inputs.init(self)
	self.input = {}
	self.input.toggle_timer = 0
	local hotbar1 = "1"
	local hotbar2 = "2"
	local hotbar3 = "3"
	local hotbar4 = "4"
	local hotbar5 = "5"
	self.actions = {}
	self.wjump_max = 8
	self.wjump_counter = self.wjump_max
	self.can_sjump = true
	self.blockLeft = false
	self.blockRight = false
	self.keys = {}
	self.stamina = 100
	self.health = 100
	self.sjump = 100
	self.grounded = true
	self.can_move = true
	self.keys = {
		{ k = {trigger = "lshift"}, g  = {trigger = "x"}, name = "sprint" },
		{ k = {trigger = "space"}, g  = {trigger = "leftstick"}, name = "jump" },
		{ k = {trigger = "w"}, g  = {trigger = "a"}, name = "up" },
		{ k = {trigger = "s"}, g  = {trigger = "dpdown"}, name = "down" },
		{ k = {trigger = "i"}, g  = {trigger = "y"}, name = "inventory" },
		{ k = {trigger = "e"}, g  = {trigger = "b"}, name = "interact" },
		--{ trigger = hotbar1, 	name = "hotbar1"},
		--{ trigger = hotbar2, 	name = "hotbar2"},
		--{ trigger = hotbar3, 	name = "hotbar3"},
		--{ trigger = hotbar4, 	name = "hotbar4"},
		--{ trigger = hotbar4, 	name = "hotbar4"},
	}
	for i = 1,#self.keys do
	if self.can_move == true then
		self.actions[self.keys[i].name] = false
		end
	end


	function Inputs.toggle(var)
		if var == false then
			if self.input.toggle_timer <= 1 then
				self.input.toggle_timer = 10
				var = true
			end
		elseif var == true then
			if self.input.toggle_timer <= 1 then
				self.input.toggle_timer = 10
				var = false
			end
		end
	end


	function Inputs.update(dt)
	if not self.isDead then
		if self.input.toggle_timer >= 0 then
			self.input.toggle_timer = self.input.toggle_timer - (dt * 20)
		end
		self.actions.right = false
		self.actions.left = false
		self.actions.up = false
		self.actions.jump = false
		self.actions.down = false
		if not is_phone then
			self.actions.sprint = false
		end
		if not check_gamepad then
			--if not is_phone then
			if love.keyboard.isDown("a") then self.actions.left = true end
			if love.keyboard.isDown("d") then self.actions.right = true end
		for i,key in ipairs(self.keys) do
			if love.keyboard.isDown(key.k.trigger) then
				self.actions[key.name] = true --else self.actions[key.name] = false
			end
		end
	else
		if has_controller then
		if xaxe > 0.5 then self.actions.right = true end
		if xaxe < -0.5 then self.actions.left = true end

		for j, pad in ipairs(self.keys) do
				if pad.g and sticks[1]:isGamepadDown(pad.g.trigger) then
				self.actions[pad.name] = true --else self.actions[pad.name] = false
			end
			end
		--end
	end
	end
		terminal.return_can_move(self)
    if self.can_move == true then
	     if not self.actions.right and not self.actions.left then self.lastkey = "idle" end
		   if self.actions.right and not self.blockRight then self.vel.x = 130 self.lastkey = "right" end
		   if self.actions.left and not self.blockLeft then self.vel.x = -130 self.lastkey = "left" end
		   if self.actions.down then self.lastkey = "ultimate_universal_sign_of_peace" end
		   if self.actions.up then self.jump() end
		   if self.actions.jump then end
		   if self.actions.sprint then end
	end
	end
	end

	--function Inputs.draw() end

	--table.insert(self.drawers,Inputs.draw)
	table.insert(self.updates,Inputs.update)
end
	return Inputs
