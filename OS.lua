repeat task.wait() until game:IsLoaded()
wait(1)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CG = "b"
local AR = 25
local SACD = false
local SAT = false
local BRL = false
local Void_p1 = false
local Void_p2 = false
local looptp = false
local expt = "Roblox"
local offset = 1
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

loadstring(game:HttpGet("https://raw.githubusercontent.com/isaberjan420/ovb-bb-/refs/heads/main/Whitelist.lua"))()

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

local function Back_Position(Part, Studs)
    local Position = Part.Position
    local CFrame = Part.CFrame
    local Vector = -CFrame.LookVector
  
    local Output = Position + Vector * Studs
    return Output
end

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

local function loopgt()
    while wait() do
        if looptp == true then
            for _,v in pairs(Players:GetPlayers()) do
                if v.DisplayName == expt then
                    local a = (Back_Position(v.Character.PrimaryPart, -(offset)))
                    wait()
                    Players.LocalPlayer.Character:MoveTo(a)
                end
            end
        end
    end
end

local function whitelist()
    while task.wait(2) do
        loadstring(game:HttpGet("https://raw.githubusercontent.com/isaberjan420/ovb-bb-/refs/heads/main/Whitelist.lua"))()
        print("refreshed whitelist")
    end
end

local function Get_Closest_Player(Part)
    local closestPlayer = nil
    local minDistance = math.huge
  
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
      if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Humanoid").Health > 0 then
        if player.Name == Players.LocalPlayer.Name then
            task.wait()
        elseif IsSteve(player.Character) then
            task.wait()
            print("attempt to hit steve")
        elseif ragdolled(player.Character) then
            task.wait()
            print("attempt to hit ragdolled")
        elseif reversed(player.Character) then
            task.wait()
            print("attempt to hit reversed")
        elseif table.find(Whitelist, player.Name) then
            task.wait()
            print("attempt to hit whitelisted")
        elseif (Part.Position - player.Character.Head.Position).Magnitude > AR then
            task.wait()
            print("out of range")
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
   Options = {"Default","Killstreak"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
      if Options[1] == "Default" then
         CG = "b"
      elseif Options[1] == "Killstreak" then
         CG = "KSHit"      
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

local BR = SA:CreateToggle({
    Name = "Bypass Ragdoll",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        BRL = Value
    end,
 })

local Range = SA:CreateSlider({
   Name = "Aura Range",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 25,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         AR = Value
   end,
})

local Slap = SA:CreateKeybind({
   Name = "Slap",
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
        ReplicatedStorage:FindFirstChild(CG):FireServer(Get_Closest_Player(Players.LocalPlayer.Character.Head).Character.Head)
   end,
})

local Security = Window:CreateTab("Security", "shield")

local GP = Security:CreateSection("Void Protection")

local BR = Security:CreateToggle({
    Name = "Primary Layer",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Void_p1 = Value
    end,
 })

local BR0 = Security:CreateToggle({
    Name = "Secondary Layer",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        Void_p2 = Value
    end,
 })

local EC = Window:CreateTab("Exploiter Combat", "code")

local TargetName = EC:CreateInput({
   Name = "Target",
   CurrentValue = "",
   PlaceholderText = "Display Name",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
        expt = Text
   end,
})

local TSET = EC:CreateButton({
   Name = "Auto Pick Target",
   Callback = function()
        local a = Get_Closest_Player(Players.LocalPlayer.Character.Head)
        wait()
       TargetName:Set(a.DisplayName)
   end,
})

local Offset = EC:CreateSlider({
   Name = "Offset",
   Range = {0, 5},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        offset = Value
   end,
})

local ECTGL = EC:CreateToggle({
   Name = "Loop Teleport",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        looptp = Value
   end,
})

RunService.RenderStepped:Connect(function()
    if SACD == false then
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health < 1 then
            SACD = true
            wait(4)
            SACD = false
        else
            if ragdolled(Players.LocalPlayer.Character) then
                if BRL == true then
                    if SAT == true then
                        local a = Get_Closest_Player(Players.LocalPlayer.Character.Head)
                        wait()
                        ReplicatedStorage:FindFirstChild(CG):FireServer(a.Character.Head)
                        wait(0.3)
                        SACD = false
                    end
                end
            else
                if SAT == true then
                    SACD = true
                    local a = Get_Closest_Player(Players.LocalPlayer.Character.Head)
                    wait()
                    ReplicatedStorage:FindFirstChild(CG):FireServer(a.Character.Head)
                    wait(0.3)
                    SACD = false
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

local co1 = coroutine.create(whitelist)
local co1 = coroutine.create(loopgt)
wait(0.05)
coroutine.resume(co1)
coroutine.resume(co2)
