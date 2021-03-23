local Anims = {}
local anim8 = require("libs/anim8")

function Anims.init(self)
	self.grids = {}
	self.anims = {}
	self.lastkey = "right"

	self.setGrid = function(name,w,h,sheet)
		self.grids.name = anim8.newGrid(w,h,sheet:getDimensions())
	end
		self.newAnim = function(id,name,frames,row,duration,sheet)
		id ={name = id, anim = anim8.newAnimation(self.grids.name(frames,row), duration),sheet = sheet, } 
		table.insert(self.anims,id)
	end
	Anims.draw = function()
		for i, anim in ipairs(self.anims) do
   			if anim.name == "left" and self.lastkey == "left" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
   			if anim.name == "right" and self.lastkey == "right" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
   			if anim.name == "idle" and self.lastkey == "idle" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
   			if anim.name == "wall_left" and self.lastkey == "wall_left" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
   			if anim.name == "wall_right" and self.lastkey == "wall_right" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
   			if anim.name == "ultimate_universal_sign_of_peace" and self.lastkey == "ultimate_universal_sign_of_peace" then
   				anim.anim:draw(anim.sheet,self.pos.x,self.pos.y) end
		end
	end
	Anims.update = function(dt)
	if self.anims then
			for i, id in ipairs(self.anims) do
				id.anim:update(dt) 
			end
		end
	end
	self.setGrid(movement,16,32,playersheet)
	self.newAnim("ultimate_universal_sign_of_peace",movement,"3-3",2,10000,playersheet)
	self.newAnim("wall_left",movement,"1-1",2,1000,playersheet)
	self.newAnim("wall_right",movement,"2-2",2,1000,playersheet)
	self.newAnim("left",movement,"3-4",1,0.25,playersheet)
	self.newAnim("right",movement,"6-7",1,0.25,playersheet)
	self.newAnim("idle",movement,"1-1",1,1000,playersheet)
	table.insert(self.updates,Anims.update)
	table.insert(self.drawers,Anims.draw)
end
	return Anims