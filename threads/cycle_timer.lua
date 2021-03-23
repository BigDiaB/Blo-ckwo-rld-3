local lib = require("libs/thread_lib")
local timer = require("love.timer")
local time = ... or 1
while true do
timer.sleep(time / 10)
lib.send(1,1)
end
