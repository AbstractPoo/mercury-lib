local setDefaults = import("utility/defaults")

local function object(class, properties)
    local localObject = Instance.new(class)

    local defaultProperties = {
        BorderSizePixel = 0,
        AutoButtonColor = false
    }

    for property, value in next, defaultProperties do
        pcall(function() localObject[property] = value end)
    end

    local methods = {AbsoluteObject = localObject}

    function methods:tween(options)
        
        local options = setDefaults({
			Length = 0.2,
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.InOut,
            Callback = function() end
		}, options)

		local info = TweenInfo.new(options.Length, options.Style, options.Direction)

        local callback = options.Callback
        options.Callback = nil		
        options.Length = nil
		options.Style = nil 
		options.Direction = nil
        
		local tween = TweenService:Create(localObject, info, options); tween:Play()

		tween.Completed:Connect(function()
			callback()
		end)

		return tween
    end

    function methods:object(class, options)
        options.Parent = localObject
        return object(class, options)
    end

    function methods:round(radius)
        radius = radius or 6
        local cornerRound = methods:object("UICorner", {
            CornerRadius = UDim.new(0, radius)
        })

        return methods, cornerRound
    end

    function methods:bind(property, theme)
        if not boundObjects[theme] then
            boundObjects[theme] = {}
        end

        table.insert(mercuryUI.boundObjects[theme], {
            Object = methods,
            Property = property,
            Theme = theme
        })

        return methods
    end

    return setmetatable(methods, {
        __index = localObject
    })
end

return object