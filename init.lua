local env = (getgenv and getgenv()) or _G

env.mercuryUI = {
    importCache = {},
    Library = {},
    cursedObjects = {}
}


function env.import(path)
    if self.importCache[path] then
        return self.importCache[path]
    end

    local content

    if type(path) == "string" then
        if env.RunService:IsStudio() then
            return game.ReplicatedStorage[path]
        content = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AbstractPoo/mercury-lib/main/".. path .. "lua"))()
    elseif type(path) == "number" then
        content = game:GetObjects("rbxassetid://" .. path)[1]
    end

    self.importCache[path] = content

    return content
end

function env.curse(guiObject, theme)
    table.insert(self.cursedObjects, {
        Object = guiObject,
        Theme = theme
    })
end

return env.mercuryUI.Library