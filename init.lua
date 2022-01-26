local env = (getgenv and getgenv()) or _G

env.mercuryUI = {
    importCache = []
}


function env:import(path)
    if self.importCache[path] then
        return self.importCache[path]
    end

    local content

    if type(path) == "string" then
        content = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AbstractPoo/mercury-lib/main/".. path .. "lua"))()
        return content
    elseif type(path) == "number" then
        content = game:GetObjects("rbxassetid://" .. path)[1]
        return content
    end
    self.importCache[path] = content

    return content
end