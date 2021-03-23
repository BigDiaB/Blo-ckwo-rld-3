min, max = ...
local lib = require("libs/thread_lib")
local nums = {}
for i = min, max do
   	num = i * i
   	nums[i] = num
   	lib.send(num,1)
end