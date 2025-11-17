local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Создание основного GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ClothingChanger"
ScreenGui.Parent = CoreGui -- Изменено с PlayerGui на CoreGui
ScreenGui.ResetOnSpawn = false -- Важно: отключаем сброс при возрождении

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Остальной код остается без изменений...
-- Скругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Заголовок с кнопками управления
local Title = Instance.new("Frame")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- Текст заголовка
local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "change of clothing"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 20
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Title

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(1, -60, 0.5, -12)
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = Title

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 4)
MinimizeCorner.Parent = MinimizeButton

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -25, 0.5, -12)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Title

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

-- Контент фрейм (будет сворачиваться)
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -50)
ContentFrame.Position = UDim2.new(0, 0, 0, 50)
ContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Поле для ввода ника игрока
local UsernameLabel = Instance.new("TextLabel")
UsernameLabel.Size = UDim2.new(0.9, 0, 0, 25)
UsernameLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.Text = "Player nickname:"
UsernameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
UsernameLabel.TextSize = 14
UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
UsernameLabel.Font = Enum.Font.Gotham
UsernameLabel.Parent = ContentFrame

local UsernameBox = Instance.new("TextBox")
UsernameBox.Size = UDim2.new(0.9, 0, 0, 35)
UsernameBox.Position = UDim2.new(0.05, 0, 0.15, 0)
UsernameBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
UsernameBox.BorderSizePixel = 0
UsernameBox.Text = ""
UsernameBox.PlaceholderText = "type player nickname..."
UsernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameBox.TextSize = 14
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.Parent = ContentFrame

local UsernameCorner = Instance.new("UICorner")
UsernameCorner.CornerRadius = UDim.new(0, 6)
UsernameCorner.Parent = UsernameBox

-- Поле для айди рубашки
local ShirtLabel = Instance.new("TextLabel")
ShirtLabel.Size = UDim2.new(0.9, 0, 0, 25)
ShirtLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
ShirtLabel.BackgroundTransparency = 1
ShirtLabel.Text = "Id decal shirt:"
ShirtLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ShirtLabel.TextSize = 14
ShirtLabel.TextXAlignment = Enum.TextXAlignment.Left
ShirtLabel.Font = Enum.Font.Gotham
ShirtLabel.Parent = ContentFrame

local ShirtBox = Instance.new("TextBox")
ShirtBox.Size = UDim2.new(0.9, 0, 0, 35)
ShirtBox.Position = UDim2.new(0.05, 0, 0.35, 0)
ShirtBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ShirtBox.BorderSizePixel = 0
ShirtBox.Text = ""
ShirtBox.PlaceholderText = "type Id decal shirt:"
ShirtBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ShirtBox.TextSize = 14
ShirtBox.Font = Enum.Font.Gotham
ShirtBox.Parent = ContentFrame

local ShirtCorner = Instance.new("UICorner")
ShirtCorner.CornerRadius = UDim.new(0, 6)
ShirtCorner.Parent = ShirtBox

-- Поле для айди штанов
local PantsLabel = Instance.new("TextLabel")
PantsLabel.Size = UDim2.new(0.9, 0, 0, 25)
PantsLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
PantsLabel.BackgroundTransparency = 1
PantsLabel.Text = "Id decal pants:"
PantsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
PantsLabel.TextSize = 14
PantsLabel.TextXAlignment = Enum.TextXAlignment.Left
PantsLabel.Font = Enum.Font.Gotham
PantsLabel.Parent = ContentFrame

local PantsBox = Instance.new("TextBox")
PantsBox.Size = UDim2.new(0.9, 0, 0, 35)
PantsBox.Position = UDim2.new(0.05, 0, 0.55, 0)
PantsBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PantsBox.BorderSizePixel = 0
PantsBox.Text = ""
PantsBox.PlaceholderText = "type Id decal pants..."
PantsBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PantsBox.TextSize = 14
PantsBox.Font = Enum.Font.Gotham
PantsBox.Parent = ContentFrame

local PantsCorner = Instance.new("UICorner")
PantsCorner.CornerRadius = UDim.new(0, 6)
PantsCorner.Parent = PantsBox

-- Кнопка применения
local ApplyButton = Instance.new("TextButton")
ApplyButton.Size = UDim2.new(0.9, 0, 0, 45)
ApplyButton.Position = UDim2.new(0.05, 0, 0.75, 0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(178, 85, 255)
ApplyButton.BorderSizePixel = 0
ApplyButton.Text = "Apply clothes"
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.TextSize = 16
ApplyButton.Font = Enum.Font.GothamBold
ApplyButton.Parent = ContentFrame

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplyButton

-- Текст результата
local ResultText = Instance.new("TextLabel")
ResultText.Size = UDim2.new(0.9, 0, 0, 30)
ResultText.Position = UDim2.new(0.05, 0, 0.67, 0)
ResultText.BackgroundTransparency = 1
ResultText.Text = ""
ResultText.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultText.TextSize = 12
ResultText.Font = Enum.Font.Gotham
ResultText.Parent = ContentFrame

-- Переменная для состояния сворачивания
local isMinimized = false
local originalSize = MainFrame.Size
local minimizedSize = UDim2.new(0, 350, 0, 50)

-- Функция сворачивания/разворачивания
local function toggleMinimize()
    if isMinimized then
        -- Разворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = originalSize}):Play()
        TweenService:Create(ContentFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
        MinimizeButton.Text = "_"
        isMinimized = false
        
        -- Включаем видимость всех элементов контента
        for _, child in ipairs(ContentFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = true
            end
        end
    else
        -- Сворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = minimizedSize}):Play()
        MinimizeButton.Text = "+"
        isMinimized = true
        
        -- Прячем элементы контента после анимации
        delay(0.3, function()
            for _, child in ipairs(ContentFrame:GetChildren()) do
                if child:IsA("GuiObject") then
                    child.Visible = false
                end
            end
        end)
    end
end

-- Функция закрытия
local function closeGUI()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 350, 0, 0)}):Play()
    wait(0.3)
    ScreenGui:Destroy()
end

-- Функция для скрытия сообщения через указанное время
local function hideMessageAfterDelay(delay)
    delay(delay)
    ResultText.Text = ""
end

-- Функция для изменения одежды
local function changeClothing()
    local username = UsernameBox.Text
    local shirtId = ShirtBox.Text
    local pantsId = PantsBox.Text
    
    -- Проверка введенных данных
    if username == "" then
        ResultText.Text = "Enter the player's nickname!"
        ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
        hideMessageAfterDelay(wait(1))
        return
    end
    
    if shirtId == "" and pantsId == "" then
        ResultText.Text = "Enter clothing ID!"
        ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
        hideMessageAfterDelay(wait(1))
        return
    end
    
    -- Поиск игрока
    local player = game.Workspace.Characters:FindFirstChild(username)
    
    if not player then
        ResultText.Text = "Player '" .. username .. "' not found!"
        ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
        hideMessageAfterDelay(wait(1))
        return
    end
    
    -- Изменение рубашки
    if shirtId ~= "" then
        if player:FindFirstChild("Shirt") then
            player.Shirt.ShirtTemplate = "rbxassetid://" .. shirtId
        else
            ResultText.Text = "The player's shirt was not found!"
            ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
            hideMessageAfterDelay(wait(1))
            return
        end
    end
    
    -- Изменение штанов
    if pantsId ~= "" then
        if player:FindFirstChild("Pants") then
            player.Pants.PantsTemplate = "rbxassetid://" .. pantsId
        else
            ResultText.Text = "The player's pants are not found!"
            ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
            hideMessageAfterDelay(wait(1))
            return
        end
    end
    
    ResultText.Text = "Clothing changed successfully!"
    ResultText.TextColor3 = Color3.fromRGB(100, 255, 100)
    hideMessageAfterDelay(wait(1))
end

-- Обработчики кнопок
ApplyButton.MouseButton1Click:Connect(changeClothing)
MinimizeButton.MouseButton1Click:Connect(toggleMinimize)
CloseButton.MouseButton1Click:Connect(closeGUI)

-- Анимация кнопок
ApplyButton.MouseEnter:Connect(function()
    TweenService:Create(ApplyButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(139, 0, 255)}):Play()
end)

ApplyButton.MouseLeave:Connect(function()
    TweenService:Create(ApplyButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(178, 85, 255)}):Play()
end)

MinimizeButton.MouseEnter:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
end)

MinimizeButton.MouseLeave:Connect(function()
    TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 80, 80)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}):Play()
end)

-- Перетаскивание GUI
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
