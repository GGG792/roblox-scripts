
-- 加载Nexus UI Library
local LibraryUrl = "https://raw.githubusercontent.com/Carterjam28YT/Nexus-UI/refs/heads/main/Nexus%20Library%20open%20src"

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "脚本加载",
    Text = "正在加载Nexus Library...",
    Duration = 5
})

print("正在加载Nexus Library...")

local Success, Library = pcall(function()
    return loadstring(game:HttpGet(LibraryUrl))()
end)

if not Success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "错误",
        Text = "加载失败: " .. tostring(Library),
        Duration = 10
    })
    error("加载失败: " .. tostring(Library))
end

print("Nexus Library加载成功！")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "成功",
    Text = "Nexus Library已加载！",
    Duration = 5
})

-- 创建窗口
Library:Watermark("Rb脚本中心 | 杨志卡制作 | v1.0")
local Window = Library:Window("Rb脚本中心 V_1.2.1")

-- 创建标签页
local AboutTab = Window:Tab("杨志卡出品", "rbxassetid://4483345998")
local AnnounceTab = Window:Tab("公告", "rbxassetid://4483345998")
local GeneralTab = Window:Tab("通用-修改玩家数据", "rbxassetid://4483345998")

-- 关于页面
local AboutPage = AboutTab:SubTab("关于")
local AboutGroup = AboutPage:Groupbox("信息", "Left")
AboutGroup:AddParagraph({
    Title = "关于",
    Content = "脚本为免费脚本 请勿去圈钱\n禁止倒卖"
})

-- 公告页面
local AnnouncePage = AnnounceTab:SubTab("公告")
local AnnounceGroup = AnnouncePage:Groupbox("作者信息", "Left")
AnnounceGroup:AddButton("复制作者QQ", function()
    setclipboard("948093426")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "已复制",
        Text = "作者QQ已复制到剪贴板！",
        Duration = 3
    })
end)
AnnounceGroup:AddButton("复制Rb脚本交流群QQ", function()
    setclipboard("1018099361")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "已复制",
        Text = "QQ群号已复制到剪贴板！",
        Duration = 3
    })
end)

-- 通用功能页面
local GeneralPage = GeneralTab:SubTab("玩家设置")
local PlayerGroup = GeneralPage:Groupbox("基础设置", "Left")

-- 速度滑块
PlayerGroup:AddSlider({
    Title = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

-- 跳跃高度滑块
PlayerGroup:AddSlider({
    Title = "跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

-- 夜视开关
PlayerGroup:AddToggle({
    Title = "夜视",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

-- 完成通知
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Rb脚本中心",
    Text = "欢迎使用Rb脚本中心！",
    Duration = 3
})

print("脚本加载完成！按RightShift键可以切换UI显示")
