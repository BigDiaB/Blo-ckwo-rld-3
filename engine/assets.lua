local Assets = {}

 Assets.load = function()
 love.graphics.setDefaultFilter("nearest","nearest")
 door_s = love.graphics.newImage("assets/world/door_s.png")
 door_m = love.graphics.newImage("assets/world/door_m.png")
 door_l = love.graphics.newImage("assets/world/door_l.png")
 playersheet = love.graphics.newImage("assets/sheets/player.png")
 money = love.graphics.newImage("assets/world/coin.png")
 	  Font = love.graphics.newImageFont("assets/terminal/font.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789üÜöÖäÄß.,!?-+/():;%&`'*#=[]_\"")
 	  love.graphics.setFont(Font)
 end
loader.loadMe(Assets)
return Assets
