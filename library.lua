--// Admin Command Library
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- Global command table
getgenv().Commands = getgenv().Commands or {}

--// ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LP:WaitForChild("PlayerGui")

-- Command List UI
local CmdTopbar = Instance.new("Frame", ScreenGui)
CmdTopbar.Name = "CommandsListTopbar"
CmdTopbar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CmdTopbar.Size = UDim2.new(0, 300, 0, 40)
CmdTopbar.Position = UDim2.new(0.7, 0, 0.3, 0)

local Title = Instance.new("TextLabel", CmdTopbar)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Commands"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

local CmdList = Instance.new("Frame", CmdTopbar)
CmdList.Name = "CommandsList"
CmdList.BackgroundTransparency = 1
CmdList.Size = UDim2.new(1, 0, 0, 250)
CmdList.Position = UDim2.new(0, 0, 1, 0)

local UIListLayout = Instance.new("UIListLayout", CmdList)
UIListLayout.Padding = UDim.new(0, 3)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Notification UI
local NotiFrame = Instance.new("Frame", ScreenGui)
NotiFrame.Name = "Notification"
NotiFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
NotiFrame.Size = UDim2.new(0, 250, 0, 100)
NotiFrame.Position = UDim2.new(1, 0, 0.8, 0)
NotiFrame.BorderSizePixel = 0
NotiFrame.Visible = false

local NotiTitle = Instance.new("TextLabel", NotiFrame)
NotiTitle.Size = UDim2.new(1,0,0,25)
NotiTitle.BackgroundTransparency = 1
NotiTitle.Font = Enum.Font.SourceSansBold
NotiTitle.TextSize = 18
NotiTitle.TextColor3 = Color3.fromRGB(255,255,255)

local NotiText = Instance.new("TextLabel", NotiFrame)
NotiText.Size = UDim2.new(1,-10,1,-30)
NotiText.Position = UDim2.new(0,5,0,30)
NotiText.BackgroundTransparency = 1
NotiText.TextWrapped = true
NotiText.Font = Enum.Font.SourceSans
NotiText.TextSize = 16
NotiText.TextColor3 = Color3.fromRGB(200,200,200)

--// Library
local Library = {}
Library.Prefix = ";" -- default prefix for chat commands

-- Create Command
function Library.CreateCMD(Name, Description, Callback)
	-- Save to global command registry
	getgenv().Commands[Name:lower()] = {
		Description = Description,
		Callback = Callback
	}

	-- Add to GUI list
	local Btn = Instance.new("TextButton", CmdList)
	Btn.Size = UDim2.new(1,-10,0,25)
	Btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
	Btn.BorderSizePixel = 0
	Btn.Text = Name .. " - " .. Description
	Btn.Font = Enum.Font.SourceSansBold
	Btn.TextColor3 = Color3.fromRGB(255,255,255)
	Btn.TextSize = 16
	Btn.AutoButtonColor = true

	Btn.MouseButton1Click:Connect(function()
		if Callback then
			Callback()
		end
	end)
end

-- Notification
function Library.CreateNotification(TitleText, BodyText, Duration)
	NotiTitle.Text = TitleText
	NotiText.Text = BodyText
	NotiFrame.Visible = true

	local tweenIn = TweenService:Create(NotiFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.7,0,0.8,0)
	})
	tweenIn:Play()
	tweenIn.Completed:Wait()

	task.wait(Duration or 2)

	local tweenOut = TweenService:Create(NotiFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Position = UDim2.new(1,0,0.8,0)
	})
	tweenOut:Play()
	tweenOut.Completed:Wait()
	NotiFrame.Visible = false
end

-- Chat Listener
LP.Chatted:Connect(function(msg)
	if msg:sub(1,1) == Library.Prefix then
		local split = msg:sub(2):split(" ")
		local cmdName = split[1]:lower()
		table.remove(split,1) -- remove command name from args
		local args = split

		local cmd = getgenv().Commands[cmdName]
		if cmd then
			cmd.Callback(unpack(args))
		end
	end
end)

return Library
