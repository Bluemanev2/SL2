 --// Settings 
 getgenv().settings = {
A = false, 
B = false,
C = false, 
D = false 
}
    
--// Services 
local Players = game:GetService("Players")
local Player = game:GetService("Players").LocalPlayer
local workspace = game:GetService("Workspace")

--// Variables
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Decal
local Value
local Index
local clickdetector

--// Function A
function A()
local Character = LocalPlayer.Character
while getgenv().settings.A == true do  
for index, value in pairs(workspace.SpillSystem:GetChildren()) do
    if value.Name ~= "Script" and value:IsA("Part") and value:FindFirstChild("Decal") then 
        Decal = value:FindFirstChild("Decal")
            if Decal.Transparency <= 0 then
                local Humanoid = Character:WaitForChild("Humanoid")
                clickdetector = value:FindFirstChild("ClickDetector")
                Humanoid.WalkSpeed = 10
                Humanoid:MoveTo(value.Position)
                Humanoid.MoveToFinished:wait()
                fireclickdetector(clickdetector, 10)
            task.wait()
        end
    end
end
Decal:GetPropertyChangedSignal("Transparency"):Connect(function()
    if Decal.Transparency <= 0 then
        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                Humanoid.WalkSpeed = 10
                Humanoid:MoveTo(Decal.Position)
                Humanoid.MoveToFinished:wait()
                fireclickdetector(clickdetector, 10)
            end
        end)  
    end  
end

--// Function B
function B()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().settings.B == true then
            for index,value in pairs(Player.Character:GetDescendants()) do
                if value:IsA("BasePart") and value.CanCollide == true then
                    value.CanCollide = false 
                end
            end
        end
    end)
end
    
--// Function C
function C()
pcall(function()
    while task.wait() do 
        if not getgenv().settings.C then break end 
            game:GetService("Players").LocalPlayer.PlayerGui.Run.Value.Value = true
            game.Players.LocalPlayer.Character.Resistance.Value = true
            game:GetService("Workspace").LocalPlayer.Resistance = true
        end
    end) 
end 

--// function D 
function D()
    if getgenv().settings.D == true then 
            game:GetService"RunService".RenderStepped:Connect(function()
            game.Players.LocalPlayer.Valuestats.Stamina.Value = 100
        end)
    end
end

--// Game ID
if game.PlaceId == 4779613061 then 
    
--// UI Library 
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

--// UI Window 
local Window = OrionLib:MakeWindow({Name = "PRIVATE SL2 HUB", HidePremium = true, IntroEnabled = false,IntroText = "SL2 HUB", SaveConfig = true, ConfigFolder = "OrionTest"})


---// Window Tab 
local ATab = Window:MakeTab({
Name = "AUTO FARM",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

---// Window Tab 
local BTab = Window:MakeTab({
Name = "MISC",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

--// Important Notifcation 
OrionLib:MakeNotification({
Name = "IN BETA",
Content = "CK^^",
Image = "rbxassetid://4483345998",
Time = 5
})

--// Farm Tab
ATab:AddToggle({
Name = "AUTO FARM",
Default = false,
Callback = function(Value)
getgenv().settings.A = Value
A()
end    
})

--// Farm Tab
ATab:AddToggle({
Name = "NO CLIP",
Default = false,
Callback = function(Value)
getgenv().settings.B = Value
B()
end    
})

--// Farm Tab
BTab:AddToggle({
Name = "INFINITE SKITTLES",
Default = false,
Callback = function(Value)
getgenv().settings.C = Value
C()
end    
})

--// Farm Tab
BTab:AddToggle({
Name = "INFINITE STAMINA",
Default = false,
Callback = function(Value)
getgenv().settings.D = Value
D()
end    
})

end
OrionLib:Init()
