local RunService = game:GetService("RunService")

local imports = {
    "element"
}

for _, module in next, imports do
    if RunService:IsStudio() then
        content = require(game.ReplicatedStorage[module])
        _G[module] = content
    else
        spawn(function()
            content = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AbstractPoo/mercury-lib/main/" .. module .. "lua"))()
            getgenv()[module] = content
        end
    end
end

local blueprint = {}

local Library = {}

function Library:Create(options)
    table.insert(blueprint, {
        --constructor = createLibraryModule Function thing,
        properties = options
    })

    return options
end

return Library