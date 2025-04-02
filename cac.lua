local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:FindFirstChildOfClass('PlayerGui')
 
local customFrame = Instance.new("Frame")
customFrame.Parent = screenGui
customFrame.Size = UDim2.new(0, 500, 0, 290)
customFrame.Position = UDim2.new(0.3, -100, 0, 0)
customFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 5)
corner.Parent = customFrame
 
customFrame.BackgroundTransparency = 0
 
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 55, 0, 55)
toggleButton.Position = UDim2.new(0.5, -150, 0, -57)
toggleButton.Image = "rbxthumb://type=Asset&id=103543330691482&w=420&h=420"
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui
 
local cornerButton = Instance.new("UICorner")
cornerButton.CornerRadius = UDim.new(0, 10)
cornerButton.Parent = toggleButton
 
local frameVisible = true
 
toggleButton.MouseButton1Click:Connect(function()
    if frameVisible then
        customFrame.Visible = false
    else
        customFrame.Visible = true
    end
    frameVisible = not frameVisible
end)

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Parent = customFrame
scrollingFrame.Size = UDim2.new(0, 500, 0, 290)
scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

scrollingFrame.ScrollBarThickness = 0

local cornerButton = Instance.new("UICorner")
cornerButton.CornerRadius = UDim.new(0, 5)
cornerButton.Parent = scrollingFrame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 490, 0, 50)
button.Position = UDim2.new(0, 5, 0, 50)
button.Text = "Auto Teleport Status: Off"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 24
button.Font = Enum.Font.GothamBold
button.Parent = scrollingFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = button

local isOn = false

local function toggle()
    if isOn then
        button.Text = "Auto Teleport Status: Off"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        isOn = false
        print("Off")
    else
        button.Text = "Auto Teleport Status: On"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        isOn = true
        print("On")
        while isOn do
            wait(1)
            
 local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local newPosition = Vector3.new(-346, -69, -49060) -- Tọa độ đích
if character then
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Dịch chuyển ngay lập tức
    humanoidRootPart.CFrame = CFrame.new(newPosition)
end
        end
    end
end

button.MouseButton1Click:Connect(toggle)
