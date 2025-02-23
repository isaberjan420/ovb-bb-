repeat task.wait() until game:IsLoaded()
wait(1)
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CG = "b"
local AR = 25
local SACD = false
local SAT = false
local BRL = false
local Link_p = false
local OVERKILL_p = false
local Flex_p = false
local Void_p1 = false
local Void_p2 = false
local AF = false
local Delay = 0.91
local AT = false
local WL= {"themagewizard2", "someone_w0w", "missayla86"}
local T = {
    TextColor = Color3.fromRGB(192, 192, 192),

    Background = Color3.fromRGB(18, 18, 18),
    Topbar = Color3.fromRGB(32, 32, 32),
    Shadow = Color3.fromRGB(0, 0, 0),

    NotificationBackground = Color3.fromRGB(20, 20, 20),
    NotificationActionsBackground = Color3.fromRGB(128, 128, 128),

    TabBackground = Color3.fromRGB(80, 80, 80),
    TabStroke = Color3.fromRGB(85, 85, 85),
    TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
    TabTextColor = Color3.fromRGB(240, 240, 240),
    SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

    ElementBackground = Color3.fromRGB(35, 35, 35),
    ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
    SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
    ElementStroke = Color3.fromRGB(50, 50, 50),
    SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            
    SliderBackground = Color3.fromRGB(16, 16, 16),
    SliderProgress = Color3.fromRGB(16, 192, 16),
    SliderStroke = Color3.fromRGB(0, 0, 0),

    ToggleBackground = Color3.fromRGB(30, 30, 30),
    ToggleEnabled = Color3.fromRGB(0, 146, 214),
    ToggleDisabled = Color3.fromRGB(100, 100, 100),
    ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
    ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
    ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
    ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

    DropdownSelected = Color3.fromRGB(40, 40, 40),
    DropdownUnselected = Color3.fromRGB(30, 30, 30),

    InputBackground = Color3.fromRGB(30, 30, 30),
    InputStroke = Color3.fromRGB(65, 65, 65),
    PlaceholderColor = Color3.fromRGB(178, 178, 178)
}

local Layer1 = Instance.new("Part", workspace)
local Layer2 = Instance.new("Part", workspace)
Layer1.Anchored = true
Layer2.Anchored = true
Layer1.Position = Vector3.new(0, -20, 0)
Layer1.Size = Vector3.new(2048, 4, 2048)
Layer1.Material = Enum.Material.ForceField
Layer2.Position = Vector3.new(0, -30, 0)
Layer2.Size = Vector3.new(2048, 4, 2048)
Layer2.Material = Enum.Material.ForceField
Layer2.Color = Color3.new(0, 1, 0)
Layer2.Parent = ReplicatedStorage
Layer1.Parent = ReplicatedStorage

Layer2.Touched:Connect(function(a)
    if a.Parent.Name == Players.LocalPlayer.Name then
        Players.LocalPlayer.Character:MoveTo(Vector3.new(math.random(-90, 90), 50, math.random(-90, 90)))
    end 
end)

local function ragdolled(character)
    local r = false
    for i,v in pairs(character:GetChildren()) do
        if string.sub(v.Name, 1, 4) == "Fake" then
            r = true
        end
    end
    return r
end

local function reversed(character)
    local a = false
    for i,v in pairs(character:GetChildren()) do
        if v.Name == "Reversed" then
            a = true
        end
    end
    return a
end

local function IsSteve(character)
    local a = false
    for i,v in pairs(character:GetChildren()) do
        if v.Name == "stevebody" then
            a = true
        end
    end
    return a
end

local function Get_Closest_Player(Part)
    local closestPlayer = nil
    local minDistance = math.huge
  
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
      if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Humanoid").Health > 1 and Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 1 then
        if player.Name == Players.LocalPlayer.Name then
            task.wait()
        elseif player.Name == "imHDsaucer" then
            task.wait()
            print("attempt to hit steve")
        elseif player.Name == "missayla86" then
            task.wait()
            print("attempt to hit steve")
        elseif table.find(WL, player.Name) then
            task.wait()
            print("attempt to hit steve")
        elseif IsSteve(player.Character) then
            task.wait()
            print("attempt to hit steve")
        elseif ragdolled(player.Character) then
            task.wait()
            print("attempt to hit ragdolled")
        elseif reversed(player.Character) then
            task.wait()
            print("attempt to hit reversed")
        else
            local distance = (Part.Position - player.Character.Head.Position).Magnitude -- Calculate distance
            if distance < minDistance then -- Check if closer than current closest
                minDistance = distance -- Update minimum distance
                closestPlayer = player -- Update closest player
            end
        end
      end
    end
  
    return closestPlayer
end

local Window = Rayfield:CreateWindow({
   Name = "Celerity",
   Icon = "crown", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Celerity",
   LoadingSubtitle = "By Celerity",
   Theme = T, -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Celerity"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "de7SVVyF3e", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Celerity",
      Subtitle = "Key System",
      Note = "You Can Buy A Custom Key To The Script From Our Server", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"JanetLava862_IBY"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local SA = Window:CreateTab("Slap Aura", "swords")

local GP = SA:CreateSection("Glove Picker")

local Picker = SA:CreateDropdown({
   Name = "Available Gloves",
   Options = {"Default", "Extended", "Snow", "Squid", "Reaper", "Killstreak", "Orbit"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
      if Options[1] == "Default" then
         CG = "b"
         Delay = 0.91
        elseif Options[1] == "Extended" then
         CG = "b"
         Delay = 0.82
        elseif Options[1] == "Snow" then
         CG = "SnowHit"
         Delay = 0.65
        elseif Options[1] == "Squid" then
         CG = "GeneralHit"
         Delay = 0.56
        elseif Options[1] == "Reaper" then
         CG = "ReaperHit"
         Delay = 0.7
        elseif Options[1] == "Killstreak" then
         CG = "KSHit" 
         Delay = 0.6
        elseif Options[1] == "Orbit" then
         CG = "Orbihit"
         Delay = 0.56
        end
    end,
})

local AC = SA:CreateSection("Aura Customization")

local AT = SA:CreateToggle({
    Name = "Slap Aura",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        SAT = Value
    end,
 })

local Range = SA:CreateSlider({
   Name = "Aura Range",
   Range = {0, 20},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 20,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         AR = Value
   end,
})

local BR = SA:CreateToggle({
    Name = "Bypass Ragdoll",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        BRL = Value
    end,
 })

local Security = Window:CreateTab("Security", "shield")

local GP = Security:CreateSection("Glove Protection")

local BR = Security:CreateToggle({
    Name = "OVERKILL",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        OVERKILL_p = Value
        wait()
        for _,v in pairs(Players:GetPlayers()) do
            if v.Name == Players.LocalPlayer.Name then
                task.wait()
            else
                if v.leaderstats.Glove == "OVERKILL" then
                    if OVERKILL_p == true then
                        local boz = Instance.new("Part", workspace)
                        boz.Anchored = true
                        boz.Size = Vector3.new(15, 15, 15)
                        boz.Material = Enum.Material.ForceField
                        boz.Name = "overboz"..v.Name
                        RunService.RenderStepped:Connect(function()
                            boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                        end)
                    elseif OVERKILL_p == false then
                        for _,b in pairs(workspace:GetChildren()) do
                            if string.sub(b.Name, 1, 7) == "overboz" then
                                b:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end,
 })

local BR = Security:CreateToggle({
    Name = "Link",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Link_p = Value
        wait()
        for _,v in pairs(Players:GetPlayers()) do
            if v.Name == Players.LocalPlayer.Name then
                task.wait()
            else
                if v.leaderstats.Glove == "Link" then
                    if Link_p == true then
                        local boz = Instance.new("Part", workspace)
                        boz.Anchored = true
                        boz.Size = Vector3.new(15, 15, 15)
                        boz.Material = Enum.Material.ForceField
                        boz.Name = "linkboz"..v.Name
                        RunService.RenderStepped:Connect(function()
                            boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                        end)
                    elseif Link_p == false then
                        for _,b in pairs(workspace:GetChildren()) do
                            if string.sub(b.Name, 1, 7) == "linkboz" then
                                b:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end,
 })

local BR = Security:CreateToggle({
    Name = "The Flex",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Flex_p = Value
        wait()
        for _,v in pairs(Players:GetPlayers()) do
            if v.Name == Players.LocalPlayer.Name then
                task.wait()
            else
                if v.leaderstats.Glove == "The Flex" then
                    if Flex_p == true then
                        local boz = Instance.new("Part", workspace)
                        boz.Anchored = true
                        boz.Size = Vector3.new(15, 15, 15)
                        boz.Material = Enum.Material.ForceField
                        boz.Name = "flexboz"..v.Name
                        RunService.RenderStepped:Connect(function()
                            boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                        end)
                    elseif Flex_p == false then
                        for _,b in pairs(workspace:GetChildren()) do
                            if string.sub(b.Name, 1, 7) == "flexboz" then
                                b:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end,
 })

local GP = Security:CreateSection("Void Protection")

local BR = Security:CreateToggle({
    Name = "Primary Layer",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Void_p1 = Value
    end,
 })

local BR = Security:CreateToggle({
    Name = "Secondary Layer",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Void_p2 = Value
    end,
 })

local function test()
    print(Get_Closest_Player(Players.LocalPlayer.Character.Head).Character.Head.Name)
end

local function check()
    local a = false
    local success, result = pcall(test)
    if success then
        a = true
    end

    return a
end
RunService.RenderStepped:Connect(function()
    if SACD == false then
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health < 1 then
            SACD = true
            wait(5)
            SACD = false
        else
            if ragdolled(Players.LocalPlayer.Character) then
                if BRL == true then
                    if SAT == true then
                        if check() == true then
                            SACD = true
                            ReplicatedStorage:FindFirstChild(CG):FireServer(Get_Closest_Player(Players.LocalPlayer.Character.Head).Character.Head)
                            task.wait(Delay + 0.05)
                            SACD = false
                        end
                    end
                end
            else
                if SAT == true then
                    if check() == true then
                        SACD = true
                        ReplicatedStorage:FindFirstChild(CG):FireServer(Get_Closest_Player(Players.LocalPlayer.Character.Head).Character.Head)
                        wait(Delay + 0.05)
                        SACD = false
                    end
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Void_p1 == true then
        Layer1.Parent = workspace
    elseif Void_p1 == false then
        Layer1.Parent = ReplicatedStorage
    end
end)

RunService.RenderStepped:Connect(function()
    if Void_p2 == true then
        Layer2.Parent = workspace
    elseif Void_p2 == false then
        Layer2.Parent = ReplicatedStorage
    end
end)

Players.PlayerAdded:Connect(function(v)
    if v.Name == Players.LocalPlayer.Name then
        task.wait()
    else
        wait(1)
        if v.leaderstats.Glove == "The Flex" then
            if Flex_p == true then
                local boz = Instance.new("Part", workspace)
                boz.Anchored = true
                boz.Size = Vector3.new(15, 15, 15)
                boz.Material = Enum.Material.ForceField
                boz.Name = "flexboz"..v.Name
                RunService.RenderStepped:Connect(function()
                    boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                end)
            end
        elseif v.leaderstats.Glove == "OVERKILL" then
            if OVERKILL_p == true then
                local boz = Instance.new("Part", workspace)
                boz.Anchored = true
                boz.Size = Vector3.new(15, 15, 15)
                boz.Material = Enum.Material.ForceField
                boz.Name = "overboz"..v.Name
                RunService.RenderStepped:Connect(function()
                    boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                end)
            end
        elseif v.leaderstats.Glove == "Link" then
            if Link_p == true then
                local boz = Instance.new("Part", workspace)
                boz.Anchored = true
                boz.Size = Vector3.new(15, 15, 15)
                boz.Material = Enum.Material.ForceField
                boz.Name = "linkboz"..v.Name
                RunService.RenderStepped:Connect(function()
                    boz.Position = v.Character:FindFirstChildWhichIsA("Part").Position
                end)
            end
        end
    end
end)

Rayfield:Notify({
   Title = "Celerity",
   Content = "Successfully Loaded, Enjoy!",
   Duration = 5,
   Image = "check",
})
