
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "脚本加载",
    Text = "正在加载OrionLib...",
    Duration = 5
})

print("正在加载OrionLib...")

local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "错误",
        Text = "OrionLib加载失败: " .. tostring(OrionLib),
        Duration = 10
    })
    error("OrionLib加载失败")
end

print("OrionLib加载成功！")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "成功",
    Text = "OrionLib已加载，正在创建UI...",
    Duration = 5
})

local Window = OrionLib:MakeWindow({
    Name = "Rb脚本中心 V_1.2.1",
    HidePremium = false,
    SaveConfig = true,
    IntroText = "杨志卡制作",
    ConfigFolder = "杨志卡制作"
})

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "杨志卡制作",
    Text = "杨志卡制作",
    Duration = 4
})

local about = Window:MakeTab({
    Name = "杨志卡出品",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

about:AddParagraph("脚本为免费脚本 请勿去圈钱")
about:AddParagraph("禁止倒卖")

local Tab = Window:MakeTab({
    Name = "公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "复制作者QQ",
    Callback = function()
        setclipboard("948093426")
    end
})

OrionLib:MakeNotification({
    Name = "Rb脚本中心",
    Content = "欢迎使用Rb脚本中心",
    Image = "rbxassetid://4483345998",
    Time = 2
})

local Tab = Window:MakeTab({
    Name = "通用-修改玩家数据",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "杨志卡制作"
})

Tab:AddSlider({
    Name = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

Tab:AddSlider({
    Name = "跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

Tab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

OrionLib:Init()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "完成",
    Text = "UI已加载！",
    Duration = 5
})

print("脚本加载完成！")
