local function setDefaults(defaults, options)
    for property, value in next, options do
        defaults[property] = value
    end
    return defaults
end

return setDefaults