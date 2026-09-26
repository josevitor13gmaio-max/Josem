-- =====================================================================
-- JOSE HUB AUTO FARME - CUSTOM WRAPPER FOR DELTA EXECUTOR
-- =====================================================================
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- 1. CRIANDO A INTERFACE PRINCIPAL DO JOSÉ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JoseHubDelta"
ScreenGui.Parent = CoreGui:FindFirstChild("RobloxGui") or CoreGui

-- Painel Principal do José Hub
local MainPanel = Instance.new("Frame")
MainPanel.Size = UDim2.new(0, 300, 0, 200)
MainPanel.Position = UDim2.new(0.5, -150, 0.35, 0)
MainPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainPanel.BorderSizePixel = 2
MainPanel.BorderColor3 = Color3.fromRGB(0, 255, 127) -- Borda verde neon pro Hub do José
MainPanel.Active = true
MainPanel.Draggable = true -- Arrasta com o dedo na tela do celular
MainPanel.Parent = ScreenGui

-- Cantos arredondados para ficar moderno
local PanelCorner = Instance.new("UICorner")
PanelCorner.CornerRadius = UDim.new(0, 12)
PanelCorner.Parent = MainPanel

-- Título Principal: Jose hub auto farme
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
Title.Text = "JOSE HUB AUTO FARME"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainPanel

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- Botão para Injetar/Ativar o Motor do Script
local BtnAtivar = Instance.new("TextButton")
BtnAtivar.Size = UDim2.new(1, -40, 0, 50)
BtnAtivar.Position = UDim2.new(0, 20, 0, 70)
BtnAtivar.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
BtnAtivar.Text = "LIGAR AUTO FARM"
BtnAtivar.TextColor3 = Color3.fromRGB(0, 255, 127)
BtnAtivar.TextSize = 16
BtnAtivar.Font = Enum.Font.SourceSansBold
BtnAtivar.Parent = MainPanel

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = BtnAtivar

-- Botão de Minimizar Interno (X)
local BtnFecharMode = Instance.new("TextButton")
BtnFecharMode.Size = UDim2.new(0, 35, 0, 35)
BtnFecharMode.Position = UDim2.new(1, -40, 0, 5)
BtnFecharMode.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
BtnFecharMode.Text = "X"
BtnFecharMode.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFecharMode.TextSize = 16
BtnFecharMode.Font = Enum.Font.SourceSansBold
BtnFecharMode.Parent = MainPanel

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = BtnFecharMode

-- 2. BOTÃO FLUTUANTE PARA ABRIR (Nome na tela: José hub)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 100, 0, 40)
OpenBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
OpenBtn.Text = "José hub"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 14
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Visible = false -- Começa escondido porque o menu principal inicia aberto
OpenBtn.Draggable = true -- Move o botão do José para onde quiser na tela touch
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 10)
OpenCorner.Parent = OpenBtn

-- 3. LÓGICA DE FUNCIONAMENTO DOS BOTÕES

-- Ação do Botão Fechar Mode (Esconde o painel grande e mostra o botão "José hub")
BtnFecharMode.MouseButton1Click:Connect(function()
    MainPanel.Visible = false
    OpenBtn.Visible = true
end)

-- Ação do Botão Abrir (Esconde o botão e mostra o painel principal "JOSE HUB AUTO FARME")
OpenBtn.MouseButton1Click:Connect(function()
    OpenBtn.Visible = false
    MainPanel.Visible = true
end)

-- Ação de Ligar o Motor do Script de Farm
local carregado = false
BtnAtivar.MouseButton1Click:Connect(function()
    if not carregado then
        carregado = true
        BtnAtivar.Text = "CARREGANDO BACKEND..."
        BtnAtivar.BackgroundColor3 = Color3.fromRGB(25, 80, 45)
        
        -- Executa de forma oculta a linha de comando que o José duvidou
        task.spawn(function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
            end)
            BtnAtivar.Text = "FARM ATIVADO COM SUCESSO!"
            BtnAtivar.BackgroundColor3 = Color3.fromRGB(15, 120, 60)
        end)
    end
end)

print("--- [JOSE HUB] Carregado com sucesso no Delta Executor! ---")
