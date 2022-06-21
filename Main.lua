local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "TankzHub", HidePremium = false, SaveConfig = true, ConfigFolder = "TankzConfig", IntroEnabled = true, IntroText = "TankzHub"})
OrionLib:MakeNotification({
	Name = "Buy Premium At: tankzhub.xyz!",
	Content = "tankzhub.xyz",
	Image = "rbxassetid://4483345998",
	Time = 5
})
local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Server = Window:MakeTab({
	Name = "Server (P)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Player"
})
local Section2 = Server:AddSection({
	Name = "Server"
})
Tab:AddButton({
	Name = "God Mode",
	Callback = function()
	        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 1000000
      		game.Players.LocalPlayer.Character.Humanoid.Health = 1000000
  	end    
})

Tab:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end    
})

Tab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
	    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		 print(Value)
	end    
})

Tab:AddTextbox({
	Name = "Bring Player",
	Default = "Username",
	TextDisappear = true,
	Callback = function(Value)
	    local plr = game.Players:FindFirstChild(Value)
	    if plr then
	        plr.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		else
		    print("Player does not exist!")
		end
		print(Value)
	end	  
})


Tab:AddTextbox({
	Name = "Teleport to Player",
	Default = "Username",
	TextDisappear = true,
	Callback = function(Value)
	    local plr = game.Players.LocalPlayer
	    if plr then
	        plr.Character.HumanoidRootPart.CFrame = Value.Character.HumanoidRootPart.CFrame
		else
		    print("Player does not exist!")
		end
		print(Value)
	end	  
})

Tab:AddBind({
	Name = "Fast Leave",
	Default = Enum.KeyCode.RightControl,
	Hold = false,
	Callback = function()
		game.Players.LocalPlayer:Kick("Client Wanted to disconnect session!")
	end    
})

Server:AddBind({
	Name = "Crash Server",
	Default = Enum.KeyCode.RightAlt,
	Hold = false,
	Callback = function()
	    while true do
		    local Part = Instance.new("Part", workspace)
		    wait(.2)
		end
	end    
})

Server:AddTextbox({
	Name = "Kick Player",
	Default = "Username",
	TextDisappear = true,
	Callback = function(Value)
        local User = game.Players:FindFirstChild(Value)
        
        if User then
            User:Kick("Do NOT Exploit in any game, you are Now banned until 12/31/2030.")
	    else
	        warn("User not found!")
	    end
	end    
})
