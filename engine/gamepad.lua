local controller = {}

function controller.get()
    sticks = love.joystick.getJoysticks()
    if #sticks > 0 then
        xaxe = sticks[1]:getAxis(1)
        yaxe = sticks[1]:getAxis(2)
        has_controller  = true
        function getGamePad()
            return sticks[1]
        end
    else has_controller = false
    end
end

function controller.Xleft()
    local xaxe = xaxe or 0
    if xaxe < -0.5 then
        return true
    else
        return false
    end
end

function controller.Xright()
    local xaxe = xaxe or 0
    if xaxe > 0.5 then
        return true
    else
        return false
    end
end
return controller