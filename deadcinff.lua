local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "M-BANANA HUB",
   LoadingTitle = "Deep Hub",
   LoadingSubtitle = "by Oibaka",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Example Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key | M-Banana Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"DctlG3A7JoCo6KZQzI705XcccsEZdo2GebJ", "KcCyUwav8XUISMgPUbY5kt5PRpMH3KUwYGI", "8ajdh-glxee-lkrov-hevam-0vpin"}
   }
})

local MainTab = Window:CreateTab("Config", nil)

local Button = MainTab:CreateButton({
   Name = " Config DeadRail",
   Callback = function()
   -- The function that takes place when the button is pressed
local DarkraiX = loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrooi/bananahub/refs/heads/main/Darkrai%20Ui%20(1).txt", true))()

local Library = DarkraiX:Window("M-Banana","","",Enum.KeyCode.RightControl);

Tab1 = Library:Tab("Esp")
Tab2 = Library:Tab("Setting")
Tab3 = Library:Tab("Comlect")

Tab1:Seperator("Esp - User - Mob - Item")

Tab1:Toggle("Esp User - Player",false,function(value)
-- Preview: https://cdn.discordapp.com/attachments/807887111667056680/820258191224340490/chams.png
-- Made by Blissful#4992
local Settings = {
    TeamCheck = true, -- Overules Color
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Color = Color3.fromRGB(255, 0, 0),
    TeamColor = false
}

--// Locals
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()

local function NewQuad(color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = true
    quad.Thickness = 1
    quad.Transparency = 0.25
    return quad
end

local function Colorize(color, lib)
    for i, v in pairs(lib) do
        v.Color = color
    end
end

local function ESP(object, plr)
    local part = object
    --// Quads for 3D box (6)
    local quads = {
        quad1 = NewQuad(Settings.Color),
        quad2 = NewQuad(Settings.Color),
        quad3 = NewQuad(Settings.Color),
        quad4 = NewQuad(Settings.Color),
        quad5 = NewQuad(Settings.Color),
        quad6 = NewQuad(Settings.Color)
    }

    --// Updates ESP in render loop
    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild(object.Name) ~= nil then
                    local partpos, onscreen = camera:WorldToViewportPoint(part.Position)
                    if onscreen then
                        local size_X = part.Size.X/2
                        local size_Y = part.Size.Y/2
                        local size_Z = part.Size.Z/2
                        
                        local Top1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, -size_Z)).p)
                        local Top2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, size_Y, size_Z)).p)
                        local Top3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, size_Z)).p)
                        local Top4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, size_Y, -size_Z)).p)
    
                        local Bottom1 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, -size_Z)).p)
                        local Bottom2 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(-size_X, -size_Y, size_Z)).p)
                        local Bottom3 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, size_Z)).p)
                        local Bottom4 = camera:WorldToViewportPoint((part.CFrame * CFrame.new(size_X, -size_Y, -size_Z)).p)
    
                        --// Top:
                        quads.quad1.PointA = Vector2.new(Top1.X, Top1.Y)
                        quads.quad1.PointB = Vector2.new(Top2.X, Top2.Y)
                        quads.quad1.PointC = Vector2.new(Top3.X, Top3.Y)
                        quads.quad1.PointD = Vector2.new(Top4.X, Top4.Y)
    
                        --//Bottom:
                        quads.quad2.PointA = Vector2.new(Bottom1.X, Bottom1.Y)
                        quads.quad2.PointB = Vector2.new(Bottom2.X, Bottom2.Y)
                        quads.quad2.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                        quads.quad2.PointD = Vector2.new(Bottom4.X, Bottom4.Y)
    
                        --//Sides:
                        quads.quad3.PointA = Vector2.new(Top1.X, Top1.Y)
                        quads.quad3.PointB = Vector2.new(Top2.X, Top2.Y)
                        quads.quad3.PointC = Vector2.new(Bottom2.X, Bottom2.Y)
                        quads.quad3.PointD = Vector2.new(Bottom1.X, Bottom1.Y)
                        
                        quads.quad4.PointA = Vector2.new(Top2.X, Top2.Y)
                        quads.quad4.PointB = Vector2.new(Top3.X, Top3.Y)
                        quads.quad4.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
                        quads.quad4.PointD = Vector2.new(Bottom2.X, Bottom2.Y)
                        
                        quads.quad5.PointA = Vector2.new(Top3.X, Top3.Y)
                        quads.quad5.PointB = Vector2.new(Top4.X, Top4.Y)
                        quads.quad5.PointC = Vector2.new(Bottom4.X, Bottom4.Y)
                        quads.quad5.PointD = Vector2.new(Bottom3.X, Bottom3.Y)
    
                        quads.quad6.PointA = Vector2.new(Top4.X, Top4.Y)
                        quads.quad6.PointB = Vector2.new(Top1.X, Top1.Y)
                        quads.quad6.PointC = Vector2.new(Bottom1.X, Bottom1.Y)
                        quads.quad6.PointD = Vector2.new(Bottom4.X, Bottom4.Y)
    
                        if Settings.Team_Check then
                            if plr.TeamColor == player.TeamColor then
                                local group_color = Settings.Green
                                Colorize(group_color, quads)
                            else 
                                local group_color = Settings.Red
                                Colorize(group_color, quads)
                            end
                        else 
                            local group_color = Settings.Color
                            Colorize(group_color, quads)
                        end

                        if Settings.TeamColor then
                            Colorize(plr.TeamColor.Color, quads)
                        end
    
                        for u, x in pairs(quads) do
                            x.Visible = true
                        end
                    else 
                        for u, x in pairs(quads) do
                            x.Visible = false
                        end
                    end
            else 
                for u, x in pairs(quads) do
                    x.Visible = false
                end
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    spawn(function()
        if v.Name ~= player.Name then
            repeat wait() until v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil
            for u, x in pairs(v.Character:GetChildren()) do
                if x:IsA("MeshPart") or x.Name == "Head" or x.Name == "Left Arm" or x.Name == "Right Arm" or x.Name == "Right Leg" or x.Name == "Left Leg" or x.Name == "Torso" then
                    coroutine.wrap(ESP)(x, v)
                end
            end
        end
    end)
end

game.Players.PlayerAdded:Connect(function(newplr)
    spawn(function()
        if newplr.Name ~= player.Name then
            repeat wait() until newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil
            for u, x in pairs(newplr.Character:GetChildren()) do
                if x:IsA("MeshPart") or x.Name == "Head" or x.Name == "Left Arm" or x.Name == "Right Arm" or x.Name == "Right Leg" or x.Name == "Left Leg" or x.Name == "Torso" then
                    coroutine.wrap(ESP)(x, newplr)
                end
            end
        end
    end)
end)
    end)

Tab1:Toggle("Esp Mob",false,function(value)

    end)
Tab1:Toggle("Esp Item",false,function(value)

    end)
Tab1:Line()
Tab2:Seperator("Bypass Setting")

Tab2:Toggle("Bypass Teleport",true,function(value)
print(value)
    end)


Tab2:Toggle("Bypass Tween",false,function(value)
print(value)
    end)

Tab2:Seperator(" Comlect Setting")


Tab2:Toggle("Comlect Bring Mob",true,function(value)
print(value)
    end)


Tab2:Toggle("Comlect Fix Error",false,function(value)
print(value)
    end)
Tab2:Toggle("Comlect Fix Teleport",false,function(value)
print(value)
    end)
Tab2:Toggle("Comlect Fix All Error",false,function(value)
print(value)
    end)

Tab2:Seperator("Config Range")

Tab2:Slider("Range Comlect",1,1,0,function(value)
        print(value)
    end)

Tab2:Seperator("Antiban")
Tab2:Toggle("Comlect Bypass ANTIBAN",true,function(value)
print(value)
    end)

Tab2:Toggle("Antiban v2 [ Premium ]",false,function(value)
print(value)
    end)
Tab3:Seperator("Comlect")
Tab3:Toggle("Comlect Pound",false,function(value)

    end)

Tab3:Toggle("Comlect Newspaper",false,function(value)
print(value)
    end)

Tab3:Toggle("Comlect Charcoal",false,function(value)
print(value)
    end)
end,
})
