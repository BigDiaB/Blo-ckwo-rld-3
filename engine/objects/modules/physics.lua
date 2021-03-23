local Physics = {}

   function Physics.init(self)
     phi.add(self)
      self.speed = 1
      self.Physics = {}
      self.grounded = false
      self.gravmod = 0
      self.has_physics = true
      self.Physics.toggle_timer = 0
      function Physics.collide(dt)
         if self.gravmod > 0 then self.gravmod = self.gravmod - (dt * 5) end
         if self.Physics.toggle_timer > 0 then
            self.Physics.toggle_timer = self.Physics.toggle_timer - (dt * 10)
         end
         if self.Physics.toggle_timer <= 1 then
            self.blockLeft = false
            self.blockRight = false
            self.can_sjump = true
         end
         local futureX = self.pos.x + (self.vel.x * dt * self.speed)
         local futureY = self.pos.y + (self.vel.y * dt) + (self.gravity - self.gravmod)

         local nextX, nextY, cols = phi.move(self, futureX, futureY,true)
         self.grounded = false
         for i = 1,#cols do
            local col = cols[i]
            self.wall_jump(col)
             if col.normal.y == -1 then self.grounded = true self.wjump_counter = self.wjump_max self.xjump = 1 self.jump_timer = 0
          end end
         return nextX,nextY,cols
      end


      Physics.update = function(dt)

         local nextX,nextY = Physics.collide(dt)

         --self.pos = {x = nextX, y = nextY}

         self.vel.y = self.vel.y * math.pow(0.002, dt)
         self.vel.x = self.vel.x * math.pow(0.0002,dt)
   end

      Physics.kill = function()
       phi.kill(self)
      end
      table.insert(self.kills,Physics.kill)
      table.insert(self.updates,Physics.update)

   end

return Physics

