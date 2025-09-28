--[=[
    MM2 Admin UI Library
    Source: Paradox/G2L conversion
    Features:
    - Init() -> creates UI
    - AddCMD(Name, Text, Callback) -> adds commands
    - Notifications on the left
    - Command bar + chat listener
]=]

local AdminUI = {}
AdminUI.__index = AdminUI

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- global commands table
getgenv().Commands = getgenv().Commands or {}

-- Notification system
function AdminUI:Notify(Title, Text, Duration)
    local Frame = Instance.new("Frame")
    Frame.Name = "NotificationTopbar"
    Frame.Size = UDim2.new(0, 250, 0, 100)
    Frame.Position = UDim2.new(0, 10, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Frame.BackgroundTransparency = 0.2
    Frame.Parent = self.UI

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = Title
    TitleLabel.Size = UDim2.new(1,0,0,25)
    TitleLabel.Position = UDim2.new(0,0,0,0)
    TitleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 20
    TitleLabel.Parent = Frame

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Text = Text
    TextLabel.Size = UDim2.new(1,0,1,-25)
    TextLabel.Position = UDim2.new(0,0,0,25)
    TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
    TextLabel.TextWrapped = true
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.TextSize = 16
    TextLabel.Parent = Frame

    task.delay(Duration or 3, function()
        Frame:Destroy()
    end)
end

-- initialize the UI
function AdminUI:Init()
    if self.UI then return end -- already init

    local UI = Instance.new("ScreenGui")
    UI.Name = "AdminUI"
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UI.IgnoreGuiInset = true
    UI.Parent = PlayerGui

    self.UI = UI

    -- main frame
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 300, 0, 400)
    Main.Position = UDim2.new(0.7,0,0.2,0)
    Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Main.BorderSizePixel = 0
    Main.Parent = UI
    self.Main = Main

    -- command list
    local ListFrame = Instance.new("ScrollingFrame")
    ListFrame.Size = UDim2.new(1,0,1,-40)
    ListFrame.Position = UDim2.new(0,0,0,40)
    ListFrame.BackgroundTransparency = 1
    ListFrame.ScrollBarThickness = 6
    ListFrame.Parent = Main
    self.List = ListFrame

    local UIList = Instance.new("UIListLayout")
    UIList.Parent = ListFrame
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Padding = UDim.new(0,3)

    -- command bar
    local CommandBox = Instance.new("TextBox")
    CommandBox.Size = UDim2.new(1,0,0,30)
    CommandBox.Position = UDim2.new(0,0,0,0)
    CommandBox.PlaceholderText = "Type command here..."
    CommandBox.Text = ""
    CommandBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
    CommandBox.TextColor3 = Color3.fromRGB(255,255,255)
    CommandBox.BorderSizePixel = 0
    CommandBox.Font = Enum.Font.SourceSans
    CommandBox.TextSize = 18
    CommandBox.Parent = Main
    self.CommandBox = CommandBox

    -- draggable
    local dragging = false
    local dragStart, startPos
    local function Lerp(a,b,m) return a + (b-a)*m end

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    RunService.Heartbeat:Connect(function(dt)
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- semicolon listener
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == Enum.KeyCode.Semicolon then
            CommandBox:CaptureFocus()
            CommandBox.Text = ""
        end
    end)

    CommandBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local text = CommandBox.Text
            local args = text:split(" ")
            local cmd = table.remove(args,1):lower()
            if getgenv().Commands[cmd] then
                getgenv().Commands[cmd](args)
            else
                self:Notify("Error","Command not found: "..cmd,3)
            end
            CommandBox.Text = ""
        end
    end)
end

-- add a command
function AdminUI:AddCMD(Name, Text, Callback)
    if not self.UI then self:Init() end

    -- store globally
    getgenv().Commands[Name:lower()] = Callback

    -- create button
    local Button = Instance.new("TextButton")
    Button.Name = Name
    Button.Text = Text
    Button.Size = UDim2.new(1,0,0,30)
    Button.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.BorderSizePixel = 0
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Parent = self.List

    Button.MouseButton1Click:Connect(function()
        self.CommandBox.Text = Name
        Callback({})
    end)
end

return AdminUI
