local MM2Admin = {}

-- Services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Main GUI
local Script = Instance.new("ScreenGui")
Script.Name = "MM2Admin"
Script.Parent = game:GetService("CoreGui")
Script.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create the base UI elements (your existing code)
local CommandEntry = Instance.new("Frame")
local InputBox = Instance.new("TextBox")
local CommandsListTopbar = Instance.new("Frame")
local CommandsList = Instance.new("Frame")
local ListedCmds = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local InputBox_2 = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")
local Discord = Instance.new("TextButton")
local Youtube = Instance.new("TextButton")
local Settings = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local NotificationTopbar = Instance.new("Frame")
local Notification = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

-- Build the UI (your existing UI creation code)
CommandEntry.Name = "CommandEntry"
CommandEntry.Parent = Script
CommandEntry.BackgroundColor3 = Color3.new(1, 1, 1)
CommandEntry.BackgroundTransparency = 0.67
CommandEntry.BorderColor3 = Color3.new(0, 0, 0)
CommandEntry.BorderSizePixel = 2
CommandEntry.Position = UDim2.new(0.6, 0, 0.00672043022, 0)
CommandEntry.Size = UDim2.new(0, 267, 0, 38)

InputBox.Name = "InputBox"
InputBox.Parent = CommandEntry
InputBox.BackgroundColor3 = Color3.new(1, 1, 1)
InputBox.BackgroundTransparency = 1
InputBox.BorderColor3 = Color3.new(0, 0, 0)
InputBox.BorderSizePixel = 0
InputBox.Size = UDim2.new(0, 267, 0, 38)
InputBox.Font = Enum.Font.ArialBold
InputBox.Text = ""
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.TextSize = 18
InputBox.TextStrokeTransparency = 0

CommandsListTopbar.Name = "CommandsListTopbar"
CommandsListTopbar.Parent = Script
CommandsListTopbar.BackgroundColor3 = Color3.new(0.784314, 0.784314, 0.784314)
CommandsListTopbar.BackgroundTransparency = 0.43
CommandsListTopbar.BorderColor3 = Color3.new(0, 0, 0)
CommandsListTopbar.BorderSizePixel = 0
CommandsListTopbar.Position = UDim2.new(0.822224915, 0, 0.650761664, 0)
CommandsListTopbar.Size = UDim2.new(0, 287, 0, 39)

CommandsList.Name = "CommandsList"
CommandsList.Parent = CommandsListTopbar
CommandsList.BackgroundColor3 = Color3.new(0.901961, 0.901961, 0.901961)
CommandsList.BackgroundTransparency = 0.43
CommandsList.BorderColor3 = Color3.new(0, 0, 0)
CommandsList.BorderSizePixel = 0
CommandsList.Position = UDim2.new(-7.48584498e-05, 0, 0.976495206, 0)
CommandsList.Size = UDim2.new(0, 287, 0, 261)

ListedCmds.Name = "ListedCmds"
ListedCmds.Parent = CommandsList
ListedCmds.BackgroundColor3 = Color3.new(0.843137, 0.843137, 0.843137)
ListedCmds.BackgroundTransparency = 0.99
ListedCmds.BorderColor3 = Color3.new(0, 0, 0)
ListedCmds.BorderSizePixel = 0
ListedCmds.Position = UDim2.new(0, 0, 0.153256699, 0)
ListedCmds.Size = UDim2.new(0, 287, 0, 221)

UIListLayout.Parent = ListedCmds
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

InputBox_2.Name = "InputBox"
InputBox_2.Parent = CommandsList
InputBox_2.BackgroundColor3 = Color3.new(1, 1, 1)
InputBox_2.BackgroundTransparency = 0.99
InputBox_2.BorderColor3 = Color3.new(0, 0, 0)
InputBox_2.BorderSizePixel = 0
InputBox_2.Size = UDim2.new(0, 287, 0, 38)
InputBox_2.Font = Enum.Font.ArialBold
InputBox_2.PlaceholderColor3 = Color3.new(1, 1, 1)
InputBox_2.PlaceholderText = "Type here to search some commands..."
InputBox_2.Text = ""
InputBox_2.TextColor3 = Color3.new(1, 1, 1)
InputBox_2.TextSize = 16
InputBox_2.TextStrokeTransparency = 0
InputBox_2.TextWrapped = true

TextLabel.Parent = CommandsListTopbar
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.Position = UDim2.new(0, 0, 0.513997376, 0)
TextLabel.Size = UDim2.new(0, 286, 0, 17)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Murder Mystery 2 Commands:"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 25

Discord.Name = "Discord"
Discord.Parent = CommandsListTopbar
Discord.BackgroundColor3 = Color3.new(0.556863, 0.556863, 0.556863)
Discord.BorderColor3 = Color3.new(0, 0, 0)
Discord.Position = UDim2.new(0.0383275263, 0, 0.0268194731, 0)
Discord.Size = UDim2.new(0, 80, 0, 19)
Discord.Font = Enum.Font.SourceSansBold
Discord.Text = "DISCORD"
Discord.TextColor3 = Color3.new(1, 1, 1)
Discord.TextSize = 20

Youtube.Name = "Youtube"
Youtube.Parent = CommandsListTopbar
Youtube.BackgroundColor3 = Color3.new(0.556863, 0.556863, 0.556863)
Youtube.BorderColor3 = Color3.new(0, 0, 0)
Youtube.Position = UDim2.new(0.35888502, 0, 0.0268194731, 0)
Youtube.Size = UDim2.new(0, 80, 0, 19)
Youtube.Font = Enum.Font.SourceSansBold
Youtube.Text = "YOUTUBE"
Youtube.TextColor3 = Color3.new(1, 1, 1)
Youtube.TextSize = 20

Settings.Name = "Settings"
Settings.Parent = CommandsListTopbar
Settings.BackgroundColor3 = Color3.new(0.556863, 0.556863, 0.556863)
Settings.BorderColor3 = Color3.new(0, 0, 0)
Settings.Position = UDim2.new(0.686411142, 0, 0.0268194731, 0)
Settings.Size = UDim2.new(0, 80, 0, 19)
Settings.Font = Enum.Font.SourceSansBold
Settings.Text = "SETTINGS"
Settings.TextColor3 = Color3.new(1, 1, 1)
Settings.TextSize = 20

TextLabel_2.Parent = Script
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderColor3 = Color3.new(0, 0, 0)
TextLabel_2.Position = UDim2.new(0.413233161, 0, 0.00639303634, 0)
TextLabel_2.Size = UDim2.new(0, 286, 0, 27)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "MM2 ADMIN | MADE BY PARADOX"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 25

NotificationTopbar.Name = "NotificationTopbar"
NotificationTopbar.Parent = Script
NotificationTopbar.BackgroundColor3 = Color3.new(0.882353, 0.882353, 0.882353)
NotificationTopbar.BackgroundTransparency = 0.35
NotificationTopbar.BorderColor3 = Color3.new(0, 0, 0)
NotificationTopbar.BorderSizePixel = 0
NotificationTopbar.Position = UDim2.new(-0.178000003, 0, 0.835573494, 0)
NotificationTopbar.Size = UDim2.new(0, 279, 0, 23)

Notification.Name = "Notification"
Notification.Parent = NotificationTopbar
Notification.BackgroundColor3 = Color3.new(1, 1, 1)
Notification.BackgroundTransparency = 0.55
Notification.BorderColor3 = Color3.new(0, 0, 0)
Notification.BorderSizePixel = 0
Notification.Position = UDim2.new(0, 0, 0.970809281, 0)
Notification.Size = UDim2.new(0, 279, 0, 119)

TextLabel_3.Parent = Notification
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.BorderColor3 = Color3.new(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.118279569, 0, 0.148499042, 0)
TextLabel_3.Size = UDim2.new(0, 213, 0, 82)
TextLabel_3.Font = Enum.Font.Arial
TextLabel_3.Text = ""
TextLabel_3.TextColor3 = Color3.new(1, 0, 0.0156863)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 16
TextLabel_3.TextStrokeTransparency = 0
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = NotificationTopbar
TextLabel_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.BorderColor3 = Color3.new(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Size = UDim2.new(0, 279, 0, 23)
TextLabel_4.Font = Enum.Font.Arial
TextLabel_4.Text = "Notification Title Text"
TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
TextLabel_4.TextSize = 16

UIAspectRatioConstraint.Parent = Script
UIAspectRatioConstraint.AspectRatio = 1.8485664129257202

-- Store commands
MM2Admin.Commands = {}
MM2Admin.CommandButtons = {}

local function MakeDraggable(gui)
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	local DRAG_SPEED = 0
	
	local function Lerp(a, b, m)
		return a + (b - a) * m
	end
	
	local function Update(dt)
		if dragging and dragInput then
			local delta = dragInput.Position - dragStart
			local xGoal = startPos.X.Offset + delta.X
			local yGoal = startPos.Y.Offset + delta.Y
			gui.Position = UDim2.new(
				startPos.X.Scale,
				Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
				startPos.Y.Scale,
				Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
			)
		end
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	RunService.Heartbeat:Connect(Update)
end

-- Initialize draggable UI
MakeDraggable(CommandsListTopbar)

-- Command input functionality
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Semicolon then
		InputBox:CaptureFocus()
		InputBox.Text = ""
	end
end)

-- Animated title text
local function AnimateTitle()
	local label = TextLabel_2
	local letters = {"M", "M", "2", " ", "A", "D", "M", "I", "N", " ", "|", " ", "M", "A", "D", "E", " ", "B", "Y", " ", "P", "A", "R", "A", "D", "O", "X"}
	label.Text = ""
	
	for i, v in ipairs(letters) do
		label.Text = label.Text .. v
		task.wait(0.05)
	end
end

-- Search functionality
InputBox_2:GetPropertyChangedSignal("Text"):Connect(function()
	local searchText = string.lower(InputBox_2.Text)
	
	for _, button in pairs(MM2Admin.CommandButtons) do
		if searchText == "" or string.find(string.lower(button.Name), searchText) then
			button.Visible = true
		else
			button.Visible = false
		end
	end
end)

-- Library Functions
function MM2Admin.CreateNotification(Title, Text, Duration)
	-- Set notification content
	TextLabel_4.Text = Title or "Notification"
	TextLabel_3.Text = Text or ""
	
	-- Slide in animation
	local slideIn = TweenService:Create(
		NotificationTopbar,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{Position = UDim2.new(0.02, 0, 0.835573494, 0)}
	)
	
	-- Slide out animation
	local slideOut = TweenService:Create(
		NotificationTopbar,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
		{Position = UDim2.new(-0.178000003, 0, 0.835573494, 0)}
	)
	
	-- Play animations
	slideIn:Play()
	task.wait(Duration or 5)
	slideOut:Play()
end

function MM2Admin.CreateCMD(Name, Description, Arguments, Callback)
	-- Create command button
	local CommandButton = Instance.new("TextButton")
	CommandButton.Name = Name
	CommandButton.Parent = ListedCmds
	CommandButton.BackgroundColor3 = Color3.new(0.556863, 0.556863, 0.556863)
	CommandButton.BorderColor3 = Color3.new(0, 0, 0)
	CommandButton.Size = UDim2.new(0, 268, 0, 25)
	CommandButton.Font = Enum.Font.SourceSansBold
	CommandButton.TextColor3 = Color3.new(1, 1, 1)
	CommandButton.TextSize = 20
	CommandButton.AutoButtonColor = false
	
	-- Set button text based on available info
	if Arguments then
		CommandButton.Text = Name .. " (" .. Arguments .. ")"
	else
		CommandButton.Text = Name
	end
	
	-- Store command info
	MM2Admin.Commands[Name] = {
		Description = Description,
		Arguments = Arguments,
		Callback = Callback
	}
	
	MM2Admin.CommandButtons[Name] = CommandButton
	
	-- Button click functionality
	CommandButton.MouseButton1Click:Connect(function()
		if Callback then
			-- If callback is provided, execute it
			Callback()
		else
			-- Otherwise, put command in input box
			InputBox.Text = Name
			InputBox:CaptureFocus()
		end
	end)
	
	-- Tooltip for description
	if Description then
		local Tooltip = Instance.new("TextLabel")
		Tooltip.Name = "Tooltip"
		Tooltip.Parent = CommandButton
		Tooltip.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
		Tooltip.BackgroundTransparency = 0.1
		Tooltip.BorderSizePixel = 0
		Tooltip.Position = UDim2.new(0, 0, -1.5, 0)
		Tooltip.Size = UDim2.new(0, 200, 0, 40)
		Tooltip.Visible = false
		Tooltip.Text = Description
		Tooltip.TextColor3 = Color3.new(1, 1, 1)
		Tooltip.TextSize = 12
		Tooltip.TextWrapped = true
		Tooltip.ZIndex = 10
		
		CommandButton.MouseEnter:Connect(function()
			Tooltip.Visible = true
		end)
		
		CommandButton.MouseLeave:Connect(function()
			Tooltip.Visible = false
		end)
	end
	
	return CommandButton
end

-- Execute command from input box
function MM2Admin.ExecuteCommand(commandString)
	local args = {}
	for word in commandString:gmatch("%S+") do
		table.insert(args, word)
	end
	
	if #args > 0 then
		local commandName = args[1]
		local command = MM2Admin.Commands[commandName]
		
		if command and command.Callback then
			-- Remove command name from args
			table.remove(args, 1)
			command.Callback(unpack(args))
		else
			MM2Admin.CreateNotification("Error", "Command not found: " .. commandName, 3)
		end
	end
end

-- Input box execution
InputBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		MM2Admin.ExecuteCommand(InputBox.Text)
		InputBox.Text = ""
	end
end)
-- Start animations
AnimateTitle()

-- Hide notification initially
NotificationTopbar.Position = UDim2.new(-0.178000003, 0, 0.835573494, 0)

return MM2Admin
