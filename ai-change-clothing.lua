local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Создание основного GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ClothingChanger"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Основной фрейм (уменьшенная высота)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 300)  -- Было 400, стало 300
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)  -- Скорректирована позиция
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Скругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Заголовок с кнопками управления
local Title = Instance.new("Frame")
Title.Size = UDim2.new(1, 0, 0, 40)  -- Уменьшена высота заголовка
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
TitleText.TextSize = 18  -- Уменьшен размер текста
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Title

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 22, 0, 22)  -- Уменьшен размер кнопки
MinimizeButton.Position = UDim2.new(1, -55, 0.5, -11)  -- Скорректирована позиция
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14  -- Уменьшен размер текста
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = Title

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 4)
MinimizeCorner.Parent = MinimizeButton

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 22, 0, 22)  -- Уменьшен размер кнопки
CloseButton.Position = UDim2.new(1, -25, 0.5, -11)  -- Скорректирована позиция
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
ContentFrame.Size = UDim2.new(1, 0, 1, -40)  -- Скорректирована высота
ContentFrame.Position = UDim2.new(0, 0, 0, 40)  -- Скорректирована позиция
ContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Поле для айди рубашки
local ShirtLabel = Instance.new("TextLabel")
ShirtLabel.Size = UDim2.new(0.9, 0, 0, 20)  -- Уменьшена высота
ShirtLabel.Position = UDim2.new(0.05, 0, 0.15, 0)  -- Скорректирована позиция
ShirtLabel.BackgroundTransparency = 1
ShirtLabel.Text = "Shirt ID:"
ShirtLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ShirtLabel.TextSize = 13  -- Уменьшен размер текста
ShirtLabel.TextXAlignment = Enum.TextXAlignment.Left
ShirtLabel.Font = Enum.Font.Gotham
ShirtLabel.Parent = ContentFrame

local ShirtBox = Instance.new("TextBox")
ShirtBox.Size = UDim2.new(0.9, 0, 0, 30)  -- Уменьшена высота
ShirtBox.Position = UDim2.new(0.05, 0, 0.22, 0)  -- Скорректирована позиция
ShirtBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ShirtBox.BorderSizePixel = 0
ShirtBox.Text = ""
ShirtBox.PlaceholderText = "Enter shirt asset ID..."
ShirtBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ShirtBox.TextSize = 13  -- Уменьшен размер текста
ShirtBox.Font = Enum.Font.Gotham
ShirtBox.Parent = ContentFrame

local ShirtCorner = Instance.new("UICorner")
ShirtCorner.CornerRadius = UDim.new(0, 6)
ShirtCorner.Parent = ShirtBox

-- Поле для айди штанов
local PantsLabel = Instance.new("TextLabel")
PantsLabel.Size = UDim2.new(0.9, 0, 0, 20)  -- Уменьшена высота
PantsLabel.Position = UDim2.new(0.05, 0, 0.45, 0)  -- Скорректирована позиция
PantsLabel.BackgroundTransparency = 1
PantsLabel.Text = "Pants ID:"
PantsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
PantsLabel.TextSize = 13  -- Уменьшен размер текста
PantsLabel.TextXAlignment = Enum.TextXAlignment.Left
PantsLabel.Font = Enum.Font.Gotham
PantsLabel.Parent = ContentFrame

local PantsBox = Instance.new("TextBox")
PantsBox.Size = UDim2.new(0.9, 0, 0, 30)  -- Уменьшена высота
PantsBox.Position = UDim2.new(0.05, 0, 0.52, 0)  -- Скорректирована позиция
PantsBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PantsBox.BorderSizePixel = 0
PantsBox.Text = ""
PantsBox.PlaceholderText = "Enter pants asset ID..."
PantsBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PantsBox.TextSize = 13  -- Уменьшен размер текста
PantsBox.Font = Enum.Font.Gotham
PantsBox.Parent = ContentFrame

local PantsCorner = Instance.new("UICorner")
PantsCorner.CornerRadius = UDim.new(0, 6)
PantsCorner.Parent = PantsBox

-- Кнопка применения
local ApplyButton = Instance.new("TextButton")
ApplyButton.Size = UDim2.new(0.9, 0, 0, 35)  -- Уменьшена высота
ApplyButton.Position = UDim2.new(0.05, 0, 0.78, 0)  -- Скорректирована позиция
ApplyButton.BackgroundColor3 = Color3.fromRGB(178, 85, 255)
ApplyButton.BorderSizePixel = 0
ApplyButton.Text = "Apply clothes"
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.TextSize = 14  -- Уменьшен размер текста
ApplyButton.Font = Enum.Font.GothamBold
ApplyButton.Parent = ContentFrame

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 6)
ApplyCorner.Parent = ApplyButton

-- Текст результата
local ResultText = Instance.new("TextLabel")
ResultText.Size = UDim2.new(0.9, 0, 0, 25)  -- Уменьшена высота
ResultText.Position = UDim2.new(0.05, 0, 0.65, 0)  -- Скорректирована позиция
ResultText.BackgroundTransparency = 1
ResultText.Text = ""
ResultText.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultText.TextSize = 11  -- Уменьшен размер текста
ResultText.Font = Enum.Font.Gotham
ResultText.Parent = ContentFrame

-- Переменная для состояния сворачивания
local isMinimized = false
local originalSize = MainFrame.Size
local minimizedSize = UDim2.new(0, 350, 0, 40)  -- Уменьшен размер сворачивания

-- Функция для скрытия сообщения через указанное время
local function hideMessageAfterDelay(delayTime)
    wait(delayTime)
    ResultText.Text = ""
end

-- Функция сворачивания/разворачивания
local function toggleMinimize()
    if isMinimized then
        -- Разворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = originalSize}):Play()
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
        wait(0.3)
        for _, child in ipairs(ContentFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = false
            end
        end
    end
end

-- Функция закрытия
local function closeGUI()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 350, 0, 0)}):Play()
    wait(0.3)
    ScreenGui:Destroy()
end

-- Функция для изменения одежды своего персонажа
local function changeClothing()
    local shirtId = ShirtBox.Text
    local pantsId = PantsBox.Text
    
    -- Проверка введенных данных
    if shirtId == "" and pantsId == "" then
        ResultText.Text = "Enter clothing ID!"
        ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
        hideMessageAfterDelay(1)
        return
    end
    
    -- Получаем своего персонажа
    local player = Players.LocalPlayer
    local character = player.Character
    
    if not character then
        ResultText.Text = "Character not found!"
        ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
        hideMessageAfterDelay(1)
        return
    end
    
    -- Изменение рубашки
    if shirtId ~= "" then
        if character:FindFirstChild("Shirt") then
            character.Shirt.ShirtTemplate = "rbxassetid://" .. shirtId
        else
            ResultText.Text = "Shirt not found on character!"
            ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
            hideMessageAfterDelay(1)
            return
        end
    end
    
    -- Изменение штанов
    if pantsId ~= "" then
        if character:FindFirstChild("Pants") then
            character.Pants.PantsTemplate = "rbxassetid://" .. pantsId
        else
            ResultText.Text = "Pants not found on character!"
            ResultText.TextColor3 = Color3.fromRGB(255, 100, 100)
            hideMessageAfterDelay(1)
            return
        end
    end
    
    ResultText.Text = "Clothing changed successfully!"
    ResultText.TextColor3 = Color3.fromRGB(100, 255, 100)
    hideMessageAfterDelay(1)
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
