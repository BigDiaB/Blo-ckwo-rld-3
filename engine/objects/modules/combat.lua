local Combat = {}

	function Combat.init(self)
		local timer = 0
		local dt = 0.016
		local combat = {}
		self.abilities = {
		  regen = true,
		  decrease = true,
		  wall_jump = false,
		  interact = false,
		  jump = true,
		  super_jump = false,
		  smoke_bomb = false,
		  sprint = false,
		}


self.wall_jump = function(col)
if self.abilities.wall_jump == true then
if col.normal.y == -1 or col.normal.y == 1 then
               self.vel.y = 0
            end
            if col.normal.x == 1 and self.actions.left then
               self.lastkey = "wall_left"
               self.gravmod = self.gravity - 1 --self.gravbase / 3
               self.can_sjump = false
               if self.actions.up and self.wjump_counter > 0 then
                 -- self.sjump = self.sjump - 49
                  self.wjump_counter = self.wjump_counter - 1
                  self.blockLeft = true
                  self.vel.y = -1200
                  self.vel.x = 650
                  self.Physics.toggle_timer = 6
               end
            elseif col.normal.x == -1 and self.actions.right then
               self.lastkey = "wall_right"
               self.gravmod = self.gravity - 1 ---self.gravbase / 3
               self.can_sjump = false
               self.vel.y = 0
               if self.actions.up and self.wjump_counter > 0 then
                  --self.sjump = self.sjump - 49
                  self.wjump_counter = self.wjump_counter - 1
                  self.blockRight = true
                  self.vel.y = -1200
                  self.vel.x = -650
                  self.Physics.toggle_timer = 6
               end
        end
    end
 end


self.super_jump = function() if self.abilities.super_jump == true then
	if not self.actions.up and not self.actions.jump then
			if self.sjump < 100 then
    self.sjump = self.sjump + (10 * dt)
    end end
  if self.sjump >= 100 and self.can_sjump and self.actions.jump  then for i = 1,90 do unity.new({self.pos.x + self.size.x / 2,self.pos.y + self.size.y,{0.6,0.6,0.6,1},4,0,0}) end self.sjump = 0 self.vel.y = -1800 end end
end



self.smoke_bomb = function() end



self.sprint = function()
if self.abilities.sprint == true then
			self.speed = 1
			 if self.actions.sprint and self.stamina > 0 then
		        if self.actions.left or self.actions.right then
		      self.speed = 2
    self.stamina = self.stamina - (10 * dt)
		    end
		elseif self.stamina < 100 then
		     self.speed = 1
		if self.actions.left or self.actions.right then
		  if self.stamina < 1 then
		  self.stamina = 0 end end
		 if not self.actions.left and not self.actions.right and not self.actions.up then
		       if self.stamina <= 100 then
    self.stamina = self.stamina + (8 * dt) end
  end
		     end
			if self.can_move == true then
				if is_phone then
					if screenpad:isPressed("X") then
						Inputs.toggle(self.actions.sprint)
					end
					end
				end
		end
end


self.jump = function() if self.abilities.jump == true then
  if self.grounded then self.vel.y = -1200 self.grounded = false end end
end




		combat.update = function(dt)
				self.isDead = self.health < 1
		if not self.isDead then
    self.sprint()
    self.super_jump()
    self.super_jump()
		local smooth = 0.08

        camera.x = math.floor((camera.x - (camera.x - (self.size.x / 2 + self.pos.x - love.graphics.getWidth() / 2)) * smooth))
        camera.y = math.floor((camera.y - (camera.y - (self.size.y / 2 + self.pos.y - love.graphics.getHeight() / 2)) * smooth))
      else
      camera.edgepan(dt,true)
  end
		end

		combat.draw = function()
		end


		--table.insert(self.drawers,combat.draw)
		table.insert(self.updates,combat.update)
		return combat
	end

return Combat
