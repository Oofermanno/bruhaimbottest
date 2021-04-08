local on = true
local UIS = game.UserInputService
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.890774131, 0, 0.905343533, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Roboto
TextLabel.Text = "STATUS: unknown"
TextLabel.TextColor3 = Color3.fromRGB(249, 120, 55)
TextLabel.TextSize = 22.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.ZIndex = 300000000
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.Position = UDim2.new(0.943796396, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.ZIndex = 300000000
ImageLabel.Image = "http://www.roblox.com/asset/?id=6652785273"
ImageLabel.ImageTransparency = 0.300
ScreenGui.ResetOnSpawn = false
print("Script Injected")
function getClosestVisible()
    print("doing")
    local closestDist = math.huge
    local closestPlayer = nil
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
            print(v.Name)
            print("Check 1")
            local dist = (game.Players.LocalPlayer.Character.Head.Position - v.Character.HumanoidRootPart.Position).magnitude
            print(dist)
            if dist < closestDist then
                print("Check 2")
closetDist = dist
           
          
       print("bro")
    --    if hitPart.Parent.Name == v.Name then
        print("Finished Checking, Meets All Requirements!")
closestPlayer = v
    return closestPlayer
      ---  end
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
