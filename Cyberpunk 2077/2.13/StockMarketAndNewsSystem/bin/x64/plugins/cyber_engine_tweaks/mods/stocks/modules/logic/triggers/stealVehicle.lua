local Cron = require("modules/external/Cron")

trigger = {}

function trigger:new()
	local o = {}

    -- Default data
    o.name = "stealCarAny"
    o.fadeSpeed = 0.008
    o.newsThreshold = 0.3
    o.exportData = {
        value = 0
    }

    o.cooldown = false

	self.__index = self
   	return setmetatable(o, self)
end

function trigger:checkForData(data)
    if data["triggers"][self.name] == nil then
        data["triggers"][self.name] = self.exportData
    else
        self.exportData = data["triggers"][self.name]
    end
end

function trigger:decreaseValue() -- Runs every intervall
    if self.exportData.value == 0 then return end
    if self.exportData.value > 0 then
        self.exportData.value = self.exportData.value - self.fadeSpeed
    elseif self.exportData.value < 0 then
        self.exportData.value = 0
    end
end

function trigger:registerObservers() -- Gets called once onInit
    Observe("VehicleComponent", "StealVehicle", function()
        if self.cooldown then return end
        self.cooldown = true
        Cron.After(1, function ()
            self.cooldown = false
        end)
        self.exportData.value = self.exportData.value + 0.1
    end)
end

function trigger:update() end

return trigger