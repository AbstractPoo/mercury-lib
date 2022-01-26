env = (getgenv and getgenv()) or _G

function env:import(path)
    if type(path) == "string" then
        
    elseif type(path) == "number" then
        return game:GetObjects("rbxassetid://" .. path)
    end
end