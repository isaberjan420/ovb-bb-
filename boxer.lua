if game.PlaceId == 7234087065 then
		firetouchinterest(game:GetService("Workspace").Buildings.house.TP, game.Players.LocalPlayer.Character.Torso, 1)
		firetouchinterest(game:GetService("Workspace").Buildings.house.TP, game.Players.LocalPlayer.Character.Torso, 0)
		wait(2)
		fireclickdetector(workspace.BoxingGloves.ClickDetector)
return
end

local function swait()
	game:GetService("RunService").Stepped:wait()
end
local Lobby, GlovesStand, RegularPortal = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DonjoScripts/General-SB-/refs/heads/SlapBattles/SlapBattles-PartsName.lua'),true))()

local function PlrHasGlove(Name)
	if game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("_unlockedGloves") then
		if game.Players.LocalPlayer._unlockedGloves:FindFirstChild(Name) and game.Players.LocalPlayer._unlockedGloves:FindFirstChild(Name).Value == true then
			return true
		end
	end
	return false
end

if not PlrHasGlove("Boxer") then
		game:GetService("TeleportService"):Teleport(7234087065)
	return 
end



	if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Boxer" then
		fireclickdetector(Lobby.Boxer.ClickDetector)
	end
	
	
	spawn(function()
		for i = 1,30 do
			for i,p in pairs(game.Players:GetPlayers()) do
				while true do
					spawn(function()
					local args = {
					    [1] = p,
					    [2] = false
					}
					
					game:GetService("ReplicatedStorage").Events.Boxing:FireServer(unpack(args))
					local args = {
					    [1] = p,
					    [2] = true
					}
					
					game:GetService("ReplicatedStorage").Events.Boxing:FireServer(unpack(args))
					end)
					swait()
				end
				wait()
			end
		end
	end)
