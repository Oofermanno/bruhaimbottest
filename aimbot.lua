local on = true
local UIS = game.UserInputService
-- Gui to Lua
-- Version: 3.2

-- Instances:


local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local targeting = Instance.new("TextLabel")
local viewportshow = Instance.new("ViewportFrame")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.874867439, 0, 0.430534363, 0)
TextLabel.Size = UDim2.new(0, 230, 0, 50)
TextLabel.Font = Enum.Font.Roboto
TextLabel.Text = "STATUS: TRUE"
TextLabel.TextColor3 = Color3.fromRGB(249, 120, 55)
TextLabel.TextSize = 22.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.Position = UDim2.new(0.943796396, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.ZIndex = 300000000
ImageLabel.Image = "http://www.roblox.com/asset/?id=6652785273"
ImageLabel.ImageTransparency = 0.300

targeting.Name = "targeting"
targeting.Parent = ScreenGui
targeting.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targeting.BackgroundTransparency = 1.000
targeting.Position = UDim2.new(0.874867439, 0, 0.335877895, 0)
targeting.Size = UDim2.new(0, 230, 0, 50)
targeting.Font = Enum.Font.Roboto
targeting.Text = "TARGETING:"
targeting.TextColor3 = Color3.fromRGB(249, 120, 55)
targeting.TextSize = 18.000
targeting.TextWrapped = true
targeting.TextXAlignment = Enum.TextXAlignment.Left

viewportshow.BackgroundTransparency = 1.000
viewportshow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
viewportshow.Name = "viewportshow"
viewportshow.Parent = ScreenGui
viewportshow.Position = UDim2.new(0.874867439, 0, 0.50687027, 0)
ScreenGui.ResetOnSpawn = false
local viewportcamera = Instance.new("Camera")
viewportcamera.CameraType = Enum.CameraType.Scriptable
local viewportpoint = Vector3.new(0,0,0)
viewportshow.CurrentCamera = viewportcamera
local viewmod = nil
print("Script Hooked")
function getClosestVisible()
    print("doing")
    local closestDist = math.huge
    local closestPlayer = nil
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team and v.Team ~= "Neutral" then
            if v.Character and v.Character.Humanoid and v.Character.Humanoid.Health > 0 then
            print(v.Name)
            print("Check 1")
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            print(dist)
            if dist < closestDist then
                print("Check 2")
closetDist = dist
closestPlayer = v
          targeting.Text = "TARGETING: "..v.Name

       print("bro")
    --    if hitPart.Parent.Name == v.Name then
        print("Finished Checking, Meets All Requirements!")


            end
        end
    end
    end
    return closestPlayer
end

    UIS.InputBegan:Connect(function(input,gameProcessed)
        
if input.UserInputType == Enum.UserInputType.MouseButton2 then
    print("bruh")

    _G.aim = true
 
    while wait() do
       
        TextLabel.Text = "STATUS: "..tostring(_G.aim)

        local CurrentCamera = game.workspace.CurrentCamera

CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position,getClosestVisible().Character.Head.Position)
local closestPlayer = nil
if _G.aim == false then return end
    
    end
    end
    end)

    UIS.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton2 then
    print("unbruh")
    
_G.aim = false
TextLabel.Text = "STATUS: "..tostring(_G.aim)
end


    end)
