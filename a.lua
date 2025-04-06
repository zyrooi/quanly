local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

local Window = WindUI:CreateWindow({
    Title = "M-Pro Hub",
    Icon = "door-open",
    Author = "Kiettrumhtml",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    --Background = "rbxassetid://13511292247", -- rbxassetid only
    HasOutline = false,
    -- remove it below if you don't want to use the key system in your script.
    KeySystem = { 
        Key = { "WQZAA-0DAS3-SBV4U-QNVRL-39SN5", "T93JP-OBK6-1MJB-EVWUK-AHFKW", "OUNSA-TLWLK-75S6D-AOYVF-DHZ9G"},
        Note = "Premium Key Enter",
        -- Thumbnail = {
        --     Image = "rbxassetid://18220445082", -- rbxassetid only
        --     Title = "Thumbnail"
        -- },
        URL = "https://Kiettrumhtml.site/", -- remove this if the key is not obtained from the link.
        SaveKey = true, -- optional
    },
})


Window:EditOpenButton({
    Title = "Open Menu",
    Icon = "monitor",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    --Enabled = false,
    Draggable = true,
})
local Tabs = {
    Main = Window:Tab({ Title = "General", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." }),
    Teleport = Window:Tab({ Title = "Teleport", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." }),
    Misc = Window:Tab({ Title = "Misc", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." }),
    Day = Window:Tab({ Title = "Time", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." }),
    Kill = Window:Tab({ Title = "Auto Kill", Icon = "mouse-pointer-2", Desc = "Contains interactive buttons for various actions." }),

}


Tabs.Main:Section({ Title = "Esp Player/Mob" })

Tabs.Main:Toggle({
    Title = "Esp Player",
    Default = false,
    Desc = "Esp Player",
    Callback = function(state) 
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = head
        billboardGui.Parent = player.Character
        billboardGui.Size = UDim2.new(0, 200, 0, 50)  -- Cố định kích thước BillboardGui
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Điều chỉnh vị trí đúng
        billboardGui.AlwaysOnTop = true

        -- Khoảng cách giữa người chơi và người chạy script
        local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
        local distanceTag = Instance.new("TextLabel")
        distanceTag.Parent = billboardGui
        distanceTag.Text = string.format("%.2f studs", distance)
        distanceTag.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
        distanceTag.TextStrokeTransparency = 0.5  -- Giảm giá trị để viền chữ dày hơn
        distanceTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Viền đen
        distanceTag.BackgroundTransparency = 1
        distanceTag.Size = UDim2.new(1, 0, 0.3, 0)  -- Khoảng cách chiếm 30% chiều cao
        distanceTag.Position = UDim2.new(0, 0, 0, 0)  -- Đặt ở trên cùng
        distanceTag.TextScaled = false  -- Không tự động thay đổi kích thước chữ
        distanceTag.Font = Enum.Font.SourceSansBold
        distanceTag.TextSize = 22

        -- Tạo TextLabel cho tên người chơi
        local nameTag = Instance.new("TextLabel")
        nameTag.Parent = billboardGui
        nameTag.Text = player.Name
        nameTag.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
        nameTag.TextStrokeTransparency = 0.5  -- Giảm giá trị để viền chữ dày hơn
        nameTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Viền đen
        nameTag.BackgroundTransparency = 1
        nameTag.Size = UDim2.new(1, 0, 0.7, 0)  -- Chiếm 70% chiều cao
        nameTag.Position = UDim2.new(0, 0, 0.3, 0)  -- Đặt dưới khoảng cách
        nameTag.TextScaled = false  -- Không tự động thay đổi kích thước chữ
        nameTag.Font = Enum.Font.SourceSansBold
        nameTag.TextSize = 22

        -- Cập nhật vị trí liên tục khi người chơi di chuyển
        game:GetService("RunService").Heartbeat:Connect(function()
            if player.Character and player.Character:FindFirstChild("Head") then
                local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                distanceTag.Text = string.format("%.2f studs", distance)
                billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Đảm bảo vị trí được cập nhật
            end
        end)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        createESP(player)
    end
end
 end
})
Tabs.Main:Toggle({
    Title = "Esp Mob",
    Default = false,
    Desc = "Esp Mob",
    Callback = function(state)
local function createMobESP(mob)
    if mob:FindFirstChild("HumanoidRootPart") then
        local root = mob.HumanoidRootPart
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = root
        billboardGui.Parent = root
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true

        local distanceTag = Instance.new("TextLabel")
        distanceTag.Parent = billboardGui
        distanceTag.Text = "..."
        distanceTag.TextColor3 = Color3.fromRGB(255, 100, 100)
        distanceTag.TextStrokeTransparency = 0.5
        distanceTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distanceTag.BackgroundTransparency = 1
        distanceTag.Size = UDim2.new(1, 0, 0.3, 0)
        distanceTag.Position = UDim2.new(0, 0, 0, 0)
        distanceTag.TextScaled = false
        distanceTag.Font = Enum.Font.SourceSansBold
        distanceTag.TextSize = 22

        local nameTag = Instance.new("TextLabel")
        nameTag.Parent = billboardGui
        nameTag.Text = mob.Name
        nameTag.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameTag.TextStrokeTransparency = 0.5
        nameTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameTag.BackgroundTransparency = 1
        nameTag.Size = UDim2.new(1, 0, 0.7, 0)
        nameTag.Position = UDim2.new(0, 0, 0.3, 0)
        nameTag.TextScaled = false
        nameTag.Font = Enum.Font.SourceSansBold
        nameTag.TextSize = 22

        game:GetService("RunService").Heartbeat:Connect(function()
            if root and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (root.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                distanceTag.Text = string.format("%.2f studs", distance)
            end
        end)
    end
end

-- Quét mob hiện có
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
        createMobESP(obj)
    end
end

-- Theo dõi mob mới xuất hiện
workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
        wait(0.1)
        createMobESP(obj)
    end
end)
 end
})
Tabs.Main:Section({ Title = "Aimbot" })
Tabs.Main:Button({
    Title = "Aimbot Head",
    Desc = "Aimbot Head For All Mob",
    Callback = function() bruh()  end
})
Tabs.Main:Button({
    Title = "Off Aimbot Head",
    Desc = "Off Aimbot Head For Remove Aimbot",
    Callback = function() offhead()  end
})

Tabs.Main:Button({
    Title = "Aimbot Human Mob",
    Desc = "Mob Body Aimbot",
    Callback = function() mobhuman() end
})
Tabs.Main:Button({
    Title = "Off Aimbot Human Mob",
    Desc = "Off Mob Body Aimbot",
    Callback = function()  humanoff() end
})
Tabs.Main:Button({
    Title = "Aimbot Mob Leg",
    Desc = "Aimbot All Mob Leg",
    Callback = function() aimbotmobleg()  end
})
Tabs.Main:Button({
    Title = "Off Aimbot Mob Leg",
    Desc = "Off Aimbot All Mob Leg",
    Callback = function() ogaimbotmobleg()  end
})



Tabs.Teleport:Button({
    Title = "Teleport 80km",
    Desc = "Teleport to 80km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Teleport:Button({
    Title = "Teleport 70km",
    Desc = "Teleport to 70km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Teleport:Button({
    Title = "Teleport 60km",
    Desc = "Teleport to 60km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})
Tabs.Teleport:Button({
    Title = "Teleport 50km",
    Desc = "Teleport to 50km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Teleport:Button({
    Title = "Teleport 40km",
    Desc = "Teleport to 40km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})
Tabs.Teleport:Button({
    Title = "Teleport 30km",
    Desc = "Teleport to 30km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})
Tabs.Teleport:Button({
    Title = "Teleport 20km",
    Desc = "Teleport to 0km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Teleport:Button({
    Title = "Teleport 10km",
    Desc = "Teleport to 10km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Teleport:Button({
    Title = "Teleport 0km",
    Desc = "Teleport to 0km Station If You Can't Teleport, It's Because the Game Has Fixed It",
    Callback = function() 
WindUI:Notify({
            Title = "Notification Teleport",
            Content = "Invalid Teleport",
            Icon = "droplet-off",
            Duration = 5,
        })
 end
})

Tabs.Misc:Section({ Title = "Misc" })

Tabs.Misc:Button({
    Title = "No Clip",
    Desc = "",
    Callback = function() 
local noclip = true
game:GetService("RunService").Stepped:Connect(function()
    if noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)
 end
})
Tabs.Misc:Button({
    Title = "FPS ANTILAG",
    Desc = "",
    Callback = function()  
--> Settings
local Settings = _G.fps_Settings or {
	Graphics = true,
	Lighting = true,
	Texture = true,
	Terrain = true,
	Effects = false
}

--> Variables
local sethiddenproperty = sethiddenproperty or set_hidden_property or set_hidden_prop
local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain

if settings then
	local RenderSettings = settings():GetService("RenderSettings")
	local UserGameSettings = UserSettings():GetService("UserGameSettings")

	if Settings.Graphics then
		RenderSettings.EagerBulkExecution = false
		RenderSettings.QualityLevel = Enum.QualityLevel.Level01
		RenderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
		UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
		workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
	end
end

if Settings.Lighting then
	Lighting.GlobalShadows = false
	Lighting.FogEnd = 1e9

	if sethiddenproperty then
		pcall(sethiddenproperty, Lighting, "Technology", Enum.Technology.Compatibility)
	end
end

if Settings.Texture then
	workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled

	if sethiddenproperty then
		pcall(sethiddenproperty, workspace, "MeshPartHeads", Enum.MeshPartHeads.Disabled)
	end
end

if Settings.Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0

	if sethiddenproperty then
		sethiddenproperty(Terrain, "Decoration", false)
	end
end

for Index, Object in ipairs(game:GetDescendants()) do
	if Object:IsA("Sky") and Settings.Texture then
		Object.StarCount = 0
		Object.CelestialBodiesShown = false
	elseif Object:IsA("BasePart") and Settings.Texture then
		Object.Material = "SmoothPlastic"
	elseif Object:IsA("BasePart") and Settings.Lighting then
		Object.CastShadow = false
	elseif Object:IsA("Atmosphere") and Settings.Lighting then
		Object.Density = 0
		Object.Offset = 0
		Object.Glare = 0
		Object.Haze = 0
	elseif Object:IsA("SurfaceAppearance") and Settings.Texture then
		Object:Destroy()
	elseif (Object:IsA("Decal") or Object:IsA("Texture")) and string.lower(Object.Parent.Name) ~= "head" and Settings.Texture then
		Object.Transparency = 1
	elseif (Object:IsA("ParticleEmitter") or Object:IsA("Sparkles") or Object:IsA("Smoke") or Object:IsA("Trail") or Object:IsA("Fire")) and Settings.Effects then
		Object.Enabled = false
	elseif (Object:IsA("ColorCorrectionEffect") or Object:IsA("DepthOfFieldEffect") or Object:IsA("SunRaysEffect") or Object:IsA("BloomEffect") or Object:IsA("BlurEffect")) and Settings.Lighting then
		Object.Enabled = false
	end
end
end
})

Tabs.Misc:Input({
    Title = "Time",
    Default = "",
    Placeholder = "10:00",  
    Callback = function(input)
        local timeLeft = 600
        game:GetService("RunService").Heartbeat:Connect(function()
            if timeLeft > 0 then
                timeLeft = timeLeft - 1
                local minutes = math.floor(timeLeft / 60)
                local seconds = timeLeft % 60
                Tabs.Main.Inputs[1].Placeholder = string.format("%02d:%02d", minutes, seconds)
            end
        end)
    end
})

Tabs.Day:Section({ Title = "Time Edit" })

Tabs.Day:Toggle({
    Title = "Only Day",
    Default = false,
    Desc = "Only Day For Time 12:00:00Am",
    Callback = function(state)
game.Lighting.TimeOfDay = "12:00:00"
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
game.Lighting.Brightness = 2
game.Lighting.GlobalShadows = false
 end
})
Tabs.Day:Toggle({
    Title = "Only Night",
    Default = false,
    Desc = "Only Night For Time 12:00:00Pm",
    Callback = function(state)
game.Lighting.TimeOfDay = "24:00:00"
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
game.Lighting.Brightness = 2
game.Lighting.GlobalShadows = false
 end
})
Tabs.Day:Toggle({
    Title = "Delete Shadow",
    Default = false,
    Desc = "Remove Shadow For Game",
    Callback = function(state) game.Lighting.GlobalShadows = false end
})

Tabs.Kill:Section({ Title = "Kill Mob" })

Tabs.Kill:Toggle({
    Title = "Kill All Mob",
    Default = false,
    Desc = "Kill All Mon Near You",
    Callback = function(state)
for _, npc in pairs(workspace:GetChildren()) do
    if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and not isPlayerModel(npc) then
        -- Giết NPC
        local humanoid = npc:FindFirstChild("Humanoid")
        humanoid.Health = 0
    end
end
 end
})

Tabs.Kill:Section({ Title = "Kill Player" })
Tabs.Kill:Dropdown({
    Title = "Select Player",
    Values = { "" },
    Value = "Option 1",
    Callback = function(option) end
})
Tabs.Kill:Toggle({
    Title = "Kill Selected Player",
    Default = false,
    Desc = "Kill the selected player from the dropdown",
    Callback = function(state)
    end
})

function offhead()
 _G.aimbothead = false
end

function humanoff()
_G.aimbothuman = false
end

function ogaimbotmobleg()
_G.aimbotleg = true
end


function  aimbotmobleg()
-- Bật/tắt Aimbot chân NPC
_G.aimbotleg = true

-- Dịch vụ cần dùng
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI vòng tròn giữa màn hình
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local circle = Instance.new("Frame", gui)
circle.Size = UDim2.new(0, 150, 0, 150)
circle.Position = UDim2.new(0.5, -75, 0.5, -75)
circle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
circle.BackgroundTransparency = 0.7

local corner = Instance.new("UICorner", circle)
corner.CornerRadius = UDim.new(1, 0)

-- Line từ tâm tới NPC
local line = Drawing.new("Line")
line.Visible = false
line.Color = Color3.fromRGB(0, 255, 0)
line.Thickness = 2

-- Kiểm tra model có phải người chơi không
local function isPlayerModel(model)
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character == model then
			return true
		end
	end
	return false
end

-- Tìm NPC gần nhất trong vòng tròn
local function getClosestNPC()
	local closestDistance = 75
	local target = nil

	for _, npc in pairs(workspace:GetChildren()) do
		if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and not isPlayerModel(npc) then
			local screenPoint, onScreen = Camera:WorldToViewportPoint(npc.Humanoid.LeftLeg.Position) -- Chỉnh chỗ này thành LeftLeg hoặc RightLeg
			if onScreen then
				local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
				if distance < closestDistance then
					closestDistance = distance
					target = npc
				end
			end
		end
	end

	return target
end

-- Aimbot loop
RunService.RenderStepped:Connect(function()
	if _G.aimbotleg then
		local target = getClosestNPC()
		if target then
			local legPosition = target.Humanoid.LeftLeg.Position  -- Cũng chỉnh ở đây để nhắm vào chân
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, legPosition)

			-- Vẽ line từ tâm đến chân
			local screenPos, onScreen = Camera:WorldToViewportPoint(legPosition)
			if onScreen then
				line.Visible = true
				line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
				line.To = Vector2.new(screenPos.X, screenPos.Y)
			else
				line.Visible = false
			end
		else
			line.Visible = false
		end
	else
		line.Visible = false
	end
end)
end

function mobhuman()
-- Bật/tắt Aimbot thân NPC
_G.aimbothuman = true

-- Dịch vụ cần dùng
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI vòng tròn giữa màn hình
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local circle = Instance.new("Frame", gui)
circle.Size = UDim2.new(0, 150, 0, 150)
circle.Position = UDim2.new(0.5, -75, 0.5, -75)
circle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
circle.BackgroundTransparency = 0.7

local corner = Instance.new("UICorner", circle)
corner.CornerRadius = UDim.new(1, 0)

-- Line từ tâm tới NPC
local line = Drawing.new("Line")
line.Visible = false
line.Color = Color3.fromRGB(0, 255, 0)
line.Thickness = 2

-- Kiểm tra model có phải người chơi không
local function isPlayerModel(model)
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character == model then
			return true
		end
	end
	return false
end

-- Tìm NPC gần nhất trong vòng tròn
local function getClosestNPC()
	local closestDistance = 75
	local target = nil

	for _, npc in pairs(workspace:GetChildren()) do
		if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") and not isPlayerModel(npc) then
			local screenPoint, onScreen = Camera:WorldToViewportPoint(npc.HumanoidRootPart.Position)
			if onScreen then
				local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
				if distance < closestDistance then
					closestDistance = distance
					target = npc
				end
			end
		end
	end

	return target
end

-- Aimbot loop
RunService.RenderStepped:Connect(function()
	if _G.aimbothuman then
		local target = getClosestNPC()
		if target then
			local bodyPosition = target.HumanoidRootPart.Position
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, bodyPosition)

			-- Vẽ line từ tâm đến thân
			local screenPos, onScreen = Camera:WorldToViewportPoint(bodyPosition)
			if onScreen then
				line.Visible = true
				line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
				line.To = Vector2.new(screenPos.X, screenPos.Y)
			else
				line.Visible = false
			end
		else
			line.Visible = false
		end
	else
		line.Visible = false
	end
end)
end
function bruh()
-- Bật/Tắt Aimbot bằng biến toàn cục
_G.aimbothead = true

-- Dịch vụ cần dùng
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI vòng tròn giữa màn hình
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local circle = Instance.new("Frame", gui)
circle.Size = UDim2.new(0, 150, 0, 150)
circle.Position = UDim2.new(0.5, -75, 0.5, -75)
circle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
circle.BackgroundTransparency = 0.7

local corner = Instance.new("UICorner", circle)
corner.CornerRadius = UDim.new(1, 0)

-- Line từ tâm tới đầu NPC
local line = Drawing.new("Line")
line.Visible = false
line.Color = Color3.fromRGB(0, 255, 0)
line.Thickness = 2

-- Kiểm tra xem model có phải người chơi không
local function isPlayerModel(model)
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character == model then
			return true
		end
	end
	return false
end

-- Tìm NPC gần nhất trong vòng tròn
local function getClosestNPC()
	local closestDistance = 75
	local target = nil

	for _, npc in pairs(workspace:GetChildren()) do
		if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Head") and not isPlayerModel(npc) then
			local screenPoint, onScreen = Camera:WorldToViewportPoint(npc.Head.Position)
			if onScreen then
				local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
				if distance < closestDistance then
					closestDistance = distance
					target = npc
				end
			end
		end
	end

	return target
end

-- Aimbot loop
RunService.RenderStepped:Connect(function()
	if _G.aimbothead then
		local target = getClosestNPC()
		if target then
			local headPosition = target.Head.Position
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, headPosition)

			-- Vẽ đường từ tâm đến đầu
			local screenHead, onScreen = Camera:WorldToViewportPoint(headPosition)
			if onScreen then
				line.Visible = true
				line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
				line.To = Vector2.new(screenHead.X, screenHead.Y)
			else
				line.Visible = false
			end
		else
			line.Visible = false
		end
	else
		line.Visible = false
	end
end)
end
