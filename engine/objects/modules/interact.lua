local Interact = {}

	function Interact.init(self)
		self.inter = {button = {k = {trigger = "e"},g = {trigger = "dpup"}, name = "interact"},cooldown = 5}

		Interact.update = function(dt) 
		self.inter.cooldown = self.inter.cooldown - (dt * 5)
			if love.keyboard.isDown(self.inter.button.k.trigger) then
				for i, int in ipairs(Game.interactables) do
					if int.interactable == true then
						if int.action and self.inter.cooldown <= 1 then
							self.inter.cooldown = 5
							int.action(self)
						end
					end
				end
			end
		end

		Interact.draw = function()

		end

		table.insert(self.updates,Interact.update)

	end

return Interact 