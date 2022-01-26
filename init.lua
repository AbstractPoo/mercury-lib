local env = getgenv()

env.mercuryUI = {
    importCache = {},
    boundObjects = {},
    themes = {
        dark = {
            Main = Color3.fromRGB(35, 35, 35),
            Secondary = Color3.fromRGB(55, 55, 55),
            Tertiary = Color3.fromRGB(75, 155, 210)
        }
    },
    services = setmetatable({}, {
        __index = function(t, k)
            local service = game:GetService(k)
            t[k] = service
            return service 
        end
    }),
    dev = self.services["RunService"]:IsStudio()
}

function env.import(path)
    if self.importCache[path] then
        return self.importCache[path]
    end

    local content

    if type(path) == "string" then
        if mercuryUI.dev then
            content = require(game.ReplicatedStorage[path])
        else
            content = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AbstractPoo/mercury-lib/main/".. path .. "lua"))()
        end
    elseif type(path) == "number" then
        content = game:GetObjects("rbxassetid://" .. path)[1]
    end

    self.importCache[path] = content

    return content
end

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