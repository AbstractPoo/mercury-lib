local object = import("utility/object")
local setDefaults = import("utility/defaults")

local Library = {}

function Library:create(options)
    options = setDefaults({
        Title = "MercuryUI"
    }, options)

    local gui = object("ScreenGui")

    local mainFrame = gui:object("Frame", {
        Size = UDim2.fromOffset(600, 450),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }):round(10):bind("BackgroundColor3", "Main")
end

return Library