local Rect = {}
require("tools/vec2")
function Rect:new(x,y,w,h)
	local rect = {
		pos = tools.vec2(x,y),
		size = tools.vec2(w,h)
	}
	return rect
end
return Rect