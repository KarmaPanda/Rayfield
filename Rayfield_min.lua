local a = "Custom"
local b = 6.5;
local c = "Rayfield"
local d = c .. "/Configurations"
local e = ".rfld"
local f = {
    Flags = {},
    Theme = {
        Default = {
            TextFont = "Default",
            TextColor = Color3.fromRGB(240, 240, 240),
            Background = Color3.fromRGB(25, 25, 25),
            Topbar = Color3.fromRGB(34, 34, 34),
            Shadow = Color3.fromRGB(20, 20, 20),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(80, 80, 80),
            TabStroke = Color3.fromRGB(85, 85, 85),
            TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
            ElementBackground = Color3.fromRGB(35, 35, 35),
            ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
            SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
            ElementStroke = Color3.fromRGB(50, 50, 50),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SliderBackground = Color3.fromRGB(43, 105, 159),
            SliderProgress = Color3.fromRGB(43, 105, 159),
            SliderStroke = Color3.fromRGB(48, 119, 177),
            ToggleBackground = Color3.fromRGB(30, 30, 30),
            ToggleEnabled = Color3.fromRGB(0, 146, 214),
            ToggleDisabled = Color3.fromRGB(100, 100, 100),
            ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
            ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
            ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
            ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
            InputBackground = Color3.fromRGB(30, 30, 30),
            InputStroke = Color3.fromRGB(65, 65, 65),
            PlaceholderColor = Color3.fromRGB(178, 178, 178)
        },
        Light = {
            TextFont = "Gotham",
            TextColor = Color3.fromRGB(50, 50, 50),
            Background = Color3.fromRGB(255, 255, 255),
            Topbar = Color3.fromRGB(217, 217, 217),
            Shadow = Color3.fromRGB(223, 223, 223),
            NotificationBackground = Color3.fromRGB(20, 20, 20),
            NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
            TabBackground = Color3.fromRGB(220, 220, 220),
            TabStroke = Color3.fromRGB(112, 112, 112),
            TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
            TabTextColor = Color3.fromRGB(240, 240, 240),
            SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
            ElementBackground = Color3.fromRGB(198, 198, 198),
            ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
            SecondaryElementBackground = Color3.fromRGB(136, 136, 136),
            ElementStroke = Color3.fromRGB(180, 199, 97),
            SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
            SliderBackground = Color3.fromRGB(31, 159, 71),
            SliderProgress = Color3.fromRGB(31, 159, 71),
            SliderStroke = Color3.fromRGB(42, 216, 94),
            ToggleBackground = Color3.fromRGB(170, 203, 60),
            ToggleEnabled = Color3.fromRGB(32, 214, 29),
            ToggleDisabled = Color3.fromRGB(100, 22, 23),
            ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
            ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
            ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
            ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),
            InputBackground = Color3.fromRGB(31, 159, 71),
            InputStroke = Color3.fromRGB(19, 65, 31),
            PlaceholderColor = Color3.fromRGB(178, 178, 178)
        }
    }
}
local g = game:GetService("UserInputService")
local h = game:GetService("TweenService")
local i = game:GetService("HttpService")
local j = game:GetService("RunService")
local k = game:GetService("Players")
local l = game:GetService("CoreGui")
local m = game:GetObjects("rbxassetid://12701685028")[1]
m.Enabled = false;
if gethui then
    m.Parent = gethui()
elseif syn.protect_gui then
    syn.protect_gui(m)
    m.Parent = l
elseif l:FindFirstChild("RobloxGui") then
    m.Parent = l:FindFirstChild("RobloxGui")
else
    m.Parent = l
end
if gethui then
    for n, o in ipairs(gethui():GetChildren()) do
        if o.Name == m.Name and o ~= m then
            o.Enabled = false;
            o.Name = "Rayfield-Old"
        end
    end
else
    for n, o in ipairs(l:GetChildren()) do
        if o.Name == m.Name and o ~= m then
            o.Enabled = false;
            o.Name = "Rayfield-Old"
        end
    end
end
local p = workspace.CurrentCamera;
local q = m.Main;
local r = q.Topbar;
local s = q.Elements;
local t = q.LoadingFrame;
local u = q.TabList;
local v = q.Searchbar;
local w = v.CanvasGroup.Filler;
local x = q.Prompt;
m.DisplayOrder = 100;
t.Version.Text = a;
local y = syn and syn.request or http and http.request or http_request;
local z = nil;
local A = false;
local B = false;
local C = false;
local D = false;
local E = false;
local F = true;
local G = m.Notifications;
local H = f.Theme.Default;
function ChangeTheme(I)
    H = f.Theme[I]
    for n, J in ipairs(m:GetDescendants()) do
        if J.ClassName == "TextLabel" or J.ClassName == "TextBox" or J.ClassName ==
            "TextButton" then
            if H.TextFont ~= "Default" then
                J.TextColor3 = H.TextColor;
                J.Font = H.TextFont
            end
        end
    end
    m.Main.BackgroundColor3 = H.Background;
    m.Main.Topbar.BackgroundColor3 = H.Topbar;
    m.Main.Topbar.CornerRepair.BackgroundColor3 = H.Topbar;
    m.Main.Shadow.Image.ImageColor3 = H.Shadow;
    m.Main.Topbar.Hide.ImageColor3 = H.TextColor;
    for n, K in ipairs(s:GetChildren()) do
        for n, L in ipairs(K:GetChildren()) do
            if L.ClassName == "Frame" and L.Name ~= "Placeholder" and L.Name ~=
                "SectionSpacing" and L.Name ~= "SectionTitle" then
                L.BackgroundColor3 = H.ElementBackground;
                L.UIStroke.Color = H.ElementStroke
            end
        end
    end
end
local function M(N, q)
    pcall(function()
        local O, P, Q, R = false, false, false, false;
        N.InputBegan:Connect(function(S)
            if S.UserInputType == Enum.UserInputType.MouseButton1 then
                O = true;
                Q = S.Position;
                R = q.Position;
                S.Changed:Connect(function()
                    if S.UserInputState == Enum.UserInputState.End then
                        O = false
                    end
                end)
            end
        end)
        N.InputChanged:Connect(function(S)
            if S.UserInputType == Enum.UserInputType.MouseMovement then
                P = S
            end
        end)
        g.InputChanged:Connect(function(S)
            if S == P and O then
                local T = S.Position - Q;
                h:Create(q, TweenInfo.new(0.45, Enum.EasingStyle.Quint,
                                          Enum.EasingDirection.Out), {
                    Position = UDim2.new(R.X.Scale, R.X.Offset + T.X, R.Y.Scale,
                                         R.Y.Offset + T.Y)
                }):Play()
            end
        end)
    end)
end
local function U(V) return {R = V.R * 255, G = V.G * 255, B = V.B * 255} end
local function W(V) return Color3.fromRGB(V.R, V.G, V.B) end
local function X(Y)
    local Z = i:JSONDecode(Y)
    table.foreach(Z, function(_, a0)
        if f.Flags[_] then
            spawn(function()
                if f.Flags[_].Type == "Colorpicker" then
                    f.Flags[_]:Set(W(a0))
                else
                    if f.Flags[_].CurrentValue or f.Flags[_].CurrentKeybind or
                        f.Flags[_].CurrentOption or f.Flags[_].Color ~= a0 then
                        f.Flags[_]:Set(a0)
                    end
                end
            end)
        else
            f:Notify({
                Title = "Flag Error",
                Content = "Rayfield was unable to find '" .. _ ..
                    "'' in the current script"
            })
        end
    end)
end
local function a1()
    if not A then return end
    local Z = {}
    for a2, a3 in pairs(f.Flags) do
        if a3.Type == "Colorpicker" then
            Z[a2] = U(a3.CurrentValue)
        else
            Z[a2] = a3.CurrentValue or a3.CurrentKeybind or a3.CurrentOption or
                        a3.Color
        end
    end
    writefile(d .. "/" .. z .. e, tostring(i:JSONEncode(Z)))
end
local a4 = (function()
    local a5 = {}
    do
        local function a6(a7) return a7 == a7 end
        local a8 = a6(p:ScreenPointToRay(0, 0).Origin.x)
        while not a8 do
            j.RenderStepped:wait()
            a8 = a6(p:ScreenPointToRay(0, 0).Origin.x)
        end
    end
    local a9 = p;
    if getgenv().SecureMode == nil then
        a9 = p
    else
        if not getgenv().SecureMode then
            a9 = p
        else
            a9 = nil
        end
    end
    local aa = {}
    local ab = Instance.new('Folder', a9)
    ab.Name = 'neon'
    local ac;
    do
        local ad = 0;
        function ac()
            ad = ad + 1;
            return 'neon::' .. tostring(ad)
        end
    end
    local ae;
    do
        local af, ag, ah, ai = math.acos, math.max, math.pi, math.sqrt;
        local aj = 0.2;
        function DrawTriangle(ak, al, am, an, ao)
            local ap = (ak - al).magnitude;
            local aq = (al - am).magnitude;
            local ar = (am - ak).magnitude;
            local as = ag(ap, aq, ar)
            local at, au, av;
            if ap == as then
                at, au, av = ak, al, am
            elseif aq == as then
                at, au, av = al, am, ak
            elseif ar == as then
                at, au, av = am, ak, al
            end
            local aw = ((au - at).x * (av - at).x + (au - at).y * (av - at).y +
                           (au - at).z * (av - at).z) / (at - au).magnitude;
            local ax = ai((av - at).magnitude ^ 2 - aw * aw)
            local ay = (at - au).magnitude - aw;
            local az = CFrame.new(au, at)
            local aA = CFrame.Angles(ah / 2, 0, 0)
            local aB = az;
            local aC = (aB * aA).lookVector;
            local aD = at + CFrame.new(at, au).LookVector * aw;
            local aE = CFrame.new(aD, av).LookVector;
            local aF = aC.x * aE.x + aC.y * aE.y + aC.z * aE.z;
            local aG = CFrame.Angles(0, 0, af(aF))
            aB = aB * aG;
            if ((aB * aA).lookVector - aE).magnitude > 0.01 then
                aB = aB * CFrame.Angles(0, 0, -2 * af(aF))
            end
            aB = aB * CFrame.new(0, ax / 2, -(ay + aw / 2))
            local aH = az * aG * CFrame.Angles(0, ah, 0)
            if ((aH * aA).lookVector - aE).magnitude > 0.01 then
                aH = aH * CFrame.Angles(0, 0, 2 * af(aF))
            end
            aH = aH * CFrame.new(0, ax / 2, ay / 2)
            if not an then
                an = Instance.new('Part')
                an.FormFactor = 'Custom'
                an.TopSurface = 0;
                an.BottomSurface = 0;
                an.Anchored = true;
                an.CanCollide = false;
                an.Material = 'Glass'
                an.Size = Vector3.new(aj, aj, aj)
                local aI = Instance.new('SpecialMesh', an)
                aI.MeshType = 2;
                aI.Name = 'WedgeMesh'
            end
            an.WedgeMesh.Scale = Vector3.new(0, ax / aj, aw / aj)
            an.CFrame = aB;
            if not ao then ao = an:clone() end
            ao.WedgeMesh.Scale = Vector3.new(0, ax / aj, ay / aj)
            ao.CFrame = aH;
            return an, ao
        end
        function ae(ak, al, am, aJ, aK)
            aK[1], aK[2] = DrawTriangle(ak, al, am, aK[1], aK[2])
            aK[3], aK[4] = DrawTriangle(am, al, aJ, aK[3], aK[4])
        end
    end
    function a5:BindFrame(aL, aM)
        if a9 == nil then return end
        if aa[aL] then return aa[aL].parts end
        local aN = ac()
        local aK = {}
        local aO = Instance.new('Folder', ab)
        aO.Name = aL.Name;
        local aP = {}
        do
            local function aQ(aR)
                if aR:IsA 'GuiObject' then
                    aP[#aP + 1] = aR;
                    aQ(aR.Parent)
                end
            end
            aQ(aL)
        end
        local function aS(aT)
            local aU = 1 - 0.05 * aL.ZIndex;
            local aV, aW = aL.AbsolutePosition,
                           aL.AbsolutePosition + aL.AbsoluteSize;
            local aX, aY = Vector2.new(aW.x, aV.y), Vector2.new(aV.x, aW.y)
            do
                local aZ = 0;
                for n, a3 in ipairs(aP) do aZ = aZ + a3.Rotation end
                if aZ ~= 0 and aZ % 180 ~= 0 then
                    local a_ = aV:lerp(aW, 0.5)
                    local b0, b1 = math.sin(math.rad(aZ)),
                                   math.cos(math.rad(aZ))
                    local b2 = aV;
                    aV = Vector2.new(b1 * (aV.x - a_.x) - b0 * (aV.y - a_.y),
                                     b0 * (aV.x - a_.x) + b1 * (aV.y - a_.y)) +
                             a_;
                    aX = Vector2.new(b1 * (aX.x - a_.x) - b0 * (aX.y - a_.y),
                                     b0 * (aX.x - a_.x) + b1 * (aX.y - a_.y)) +
                             a_;
                    aY = Vector2.new(b1 * (aY.x - a_.x) - b0 * (aY.y - a_.y),
                                     b0 * (aY.x - a_.x) + b1 * (aY.y - a_.y)) +
                             a_;
                    aW = Vector2.new(b1 * (aW.x - a_.x) - b0 * (aW.y - a_.y),
                                     b0 * (aW.x - a_.x) + b1 * (aW.y - a_.y)) +
                             a_
                end
            end
            ae(p:ScreenPointToRay(aV.x, aV.y, aU).Origin,
               p:ScreenPointToRay(aX.x, aX.y, aU).Origin,
               p:ScreenPointToRay(aY.x, aY.y, aU).Origin,
               p:ScreenPointToRay(aW.x, aW.y, aU).Origin, aK)
            if aT then
                for n, b3 in pairs(aK) do b3.Parent = aO end
                for b4, b5 in pairs(aM) do
                    for n, b3 in pairs(aK) do b3[b4] = b5 end
                end
            end
        end
        aS(true)
        j:BindToRenderStep(aN, 2000, aS)
        aa[aL] = {uid = aN, parts = aK}
        return aa[aL].parts
    end
    function a5:Modify(aL, aM)
        local aK = a5:GetBoundParts(aL)
        if aK then
            for b4, b5 in pairs(aM) do
                for n, b3 in pairs(aK) do b3[b4] = b5 end
            end
        end
    end
    function a5:UnbindFrame(aL)
        if a9 == nil then return end
        local b6 = aa[aL]
        if b6 then
            j:UnbindFromRenderStep(b6.uid)
            for n, a3 in pairs(b6.parts) do a3:Destroy() end
            aa[aL] = nil
        end
    end
    function a5:HasBinding(aL) return aa[aL] ~= nil end
    function a5:GetBoundParts(aL) return aa[aL] and aa[aL].parts end
    return a5
end)()
function ClosePrompt()
    local b7 = x.Prompt;
    E = false;
    h:Create(x, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(b7, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1, Size = UDim2.new(0, 340, 0, 140)})
        :Play()
    h:Create(b7.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {Transparency = 1}):Play()
    h:Create(b7.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    h:Create(b7.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    h:Create(b7.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    for n, b8 in pairs(b7.Buttons:GetChildren()) do
        if b8.Name ~= 'Template' and b8:IsA("Frame") then
            h:Create(b8.UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                     {Transparency = 1}):Play()
            h:Create(b8.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                     {TextTransparency = 1}):Play()
            delay(.2, function() b8:Destroy() end)
        end
    end
    wait(.5)
    x.Visible = false
end
function f:Notify(b9)
    spawn(function()
        local ba = true;
        local bb = G.Template:Clone()
        bb.Parent = G;
        bb.Name = b9.Title or "Unknown Title"
        bb.Visible = true;
        local bc = nil;
        if not getgenv().SecureMode then
            bc = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
            bc.Enabled = true;
            bc.FarIntensity = 0;
            bc.FocusDistance = 51.6;
            bc.InFocusRadius = 50;
            bc.NearIntensity = 1;
            game:GetService("Debris"):AddItem(script, 0)
        end
        bb.Actions.Template.Visible = false;
        if b9.Actions then
            for n, bd in pairs(b9.Actions) do
                ba = false;
                local be = bb.Actions.Template:Clone()
                be.BackgroundColor3 = H.NotificationActionsBackground;
                if H ~= f.Theme.Default then
                    be.TextColor3 = H.TextColor
                end
                be.Name = bd.Name;
                be.Visible = true;
                be.Parent = bb.Actions;
                be.Text = bd.Name;
                be.BackgroundTransparency = 1;
                be.TextTransparency = 1;
                be.Size = UDim2.new(0, be.TextBounds.X + 27, 0, 36)
                be.MouseButton1Click:Connect(function()
                    local bf, bg = pcall(bd.Callback)
                    if not bf then
                        print("Rayfield | Action: " .. bd.Name ..
                                  " Callback Error " .. tostring(bg))
                    end
                    ba = true
                end)
            end
        end
        bb.BackgroundColor3 = H.Background;
        bb.Title.Text = b9.Title or "Unknown"
        bb.Title.TextTransparency = 1;
        bb.Title.TextColor3 = H.TextColor;
        bb.Description.Text = b9.Content or "Unknown"
        bb.Description.TextTransparency = 1;
        bb.Description.TextColor3 = H.TextColor;
        bb.Icon.ImageColor3 = H.TextColor;
        if b9.Image then
            bb.Icon.Image = "rbxassetid://" .. tostring(b9.Image)
        else
            bb.Icon.Image = "rbxassetid://3944680095"
        end
        bb.Icon.ImageTransparency = 1;
        bb.Parent = G;
        bb.Size = UDim2.new(0, 260, 0, 80)
        bb.BackgroundTransparency = 1;
        h:Create(bb, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                 {Size = UDim2.new(0, 295, 0, 91)}):Play()
        h:Create(bb, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                 {BackgroundTransparency = 0.1}):Play()
        bb:TweenPosition(UDim2.new(0.5, 0, 0.915, 0), 'Out', 'Quint', 0.8, true)
        wait(0.3)
        h:Create(bb.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {ImageTransparency = 0}):Play()
        h:Create(bb.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                 {TextTransparency = 0}):Play()
        h:Create(bb.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {TextTransparency = 0.2}):Play()
        wait(0.2)
        if getgenv().SecureMode == nil then
            h:Create(bb, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0.4}):Play()
        else
            if not getgenv().SecureMode then
                h:Create(bb, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0.4}):Play()
            else
                h:Create(bb, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0}):Play()
            end
        end
        if m.Name == "Rayfield" then
            a4:BindFrame(bb.BlurModule, {
                Transparency = 0.98,
                BrickColor = BrickColor.new("Institutional white")
            })
        end
        if not b9.Actions then
            wait(b9.Duration or b - 0.5)
        else
            wait(0.8)
            h:Create(bb, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Size = UDim2.new(0, 295, 0, 132)}):Play()
            wait(0.3)
            for n, bd in ipairs(bb.Actions:GetChildren()) do
                if bd.ClassName == "TextButton" and bd.Name ~= "Template" then
                    h:Create(bd, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 0.2}):Play()
                    h:Create(bd, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {TextTransparency = 0}):Play()
                    wait(0.05)
                end
            end
        end
        repeat wait(0.001) until ba;
        for n, bd in ipairs(bb.Actions:GetChildren()) do
            if bd.ClassName == "TextButton" and bd.Name ~= "Template" then
                h:Create(bd, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 1}):Play()
                h:Create(bd, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {TextTransparency = 1}):Play()
            end
        end
        h:Create(bb.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {Position = UDim2.new(0.47, 0, 0.234, 0)}):Play()
        h:Create(bb.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                 {Position = UDim2.new(0.528, 0, 0.637, 0)}):Play()
        h:Create(bb, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {Size = UDim2.new(0, 280, 0, 83)}):Play()
        h:Create(bb.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                 {ImageTransparency = 1}):Play()
        h:Create(bb, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                 {BackgroundTransparency = 0.6}):Play()
        wait(0.3)
        h:Create(bb.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {TextTransparency = 0.4}):Play()
        h:Create(bb.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {TextTransparency = 0.5}):Play()
        wait(0.4)
        h:Create(bb, TweenInfo.new(0.9, Enum.EasingStyle.Quint),
                 {Size = UDim2.new(0, 260, 0, 0)}):Play()
        h:Create(bb, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                 {BackgroundTransparency = 1}):Play()
        h:Create(bb.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {TextTransparency = 1}):Play()
        h:Create(bb.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                 {TextTransparency = 1}):Play()
        wait(0.2)
        if not getgenv().SecureMode then
            a4:UnbindFrame(bb.BlurModule)
            bc:Destroy()
        end
        wait(0.9)
        bb:Destroy()
    end)
end
function Hide()
    D = true;
    f:Notify({
        Title = "Interface Hidden",
        Content = "The interface has been hidden, you can unhide the interface by pressing Home or RightShift",
        Duration = 7
    })
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 470, 0, 400)}):Play()
    h:Create(q.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 470, 0, 45)}):Play()
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(q.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(q.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(q.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(q.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {ImageTransparency = 1}):Play()
    h:Create(r.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Transparency = 1}):Play()
    for n, bh in ipairs(r:GetChildren()) do
        if bh.ClassName == "ImageButton" then
            h:Create(bh, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                     {ImageTransparency = 1}):Play()
        end
    end
    for n, bi in ipairs(u:GetChildren()) do
        if bi.ClassName == "Frame" and bi.Name ~= "Placeholder" then
            h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 1}):Play()
            h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {TextTransparency = 1}):Play()
            h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 1}):Play()
            h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 1}):Play()
            h:Create(bi.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {Transparency = 1}):Play()
        end
    end
    for n, bj in ipairs(s:GetChildren()) do
        if bj.Name ~= "Template" and bj.ClassName == "ScrollingFrame" and
            bj.Name ~= "Placeholder" then
            for n, bk in ipairs(bj:GetChildren()) do
                if bk.ClassName == "Frame" then
                    if bk.Name ~= "SectionSpacing" and bk.Name ~= "Placeholder" then
                        if bk.Name == "SectionTitle" then
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 1}):Play()
                        else
                            h:Create(bk, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 1}):Play()
                            h:Create(bk.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 1}):Play()
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 1}):Play()
                        end
                        for n, aR in ipairs(bk:GetChildren()) do
                            if aR.ClassName == "Frame" or aR.ClassName ==
                                "TextLabel" or aR.ClassName == "TextBox" or
                                aR.ClassName == "ImageButton" or aR.ClassName ==
                                "ImageLabel" then
                                aR.Visible = false
                            end
                        end
                    end
                end
            end
        end
    end
    wait(0.5)
    q.Visible = false;
    D = false
end
function Unhide()
    D = true;
    q.Position = UDim2.new(0.5, 0, 0.5, 0)
    q.Visible = true;
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 500, 0, 475)}):Play()
    h:Create(q.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 500, 0, 45)}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.4}):Play()
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    if B then spawn(Maximise) end
    for n, bh in ipairs(r:GetChildren()) do
        if bh.ClassName == "ImageButton" then
            h:Create(bh, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.8}):Play()
        end
    end
    for n, bi in ipairs(u:GetChildren()) do
        if bi.ClassName == "Frame" and bi.Name ~= "Placeholder" then
            if tostring(s.UIPageLayout.CurrentPage) == bi.Title.Text then
                h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0}):Play()
                h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {TextTransparency = 0}):Play()
                h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.9}):Play()
                h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0}):Play()
                h:Create(bi.UIStroke,
                         TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {Transparency = 1}):Play()
            else
                h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0.7}):Play()
                h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.2}):Play()
                h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.7}):Play()
                h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {TextTransparency = 0.2}):Play()
                h:Create(bi.UIStroke,
                         TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {Transparency = 0}):Play()
            end
        end
    end
    for n, bj in ipairs(s:GetChildren()) do
        if bj.Name ~= "Template" and bj.ClassName == "ScrollingFrame" and
            bj.Name ~= "Placeholder" then
            for n, bk in ipairs(bj:GetChildren()) do
                if bk.ClassName == "Frame" then
                    if bk.Name ~= "SectionSpacing" and bk.Name ~= "Placeholder" then
                        if bk.Name == "SectionTitle" then
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 0}):Play()
                        else
                            h:Create(bk, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 0}):Play()
                            h:Create(bk.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 0}):Play()
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 0}):Play()
                        end
                        for n, aR in ipairs(bk:GetChildren()) do
                            if aR.ClassName == "Frame" or aR.ClassName ==
                                "TextLabel" or aR.ClassName == "TextBox" or
                                aR.ClassName == "ImageButton" or aR.ClassName ==
                                "ImageLabel" then
                                aR.Visible = true
                            end
                        end
                    end
                end
            end
        end
    end
    wait(0.5)
    B = false;
    D = false
end
function CloseSearch()
    D = true;
    h:Create(v, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1, Size = UDim2.new(0, 460, 0, 35)})
        :Play()
    h:Create(v.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = 1}):Play()
    h:Create(v.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = 1}):Play()
    h:Create(v.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {Transparency = 1}):Play()
    h:Create(v.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = 1}):Play()
    h:Create(v.Input, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    delay(.3, function() v.Input.Visible = false end)
    wait(0.5)
    v.Visible = false;
    D = false
end
function OpenSearch()
    D = true;
    v.Visible = true;
    v.Input.Visible = true;
    h:Create(v, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0, Size = UDim2.new(0, 480, 0, 40)})
        :Play()
    h:Create(v.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.5}):Play()
    h:Create(v.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {Transparency = 0}):Play()
    h:Create(v.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = .8}):Play()
    h:Create(v.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {ImageTransparency = .8}):Play()
    h:Create(v.Input, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    wait(0.5)
    D = false
end
v.Input:GetPropertyChangedSignal('Text'):Connect(function()
    local bl = string.upper(v.Input.Text)
    for n, bm in ipairs(s:GetChildren()) do
        if bm ~= 'Template' then
            for n, L in pairs(bm:GetChildren()) do
                if L:IsA("Frame") and L.Name ~= 'Placeholder' and L.Name ~=
                    'SectionSpacing' and not L:GetAttribute('SectionTitle') then
                    if bl == "" or string.find(string.upper(L.Name), bl) ~= nil then
                        L.Visible = true
                    else
                        L.Visible = false
                    end
                end
            end
        end
    end
end)
v.Clear.MouseButton1Down:Connect(function()
    w.Position = UDim2.new(0.957, 0, .5, 0)
    w.Size = UDim2.new(0, 1, 0, 1)
    w.BackgroundTransparency = .9;
    local bn = {}
    bn.Size = UDim2.new(0, 1000, 0, 500)
    bn.BackgroundTransparency = 1;
    h:Create(w,
             TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
             bn):Play()
    v.Input.Text = ''
end)
function Maximise()
    D = true;
    r.ChangeSize.Image = "rbxassetid://" .. 10137941941;
    h:Create(r.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Transparency = 1}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.4}):Play()
    h:Create(r.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(r.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 500, 0, 475)}):Play()
    h:Create(r, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 500, 0, 45)}):Play()
    u.Visible = true;
    wait(0.2)
    s.Visible = true;
    for n, bj in ipairs(s:GetChildren()) do
        if bj.Name ~= "Template" and bj.ClassName == "ScrollingFrame" and
            bj.Name ~= "Placeholder" then
            for n, bk in ipairs(bj:GetChildren()) do
                if bk.ClassName == "Frame" then
                    if bk.Name ~= "SectionSpacing" and bk.Name ~= "Placeholder" then
                        if bk.Name == "SectionTitle" then
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 0}):Play()
                        else
                            h:Create(bk, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 0}):Play()
                            h:Create(bk.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 0}):Play()
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 0}):Play()
                        end
                        for n, aR in ipairs(bk:GetChildren()) do
                            if aR.ClassName == "Frame" or aR.ClassName ==
                                "TextLabel" or aR.ClassName == "TextBox" or
                                aR.ClassName == "ImageButton" or aR.ClassName ==
                                "ImageLabel" then
                                aR.Visible = true
                            end
                        end
                    end
                end
            end
        end
    end
    wait(0.1)
    for n, bi in ipairs(u:GetChildren()) do
        if bi.ClassName == "Frame" and bi.Name ~= "Placeholder" then
            if tostring(s.UIPageLayout.CurrentPage) == bi.Title.Text then
                h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0}):Play()
                h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0}):Play()
                h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {TextTransparency = 0}):Play()
                h:Create(bi.UIStroke,
                         TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {Transparency = 1}):Play()
                h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.9}):Play()
            else
                h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {BackgroundTransparency = 0.7}):Play()
                h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.7}):Play()
                h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {ImageTransparency = 0.2}):Play()
                h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {TextTransparency = 0.2}):Play()
                h:Create(bi.UIStroke,
                         TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                         {Transparency = 0}):Play()
            end
        end
    end
    wait(0.5)
    D = false
end
function Minimise()
    D = true;
    r.ChangeSize.Image = "rbxassetid://" .. 11036884234;
    for n, bi in ipairs(u:GetChildren()) do
        if bi.ClassName == "Frame" and bi.Name ~= "Placeholder" then
            h:Create(bi, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 1}):Play()
            h:Create(bi.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 1}):Play()
            h:Create(bi.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {TextTransparency = 1}):Play()
            h:Create(bi.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 1}):Play()
            h:Create(bi.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {Transparency = 1}):Play()
        end
    end
    for n, bj in ipairs(s:GetChildren()) do
        if bj.Name ~= "Template" and bj.ClassName == "ScrollingFrame" and
            bj.Name ~= "Placeholder" then
            for n, bk in ipairs(bj:GetChildren()) do
                if bk.ClassName == "Frame" then
                    if bk.Name ~= "SectionSpacing" and bk.Name ~= "Placeholder" then
                        if bk.Name == "SectionTitle" then
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 1}):Play()
                        else
                            h:Create(bk, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 1}):Play()
                            h:Create(bk.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 1}):Play()
                            h:Create(bk.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 1}):Play()
                        end
                        for n, aR in ipairs(bk:GetChildren()) do
                            if aR.ClassName == "Frame" or aR.ClassName ==
                                "TextLabel" or aR.ClassName == "TextBox" or
                                aR.ClassName == "ImageButton" or aR.ClassName ==
                                "ImageLabel" then
                                aR.Visible = false
                            end
                        end
                    end
                end
            end
        end
    end
    h:Create(r.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Transparency = 0}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {ImageTransparency = 1}):Play()
    h:Create(r.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(r.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 1}):Play()
    h:Create(q, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 495, 0, 45)}):Play()
    h:Create(r, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 495, 0, 45)}):Play()
    wait(0.3)
    s.Visible = false;
    u.Visible = false;
    wait(0.2)
    D = false
end
function f:CreateWindow(bo)
    local bp = false;
    r.Title.Text = bo.Name;
    q.Size = UDim2.new(0, 450, 0, 260)
    q.Visible = true;
    q.BackgroundTransparency = 1;
    t.Title.TextTransparency = 1;
    t.Subtitle.TextTransparency = 1;
    q.Shadow.Image.ImageTransparency = 1;
    t.Version.TextTransparency = 1;
    t.Title.Text = bo.LoadingTitle or ""
    t.Subtitle.Text = bo.LoadingSubtitle or ""
    t.Version.Text = bo.LoadingVersion or ""
    r.Visible = false;
    s.Visible = false;
    t.Visible = true;
    pcall(function()
        if not bo.ConfigurationSaving.FileName then
            bo.ConfigurationSaving.FileName = tostring(game.PlaceId)
        end
        if not isfolder(c .. "/" .. "Configuration Folders") then end
        if bo.ConfigurationSaving.Enabled == nil then
            bo.ConfigurationSaving.Enabled = false
        end
        z = bo.ConfigurationSaving.FileName;
        d = bo.ConfigurationSaving.FolderName or d;
        A = bo.ConfigurationSaving.Enabled;
        if bo.ConfigurationSaving.Enabled then
            if not isfolder(d) then makefolder(d) end
        end
    end)
    M(r, q)
    for n, bq in ipairs(u:GetChildren()) do
        if bq.ClassName == "Frame" and bq.Name ~= "Placeholder" then
            bq.BackgroundTransparency = 1;
            bq.Title.TextTransparency = 1;
            bq.Shadow.ImageTransparency = 1;
            bq.Image.ImageTransparency = 1;
            bq.UIStroke.Transparency = 1
        end
    end
    if bo.Discord then
        if not isfolder(c .. "/Discord Invites") then
            makefolder(c .. "/Discord Invites")
        end
        if not isfile(c .. "/Discord Invites" .. "/" .. bo.Discord.Invite .. e) then
            if y then
                y({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = i:JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = i:GenerateGUID(false),
                        args = {code = bo.Discord.Invite}
                    })
                })
            end
            if bo.Discord.RememberJoins then
                writefile(
                    c .. "/Discord Invites" .. "/" .. bo.Discord.Invite .. e,
                    "Rayfield RememberJoins is true for this invite, this invite will not ask you to join again")
            end
        else
        end
    end
    G.Template.Visible = false;
    G.Visible = true;
    m.Enabled = true;
    wait(0.5)
    h:Create(q, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.55}):Play()
    wait(0.1)
    h:Create(t.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    wait(0.05)
    h:Create(t.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    wait(0.05)
    h:Create(t.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    s.Template.LayoutOrder = 100000;
    s.Template.Visible = false;
    s.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal;
    u.Template.Visible = false;
    local br = false;
    local bs = {}
    function bs:CreateTab(bt, bu)
        local bv = false;
        local bq = u.Template:Clone()
        bq.Name = bt;
        bq.Title.Text = bt;
        bq.Parent = u;
        bq.Title.TextWrapped = false;
        bq.Size = UDim2.new(0, bq.Title.TextBounds.X + 30, 0, 30)
        if bu then
            bq.Title.AnchorPoint = Vector2.new(0, 0.5)
            bq.Title.Position = UDim2.new(0, 37, 0.5, 0)
            bq.Image.Image = "rbxassetid://" .. bu;
            bq.Image.Visible = true;
            bq.Title.TextXAlignment = Enum.TextXAlignment.Left;
            bq.Size = UDim2.new(0, bq.Title.TextBounds.X + 46, 0, 30)
        end
        bq.BackgroundTransparency = 1;
        bq.Title.TextTransparency = 1;
        bq.Shadow.ImageTransparency = 1;
        bq.Image.ImageTransparency = 1;
        bq.UIStroke.Transparency = 1;
        bq.Visible = true;
        local K = s.Template:Clone()
        K.Name = bt;
        K.Visible = true;
        K.LayoutOrder = #s:GetChildren()
        for n, bw in ipairs(K:GetChildren()) do
            if bw.ClassName == "Frame" and bw.Name ~= "Placeholder" then
                bw:Destroy()
            end
        end
        K.Parent = s;
        if not br then
            s.UIPageLayout.Animated = false;
            s.UIPageLayout:JumpTo(K)
            s.UIPageLayout.Animated = true
        end
        if H ~= f.Theme.Default then bq.Shadow.Visible = false end
        bq.UIStroke.Color = H.TabStroke;
        wait(0.1)
        if br then
            bq.BackgroundColor3 = H.TabBackground;
            bq.Image.ImageColor3 = H.TabTextColor;
            bq.Title.TextColor3 = H.TabTextColor;
            h:Create(bq, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0.7}):Play()
            h:Create(bq.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0.2}):Play()
            h:Create(bq.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.2}):Play()
            h:Create(bq.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(bq.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.7}):Play()
        else
            br = bt;
            bq.BackgroundColor3 = H.TabBackgroundSelected;
            bq.Image.ImageColor3 = H.SelectedTabTextColor;
            bq.Title.TextColor3 = H.SelectedTabTextColor;
            h:Create(bq.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.9}):Play()
            h:Create(bq.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0}):Play()
            h:Create(bq, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bq.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
        end
        bq.Interact.MouseButton1Click:Connect(function()
            if B then return end
            h:Create(bq, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bq.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 1}):Play()
            h:Create(bq.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            h:Create(bq.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0}):Play()
            h:Create(bq, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundColor3 = H.TabBackgroundSelected}):Play()
            h:Create(bq.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextColor3 = H.SelectedTabTextColor}):Play()
            h:Create(bq.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageColor3 = H.SelectedTabTextColor}):Play()
            h:Create(bq.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.9}):Play()
            for n, bx in ipairs(u:GetChildren()) do
                if bx.Name ~= "Template" and bx.ClassName == "Frame" and bx ~=
                    bq and bx.Name ~= "Placeholder" then
                    h:Create(bx, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.TabBackground}):Play()
                    h:Create(bx.Title,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {TextColor3 = H.TabTextColor}):Play()
                    h:Create(bx.Image,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {ImageColor3 = H.TabTextColor}):Play()
                    h:Create(bx, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 0.7}):Play()
                    h:Create(bx.Title,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {TextTransparency = 0.2}):Play()
                    h:Create(bx.Image,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {ImageTransparency = 0.2}):Play()
                    h:Create(bx.Shadow,
                             TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                             {ImageTransparency = 0.7}):Play()
                    h:Create(bx.UIStroke,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
            end
            if s.UIPageLayout.CurrentPage ~= K then
                h:Create(s, TweenInfo.new(1, Enum.EasingStyle.Quint),
                         {Size = UDim2.new(0, 460, 0, 330)}):Play()
                s.UIPageLayout:JumpTo(K)
                wait(0.2)
                h:Create(s, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                         {Size = UDim2.new(0, 475, 0, 366)}):Play()
            end
        end)
        local by = {}
        function by:CreateButton(bz)
            local bA = {}
            local bB = s.Template.Button:Clone()
            bB.Name = bz.Name;
            bB.Title.Text = bz.Name;
            bB.ElementIndicator.Text = bz.Interact or 'button'
            bB.Visible = true;
            bB.Parent = K;
            bB.BackgroundTransparency = 1;
            bB.UIStroke.Transparency = 1;
            bB.Title.TextTransparency = 1;
            h:Create(bB, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bB.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(bB.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            if bz.Info then
                bB.Description.Text = bz.Info;
                local bC = false;
                local bD = false;
                local bE = bB.Size.Y.Offset;
                bB.MouseEnter:Connect(function(a7, bF)
                    bC = true;
                    wait(0.2)
                    if bC then
                        bD = true;
                        bB.Description.Visible = true;
                        game:GetService('TweenService'):Create(bB,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE +
                                                 bB.Description.Size.Y.Offset +
                                                 15)
                        }):Play()
                    end
                end)
                bB.MouseLeave:Connect(function(a7, bF)
                    if bC then bC = false end
                    if bD then
                        bD = false;
                        game:GetService('TweenService'):Create(bB,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE)
                        }):Play()
                        delay(.4, function()
                            if not bD then
                                bB.Description.Visible = false
                            end
                        end)
                    end
                end)
            end
            bB.Interact.MouseButton1Click:Connect(function()
                local bf, bg = pcall(bz.Callback)
                if not bf then
                    h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(bB.ElementIndicator,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {TextTransparency = 1}):Play()
                    h:Create(bB.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    bB.Title.Text = "Callback Error"
                    print("Rayfield | " .. bz.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    bB.Title.Text = bz.Name;
                    h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(bB.ElementIndicator,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {TextTransparency = 0.9}):Play()
                    h:Create(bB.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                else
                    a1()
                    h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                    h:Create(bB.ElementIndicator,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {TextTransparency = 1}):Play()
                    h:Create(bB.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    wait(0.2)
                    h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(bB.ElementIndicator,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {TextTransparency = 0.9}):Play()
                    h:Create(bB.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
            end)
            bB.MouseEnter:Connect(function()
                h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
                h:Create(bB.ElementIndicator,
                         TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {TextTransparency = 0.7}):Play()
            end)
            bB.MouseLeave:Connect(function()
                h:Create(bB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
                h:Create(bB.ElementIndicator,
                         TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {TextTransparency = 0.9}):Play()
            end)
            function bA:Set(bG, bH)
                bB.Title.Text = bG;
                bB.Name = bG;
                bB.ElementIndicator.Text = bH
            end
            return bA
        end
        function by:CreateSection(bI)
            local bJ = {}
            if bv then
                local bK = s.Template.SectionSpacing:Clone()
                bK.Visible = true;
                bK.Parent = K
            end
            local bL = s.Template.SectionTitle:Clone()
            bL.Title.Text = bI;
            bL.Visible = true;
            bL.Parent = K;
            bL.Title.TextTransparency = 1;
            h:Create(bL.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            function bJ:Set(bM) bL.Title.Text = bM end
            bv = true;
            return bJ
        end
        function by:CreateLabel(bN)
            local bO = {}
            local bP = s.Template.Label:Clone()
            bP.Title.Text = bN;
            bP.Visible = true;
            bP.Parent = K;
            bP.BackgroundTransparency = 1;
            bP.UIStroke.Transparency = 1;
            bP.Title.TextTransparency = 1;
            bP.BackgroundColor3 = H.SecondaryElementBackground;
            bP.UIStroke.Color = H.SecondaryElementStroke;
            h:Create(bP, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bP.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(bP.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            function bO:Set(bQ) bP.Title.Text = bQ end
            return bO
        end
        function by:CreateParagraph(bR)
            local bS = {}
            local bT = s.Template.Paragraph:Clone()
            bT.Title.Text = bR.Title;
            bT.Content.Text = bR.Content;
            bT.Visible = true;
            bT.Parent = K;
            bT.Content.Size = UDim2.new(0, 438, 0, bT.Content.TextBounds.Y)
            bT.Content.Position = UDim2.new(1, -10, 0.575, 0)
            bT.Size = UDim2.new(1, -10, 0, bT.Content.TextBounds.Y + 40)
            bT.BackgroundTransparency = 1;
            bT.UIStroke.Transparency = 1;
            bT.Title.TextTransparency = 1;
            bT.Content.TextTransparency = 1;
            bT.BackgroundColor3 = H.SecondaryElementBackground;
            bT.UIStroke.Color = H.SecondaryElementStroke;
            h:Create(bT, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bT.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(bT.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            h:Create(bT.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            function bS:Set(bU)
                bT.Title.Text = bU.Title;
                bT.Content.Text = bU.Content
            end
            return bS
        end
        function by:CreateInput(bV)
            local S = s.Template.Input:Clone()
            S.Name = bV.Name;
            S.Title.Text = bV.Name;
            S.Visible = true;
            S.Parent = K;
            S.BackgroundTransparency = 1;
            S.UIStroke.Transparency = 1;
            S.Title.TextTransparency = 1;
            S.InputFrame.BackgroundColor3 = H.InputBackground;
            S.InputFrame.UIStroke.Color = H.InputStroke;
            h:Create(S, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(S.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(S.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            S.InputFrame.InputBox.PlaceholderText = bV.PlaceholderText;
            S.InputFrame.Size = UDim2.new(0,
                                          S.InputFrame.InputBox.TextBounds.X +
                                              24, 0, 30)
            if bV.Info then
                S.Description.Text = bV.Info;
                local bC = false;
                local bD = false;
                local bE = S.Size.Y.Offset;
                S.MouseEnter:Connect(function(a7, bF)
                    bC = true;
                    wait(0.2)
                    if bC then
                        bD = true;
                        S.Description.Visible = true;
                        game:GetService('TweenService'):Create(S,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE +
                                                 S.Description.Size.Y.Offset +
                                                 15)
                        }):Play()
                    end
                end)
                S.MouseLeave:Connect(function(a7, bF)
                    if bC then bC = false end
                    if bD then
                        bD = false;
                        game:GetService('TweenService'):Create(S,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE)
                        }):Play()
                        delay(.4, function()
                            if not bD then
                                S.Description.Visible = false
                            end
                        end)
                    end
                end)
            end
            if bV.NumbersOnly or bV.CharacterLimit then
                S.InputFrame.InputBox:GetPropertyChangedSignal('Text'):Connect(
                    function()
                        if bV.CharacterLimit then
                            S.InputFrame.InputBox.Text =
                                S.InputFrame.InputBox.Text:sub(1,
                                                               bV.CharacterLimit)
                        end
                        if bV.NumbersOnly then
                            S.InputFrame.InputBox.Text =
                                S.InputFrame.InputBox.Text:gsub('[^0-9.<>]', '')
                        end
                    end)
            end
            S.InputFrame.InputBox.FocusLost:Connect(function(bW)
                if bV.OnEnter and not bW then
                    if bV.RemoveTextAfterFocusLost then
                        S.InputFrame.InputBox.Text = ""
                    end
                    return
                end
                local bf, bg = pcall(function()
                    bV.Callback(S.InputFrame.InputBox.Text)
                end)
                if not bf then
                    h:Create(S, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(S.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    S.Title.Text = "Callback Error"
                    print("Rayfield | " .. bV.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    S.Title.Text = bV.Name;
                    h:Create(S, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(S.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                if bV.RemoveTextAfterFocusLost then
                    S.InputFrame.InputBox.Text = ""
                end
                a1()
            end)
            S.MouseEnter:Connect(function()
                h:Create(S, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
            end)
            S.MouseLeave:Connect(function()
                h:Create(S, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
            end)
            S.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(
                function()
                    h:Create(S.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle
                                                             .Quint,
                                                         Enum.EasingDirection
                                                             .Out), {
                        Size = UDim2.new(0,
                                         S.InputFrame.InputBox.TextBounds.X + 24,
                                         0, 30)
                    }):Play()
                end)
        end
        function by:CreateDropdown(bX)
            local bY = s.Template.Dropdown:Clone()
            if string.find(bX.Name, "closed") then
                bY.Name = "Dropdown"
            else
                bY.Name = bX.Name
            end
            bY.Title.Text = bX.Name;
            bY.Visible = true;
            bY.Parent = K;
            bY.List.Visible = false;
            if typeof(bX.CurrentOption) == "string" then
                bX.CurrentOption = {bX.CurrentOption}
            end
            if not bX.MultipleOptions then
                bX.CurrentOption = {bX.CurrentOption[1]}
            end
            if bX.MultipleOptions then
                if #bX.CurrentOption == 1 then
                    bY.Selected.Text = bX.CurrentOption[1]
                elseif #bX.CurrentOption == 0 then
                    bY.Selected.Text = "None"
                else
                    bY.Selected.Text = "Various"
                end
            else
                bY.Selected.Text = bX.CurrentOption[1]
            end
            bY.BackgroundTransparency = 1;
            bY.UIStroke.Transparency = 1;
            bY.Title.TextTransparency = 1;
            bY.Size = UDim2.new(1, -10, 0, 45)
            h:Create(bY, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(bY.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(bY.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            for n, bZ in ipairs(bY.List:GetChildren()) do
                if bZ.ClassName == "Frame" and bZ.Name ~= "ZZZZZZZZZ" and
                    bZ.Name ~= "," and bZ.Name ~= ",---S=()earch" then
                    bZ:Destroy()
                end
            end
            bY.Toggle.Rotation = 180;
            bY.Interact.MouseButton1Click:Connect(function()
                h:Create(bY, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
                h:Create(bY.UIStroke,
                         TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                         {Transparency = 1}):Play()
                wait(0.1)
                h:Create(bY, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
                h:Create(bY.UIStroke,
                         TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                         {Transparency = 0}):Play()
                if D then return end
                if bY.List.Visible then
                    D = true;
                    h:Create(bY, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(1, -10, 0, 45)}):Play()
                    for n, b_ in ipairs(bY.List:GetChildren()) do
                        if b_.ClassName == "Frame" and b_.Name ~= "ZZZZZZZZZ" and
                            b_.Name ~= "," and b_.Name ~= ",---S=()earch" then
                            h:Create(b_, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 1}):Play()
                            h:Create(b_.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 1}):Play()
                            h:Create(b_.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 1}):Play()
                        end
                    end
                    h:Create(bY.List,
                             TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                             {ScrollBarImageTransparency = 1}):Play()
                    h:Create(bY.Toggle,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {Rotation = 180}):Play()
                    wait(0.35)
                    bY.List.Visible = false;
                    D = false
                else
                    h:Create(bY, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(1, -10, 0, 186)}):Play()
                    bY.List.Visible = true;
                    h:Create(bY.List,
                             TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                             {ScrollBarImageTransparency = 0.7}):Play()
                    h:Create(bY.Toggle,
                             TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                             {Rotation = 0}):Play()
                    for n, b_ in ipairs(bY.List:GetChildren()) do
                        if b_.ClassName == "Frame" and b_.Name ~= "ZZZZZZZZZ" and
                            b_.Name ~= "," and b_.Name ~= ",---S=()earch" then
                            h:Create(b_, TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundTransparency = 0}):Play()
                            h:Create(b_.UIStroke, TweenInfo.new(0.3,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 0}):Play()
                            h:Create(b_.Title, TweenInfo.new(0.3,
                                                             Enum.EasingStyle
                                                                 .Quint),
                                     {TextTransparency = 0}):Play()
                        end
                    end
                end
            end)
            bY.List[',---S=()earch'].Input:GetPropertyChangedSignal('Text')
                :Connect(function()
                    local bl = string.upper(bY.List[',---S=()earch'].Input.Text)
                    for n, c0 in ipairs(bY.List:GetChildren()) do
                        if c0:IsA('Frame') and c0.Name ~= 'Template' and c0.Name ~=
                            ',---S=()earch' and c0.Name ~= ',' and c0.Name ~=
                            'ZZZZZZZZZ' then
                            if bl == "" or
                                string.find(string.upper(c0.Name), bl) ~= nil then
                                c0.Visible = true
                            else
                                c0.Visible = false
                            end
                        end
                    end
                end)
            bY.MouseEnter:Connect(function()
                if not bY.List.Visible then
                    h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                end
            end)
            bY.MouseLeave:Connect(function()
                h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
            end)
            local function c1(c2)
                h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
                h:Create(bY.UIStroke,
                         TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {Transparency = 1}):Play()
                bY.Title.Text = c2;
                wait(0.5)
                bY.Title.Text = bX.Name;
                h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
                h:Create(bY.UIStroke,
                         TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {Transparency = 0}):Play()
            end
            local function c3(c4, c5)
                local c6 = s.Template.Dropdown.List.Template:Clone()
                c6.Name = c4;
                c6.Title.Text = c4;
                c6.Parent = bY.List;
                c6.Visible = true;
                if bX.CurrentOption == c4 then
                    c6.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
                c6.BackgroundTransparency = 1;
                c6.UIStroke.Transparency = 1;
                c6.Title.TextTransparency = 1;
                c6.Interact.ZIndex = 50;
                c6.Interact.MouseButton1Click:Connect(function()
                    if bY.Selected.Text ~= c4 then
                        bY.Selected.Text = c4;
                        local bf, bg = pcall(function()
                            bX.Callback(c4)
                        end)
                        if not bf then
                            c1('Callback Error')
                            print(
                                "Rayfield | " .. bX.Name .. " Callback Error " ..
                                    tostring(bg))
                        end
                        bX.CurrentOption = c4;
                        for n, c7 in ipairs(bY.List:GetChildren()) do
                            if c7.ClassName == "Frame" and c7.Name ~=
                                "ZZZZZZZZZ" and c7.Name ~= "," and c7.Name ~=
                                ",---S=()earch" and c7.Name ~= bX.CurrentOption then
                                h:Create(c7,
                                         TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                         {
                                    BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                }):Play()
                            end
                        end
                        h:Create(c6.UIStroke,
                                 TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                                 {Transparency = 1}):Play()
                        h:Create(c6, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                                 {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
                            :Play()
                        D = true;
                        wait(0.2)
                        h:Create(c6.UIStroke,
                                 TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                                 {Transparency = 0}):Play()
                        wait(0.1)
                        h:Create(bY, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                                 {Size = UDim2.new(1, -10, 0, 45)}):Play()
                        for n, b_ in ipairs(bY.List:GetChildren()) do
                            if b_.ClassName == "Frame" and b_.Name ~=
                                "ZZZZZZZZZ" and b_.Name ~= "," and b_.Name ~=
                                ",---S=()earch" then
                                h:Create(b_,
                                         TweenInfo.new(0.3,
                                                       Enum.EasingStyle.Quint),
                                         {BackgroundTransparency = 1}):Play()
                                h:Create(b_.UIStroke, TweenInfo.new(0.3,
                                                                    Enum.EasingStyle
                                                                        .Quint),
                                         {Transparency = 1}):Play()
                                h:Create(b_.Title, TweenInfo.new(0.3,
                                                                 Enum.EasingStyle
                                                                     .Quint),
                                         {TextTransparency = 1}):Play()
                            end
                        end
                        h:Create(bY.List,
                                 TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                                 {ScrollBarImageTransparency = 1}):Play()
                        h:Create(bY.Toggle,
                                 TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                                 {Rotation = 180}):Play()
                        wait(0.35)
                        bY.List.Visible = false
                    end
                    D = false;
                    a1()
                end)
            end
            for n, c7 in ipairs(bY.List:GetChildren()) do
                if c7.ClassName == "Frame" and c7.Name ~= "Placeholder" then
                    if not table.find(bX.CurrentOption, c7.Name) then
                        c7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    else
                        c7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    end
                end
            end
            function bX:Add(c8, c5) c3(c8, c5) end
            local function c9(ca, c5)
                for n, c4 in ipairs(ca) do c3(c4, c5) end
                if bo.ConfigurationSaving then
                    if bo.ConfigurationSaving.Enabled and bX.Flag then
                        f.Flags[bX.Flag] = bX
                    end
                end
            end
            c9(bX.Options)
            function bX:Set(cb)
                bX.CurrentOption = cb;
                if typeof(bX.CurrentOption) == "string" then
                    bX.CurrentOption = {bX.CurrentOption}
                end
                if not bX.MultipleOptions then
                    bX.CurrentOption = {bX.CurrentOption[1]}
                end
                if bX.MultipleOptions then
                    if #bX.CurrentOption == 1 then
                        bY.Selected.Text = bX.CurrentOption[1]
                    elseif #bX.CurrentOption == 0 then
                        bY.Selected.Text = "None"
                    else
                        bY.Selected.Text = "Various"
                    end
                else
                    bY.Selected.Text = bX.CurrentOption[1]
                end
                local bf, bg = pcall(function() bX.Callback(cb) end)
                if not bf then
                    h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(bY.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    bY.Title.Text = "Callback Error"
                    print("Rayfield | " .. bX.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    bY.Title.Text = bX.Name;
                    h:Create(bY, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(bY.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                for n, c7 in ipairs(bY.List:GetChildren()) do
                    if c7.Name ~= cb then
                        if c7.ClassName == "Frame" and c7.Name ~= "ZZZZZZZZZ" and
                            c7.Name ~= "," and c7.Name ~= '---S=()earch' then
                            c7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        end
                    else
                        c7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    end
                end
            end
            function bX:Error(c2) c1(c2) end
            function bX:Refresh(cc, cd)
                bY.Selected.Text = cd;
                for n, ce in ipairs(bY.List:GetChildren()) do
                    if ce.ClassName == "Frame" and ce.Name ~= ',---S=()earch' and
                        ce.Name ~= "ZZZZZZZZZ" and ce.Name ~= "," and ce.Name ~=
                        '---S=()earch' then ce:Destroy() end
                end
                c9(cc, cd)
            end
            function bX:Remove(c8)
                if c8.Name ~= "ZZZZZZZZZ" and c8.Name ~= "," and c8 ~=
                    '---S=()earch' then
                    if bY.List:FindFirstChild(c8) then
                        bY.List[c8]:Destroy()
                    else
                        c1('Option not found.')
                    end
                else
                    c1("No")
                end
                if bY.Selected.Text == c8 then
                    bY.Selected.Text = ''
                end
            end
            return bX
        end
        function by:CreateKeybind(cf)
            local cg = false;
            local ch = s.Template.Keybind:Clone()
            ch.Name = cf.Name;
            ch.Title.Text = cf.Name;
            ch.Visible = true;
            ch.Parent = K;
            ch.BackgroundTransparency = 1;
            ch.UIStroke.Transparency = 1;
            ch.Title.TextTransparency = 1;
            ch.KeybindFrame.BackgroundColor3 = H.InputBackground;
            ch.KeybindFrame.UIStroke.Color = H.InputStroke;
            h:Create(ch, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(ch.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(ch.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            if cf.Info then
                ch.Description.Text = cf.Info;
                local bC = false;
                local bD = false;
                local bE = ch.Size.Y.Offset;
                ch.MouseEnter:Connect(function(a7, bF)
                    bC = true;
                    wait(0.2)
                    if bC then
                        bD = true;
                        ch.Description.Visible = true;
                        game:GetService('TweenService'):Create(ch,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE +
                                                 ch.Description.Size.Y.Offset +
                                                 15)
                        }):Play()
                    end
                end)
                ch.MouseLeave:Connect(function(a7, bF)
                    if bC then bC = false end
                    if bD then
                        bD = false;
                        game:GetService('TweenService'):Create(ch,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE)
                        }):Play()
                        delay(.4, function()
                            if not bD then
                                ch.Description.Visible = false
                            end
                        end)
                    end
                end)
            end
            ch.KeybindFrame.KeybindBox.Text = cf.CurrentKeybind;
            ch.KeybindFrame.Size = UDim2.new(0, ch.KeybindFrame.KeybindBox
                                                 .TextBounds.X + 24, 0, 30)
            ch.KeybindFrame.KeybindBox.Focused:Connect(function()
                cg = true;
                ch.KeybindFrame.KeybindBox.Text = ""
            end)
            ch.KeybindFrame.KeybindBox.FocusLost:Connect(function()
                cg = false;
                if ch.KeybindFrame.KeybindBox.Text == nil or "" then
                    ch.KeybindFrame.KeybindBox.Text = cf.CurrentKeybind;
                    a1()
                end
            end)
            ch.MouseEnter:Connect(function()
                h:Create(ch, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
            end)
            ch.MouseLeave:Connect(function()
                h:Create(ch, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
            end)
            g.InputBegan:Connect(function(ci, cj)
                if cg then
                    if ci.KeyCode ~= Enum.KeyCode.Unknown and ci.KeyCode ~=
                        Enum.KeyCode.Home and ci.KeyCode ~=
                        Enum.KeyCode.RightShift then
                        local ck = string.split(tostring(ci.KeyCode), ".")
                        local cl = ck[3]
                        ch.KeybindFrame.KeybindBox.Text = tostring(cl)
                        cf.CurrentKeybind = tostring(cl)
                        ch.KeybindFrame.KeybindBox:ReleaseFocus()
                        a1()
                    end
                elseif cf.CurrentKeybind ~= nil and
                    (ci.KeyCode == Enum.KeyCode[cf.CurrentKeybind] and not cj) then
                    local cm = true;
                    local cn;
                    cn = ci.Changed:Connect(function(co)
                        if co == "UserInputState" then
                            cn:Disconnect()
                            cm = false
                        end
                    end)
                    if not cf.HoldToInteract then
                        local bf, bg = pcall(cf.Callback)
                        if not bf then
                            h:Create(ch, TweenInfo.new(0.6,
                                                       Enum.EasingStyle.Quint),
                                     {
                                BackgroundColor3 = Color3.fromRGB(85, 0, 0)
                            }):Play()
                            h:Create(ch.UIStroke, TweenInfo.new(0.6,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 1}):Play()
                            ch.Title.Text = "Callback Error"
                            print(
                                "Rayfield | " .. cf.Name .. " Callback Error " ..
                                    tostring(bg))
                            wait(0.5)
                            ch.Title.Text = cf.Name;
                            h:Create(ch, TweenInfo.new(0.6,
                                                       Enum.EasingStyle.Quint),
                                     {BackgroundColor3 = H.ElementBackground})
                                :Play()
                            h:Create(ch.UIStroke, TweenInfo.new(0.6,
                                                                Enum.EasingStyle
                                                                    .Quint),
                                     {Transparency = 0}):Play()
                        end
                    else
                        wait(0.25)
                        if cm then
                            local cp;
                            cp = j.Stepped:Connect(function()
                                if not cm then
                                    cf.Callback(false)
                                    cp:Disconnect()
                                else
                                    cf.Callback(true)
                                end
                            end)
                        end
                    end
                end
            end)
            ch.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(
                function()
                    h:Create(ch.KeybindFrame, TweenInfo.new(0.55,
                                                            Enum.EasingStyle
                                                                .Quint,
                                                            Enum.EasingDirection
                                                                .Out), {
                        Size = UDim2.new(0,
                                         ch.KeybindFrame.KeybindBox.TextBounds.X +
                                             24, 0, 30)
                    }):Play()
                end)
            function cf:Set(cq)
                ch.KeybindFrame.KeybindBox.Text = tostring(cq)
                cf.CurrentKeybind = tostring(cq)
                ch.KeybindFrame.KeybindBox:ReleaseFocus()
                a1()
            end
            if bo.ConfigurationSaving then
                if bo.ConfigurationSaving.Enabled and cf.Flag then
                    f.Flags[cf.Flag] = cf
                end
            end
            return cf
        end
        function by:CreateToggle(cr)
            local cs = {}
            local ct = s.Template.Toggle:Clone()
            ct.Name = cr.Name;
            ct.Title.Text = cr.Name;
            ct.Visible = true;
            ct.Parent = K;
            ct.BackgroundTransparency = 1;
            ct.UIStroke.Transparency = 1;
            ct.Title.TextTransparency = 1;
            ct.Switch.BackgroundColor3 = H.ToggleBackground;
            if H ~= f.Theme.Default then
                ct.Switch.Shadow.Visible = false
            end
            h:Create(ct, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(ct.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(ct.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            if cr.Info then
                ct.Description.Text = cr.Info;
                local bC = false;
                local bD = false;
                local bE = ct.Size.Y.Offset;
                ct.MouseEnter:Connect(function(a7, bF)
                    bC = true;
                    wait(0.2)
                    if bC then
                        bD = true;
                        ct.Description.Visible = true;
                        game:GetService('TweenService'):Create(ct,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE +
                                                 ct.Description.Size.Y.Offset +
                                                 15)
                        }):Play()
                    end
                end)
                ct.MouseLeave:Connect(function(a7, bF)
                    if bC then bC = false end
                    if bD then
                        bD = false;
                        game:GetService('TweenService'):Create(ct,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE)
                        }):Play()
                        delay(.4, function()
                            if not bD then
                                ct.Description.Visible = false
                            end
                        end)
                    end
                end)
            end
            if not cr.CurrentValue then
                ct.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
                ct.Switch.Indicator.UIStroke.Color = H.ToggleDisabledStroke;
                ct.Switch.Indicator.BackgroundColor3 = H.ToggleDisabled;
                ct.Switch.UIStroke.Color = H.ToggleDisabledOuterStroke
            else
                ct.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
                ct.Switch.Indicator.UIStroke.Color = H.ToggleEnabledStroke;
                ct.Switch.Indicator.BackgroundColor3 = H.ToggleEnabled;
                ct.Switch.UIStroke.Color = H.ToggleEnabledOuterStroke
            end
            ct.MouseEnter:Connect(function()
                h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
            end)
            ct.MouseLeave:Connect(function()
                h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
            end)
            ct.Interact.MouseButton1Click:Connect(function()
                if cr.CurrentValue then
                    cr.CurrentValue = false;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.45,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    h:Create(ct.Switch.Indicator.UIStroke, TweenInfo.new(0.55,
                                                                         Enum.EasingStyle
                                                                             .Quint,
                                                                         Enum.EasingDirection
                                                                             .Out),
                             {Color = H.ToggleDisabledStroke}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.8,
                                                                Enum.EasingStyle
                                                                    .Quint,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {BackgroundColor3 = H.ToggleDisabled}):Play()
                    h:Create(ct.Switch.UIStroke, TweenInfo.new(0.55,
                                                               Enum.EasingStyle
                                                                   .Quint,
                                                               Enum.EasingDirection
                                                                   .Out),
                             {Color = H.ToggleDisabledOuterStroke}):Play()
                    wait(0.05)
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    wait(0.15)
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                else
                    cr.CurrentValue = true;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.5,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    h:Create(ct.Switch.Indicator.UIStroke, TweenInfo.new(0.55,
                                                                         Enum.EasingStyle
                                                                             .Quint,
                                                                         Enum.EasingDirection
                                                                             .Out),
                             {Color = H.ToggleEnabledStroke}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.8,
                                                                Enum.EasingStyle
                                                                    .Quint,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {BackgroundColor3 = H.ToggleEnabled}):Play()
                    h:Create(ct.Switch.UIStroke, TweenInfo.new(0.55,
                                                               Enum.EasingStyle
                                                                   .Quint,
                                                               Enum.EasingDirection
                                                                   .Out),
                             {Color = H.ToggleEnabledOuterStroke}):Play()
                    wait(0.05)
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.45,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    wait(0.15)
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                local bf, bg = pcall(function()
                    cr.Callback(cr.CurrentValue)
                end)
                if not bf then
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    ct.Title.Text = "Callback Error"
                    print("Rayfield | " .. cr.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    ct.Title.Text = cr.Name;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                a1()
            end)
            function cr:Set(cu)
                if cu then
                    cr.CurrentValue = true;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.5,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    h:Create(ct.Switch.Indicator.UIStroke, TweenInfo.new(0.55,
                                                                         Enum.EasingStyle
                                                                             .Quint,
                                                                         Enum.EasingDirection
                                                                             .Out),
                             {Color = H.ToggleEnabledStroke}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.8,
                                                                Enum.EasingStyle
                                                                    .Quint,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {BackgroundColor3 = H.ToggleEnabled}):Play()
                    h:Create(ct.Switch.UIStroke, TweenInfo.new(0.55,
                                                               Enum.EasingStyle
                                                                   .Quint,
                                                               Enum.EasingDirection
                                                                   .Out),
                             {Color = Color3.fromRGB(100, 100, 100)}):Play()
                    wait(0.05)
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.45,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    wait(0.15)
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                else
                    cr.CurrentValue = false;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackgroundHover})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.45,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 12, 0, 12)}):Play()
                    h:Create(ct.Switch.Indicator.UIStroke, TweenInfo.new(0.55,
                                                                         Enum.EasingStyle
                                                                             .Quint,
                                                                         Enum.EasingDirection
                                                                             .Out),
                             {Color = H.ToggleDisabledStroke}):Play()
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.8,
                                                                Enum.EasingStyle
                                                                    .Quint,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {BackgroundColor3 = H.ToggleDisabled}):Play()
                    h:Create(ct.Switch.UIStroke, TweenInfo.new(0.55,
                                                               Enum.EasingStyle
                                                                   .Quint,
                                                               Enum.EasingDirection
                                                                   .Out),
                             {Color = Color3.fromRGB(65, 65, 65)}):Play()
                    wait(0.05)
                    h:Create(ct.Switch.Indicator, TweenInfo.new(0.4,
                                                                Enum.EasingStyle
                                                                    .Quart,
                                                                Enum.EasingDirection
                                                                    .Out),
                             {Size = UDim2.new(0, 17, 0, 17)}):Play()
                    wait(0.15)
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                local bf, bg = pcall(function()
                    cr.Callback(cr.CurrentValue)
                end)
                if not bf then
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    ct.Title.Text = "Callback Error"
                    print("Rayfield | " .. cr.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    ct.Title.Text = cr.Name;
                    h:Create(ct, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(ct.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                a1()
            end
            if bo.ConfigurationSaving then
                if bo.ConfigurationSaving.Enabled and cr.Flag then
                    f.Flags[cr.Flag] = cr
                end
            end
            return cr
        end
        function by:CreateColorPicker(cv)
            cv.Type = "ColorPicker"
            local cw = s.Template.ColorPicker:Clone()
            local cx = cw.CPBackground;
            local cy = cx.Display;
            local q = cx.MainCP;
            local cz = cw.ColorSlider;
            cw.ClipsDescendants = true;
            cw.Name = cv.Name;
            cw.Title.Text = cv.Name;
            cw.Visible = true;
            cw.Parent = K;
            cw.Size = UDim2.new(1, -10, 0.028, 35)
            cx.Size = UDim2.new(0, 39, 0, 22)
            cy.BackgroundTransparency = 0;
            q.MainPoint.ImageTransparency = 1;
            cw.Interact.Size = UDim2.new(1, 0, 1, 0)
            cw.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
            cw.RGB.Position = UDim2.new(0, 17, 0, 70)
            cw.HexInput.Position = UDim2.new(0, 17, 0, 90)
            q.ImageTransparency = 1;
            cx.BackgroundTransparency = 1;
            local bD = false;
            local cA = game.Players.LocalPlayer:GetMouse()
            q.Image = "http://www.roblox.com/asset/?id=11415645739"
            local cB = false;
            local cC = false;
            cw.Interact.MouseButton1Down:Connect(function()
                if not bD then
                    bD = true;
                    h:Create(cw, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(1, -10, 0.224, 40)}):Play()
                    h:Create(cx, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(0, 173, 0, 86)}):Play()
                    h:Create(cy, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 1}):Play()
                    h:Create(cw.Interact,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0.289, 0, 0.5, 0)}):Play()
                    h:Create(cw.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0, 17, 0, 40)}):Play()
                    h:Create(cw.HexInput,
                             TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0, 17, 0, 73)}):Play()
                    h:Create(cw.Interact,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(0.574, 0, 1, 0)}):Play()
                    h:Create(q.MainPoint,
                             TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                             {ImageTransparency = 0}):Play()
                    h:Create(q, TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                             {ImageTransparency = 0.1}):Play()
                    h:Create(cx, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 0}):Play()
                else
                    bD = false;
                    h:Create(cw, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(1, -10, 0.028, 35)}):Play()
                    h:Create(cx, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(0, 39, 0, 22)}):Play()
                    h:Create(cw.Interact,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Size = UDim2.new(1, 0, 1, 0)}):Play()
                    h:Create(cw.Interact,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
                    h:Create(cw.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0, 17, 0, 70)}):Play()
                    h:Create(cw.HexInput,
                             TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                             {Position = UDim2.new(0, 17, 0, 90)}):Play()
                    h:Create(cy, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 0}):Play()
                    h:Create(q.MainPoint,
                             TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                             {ImageTransparency = 1}):Play()
                    h:Create(q, TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                             {ImageTransparency = 1}):Play()
                    h:Create(cx, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundTransparency = 1}):Play()
                end
            end)
            game:GetService("UserInputService").InputEnded:Connect(function(ci,
                                                                            cD)
                if ci.UserInputType == Enum.UserInputType.MouseButton1 then
                    cB = false;
                    cC = false
                end
            end)
            q.MouseButton1Down:Connect(function()
                if bD then cB = true end
            end)
            q.MainPoint.MouseButton1Down:Connect(function()
                if bD then cB = true end
            end)
            cz.MouseButton1Down:Connect(function() cC = true end)
            cz.SliderPoint.MouseButton1Down:Connect(function()
                cC = true
            end)
            local cE, b0, a3 = cv.Color:ToHSV()
            local cF = Color3.fromHSV(cE, b0, a3)
            local cG = string.format("#%02X%02X%02X", cF.R * 0xFF, cF.G * 0xFF,
                                     cF.B * 0xFF)
            cw.HexInput.InputBox.Text = cG;
            local function cH()
                q.MainPoint.Position = UDim2.new(b0,
                                                 -q.MainPoint.AbsoluteSize.X / 2,
                                                 1 - a3, -q.MainPoint
                                                     .AbsoluteSize.Y / 2)
                q.MainPoint.ImageColor3 = Color3.fromHSV(cE, b0, a3)
                cx.BackgroundColor3 = Color3.fromHSV(cE, 1, 1)
                cy.BackgroundColor3 = Color3.fromHSV(cE, b0, a3)
                local a7 = cE * cz.AbsoluteSize.X;
                cz.SliderPoint.Position = UDim2.new(0, a7 -
                                                        cz.SliderPoint
                                                            .AbsoluteSize.X / 2,
                                                    0.5, 0)
                cz.SliderPoint.ImageColor3 = Color3.fromHSV(cE, 1, 1)
                local cF = Color3.fromHSV(cE, b0, a3)
                local cI, cJ, cK = math.floor(cF.R * 255 + 0.5),
                                   math.floor(cF.G * 255 + 0.5),
                                   math.floor(cF.B * 255 + 0.5)
                cw.RGB.RInput.InputBox.Text = tostring(cI)
                cw.RGB.GInput.InputBox.Text = tostring(cJ)
                cw.RGB.BInput.InputBox.Text = tostring(cK)
                cG = string.format("#%02X%02X%02X", cF.R * 0xFF, cF.G * 0xFF,
                                   cF.B * 0xFF)
                cw.HexInput.InputBox.Text = cG
            end
            cH()
            cw.HexInput.InputBox.FocusLost:Connect(function()
                if not pcall(function()
                    local cI, cJ, cK = string.match(cw.HexInput.InputBox.Text,
                                                    "^#?(%w%w)(%w%w)(%w%w)$")
                    local cL = Color3.fromRGB(tonumber(cI, 16),
                                              tonumber(cJ, 16), tonumber(cK, 16))
                    cE, b0, a3 = cL:ToHSV()
                    cG = cw.HexInput.InputBox.Text;
                    cH()
                    cv.Color = cL
                end) then cw.HexInput.InputBox.Text = cG end
                pcall(function()
                    cv.Callback(Color3.fromHSV(cE, b0, a3))
                end)
                local cI, cJ, cK = math.floor(cE * 255 + 0.5),
                                   math.floor(b0 * 255 + 0.5),
                                   math.floor(a3 * 255 + 0.5)
                cv.Color = Color3.fromRGB(cI, cJ, cK)
                a1()
            end)
            local function cM(cN, cO)
                local cP = tonumber(cN.Text)
                local cF = Color3.fromHSV(cE, b0, a3)
                local cQ, cR, cS = math.floor(cF.R * 255 + 0.5),
                                   math.floor(cF.G * 255 + 0.5),
                                   math.floor(cF.B * 255 + 0.5)
                local cT;
                if cO == "R" then
                    cT = cQ;
                    cQ = cP
                elseif cO == "G" then
                    cT = cR;
                    cR = cP
                else
                    cT = cS;
                    cS = cP
                end
                if cP then
                    cP = math.clamp(cP, 0, 255)
                    cE, b0, a3 = Color3.fromRGB(cQ, cR, cS):ToHSV()
                    cH()
                else
                    cN.Text = tostring(cT)
                end
                local cI, cJ, cK = math.floor(cE * 255 + 0.5),
                                   math.floor(b0 * 255 + 0.5),
                                   math.floor(a3 * 255 + 0.5)
                cv.Color = Color3.fromRGB(cI, cJ, cK)
                a1()
            end
            cw.RGB.RInput.InputBox.FocusLost:connect(function()
                cM(cw.RGB.RInput.InputBox, "R")
                pcall(function()
                    cv.Callback(Color3.fromHSV(cE, b0, a3))
                end)
            end)
            cw.RGB.GInput.InputBox.FocusLost:connect(function()
                cM(cw.RGB.GInput.InputBox, "G")
                pcall(function()
                    cv.Callback(Color3.fromHSV(cE, b0, a3))
                end)
            end)
            cw.RGB.BInput.InputBox.FocusLost:connect(function()
                cM(cw.RGB.BInput.InputBox, "B")
                pcall(function()
                    cv.Callback(Color3.fromHSV(cE, b0, a3))
                end)
            end)
            game:GetService("RunService").RenderStepped:connect(function()
                if cB then
                    local cU = math.clamp(cA.X - q.AbsolutePosition.X, 0,
                                          q.AbsoluteSize.X)
                    local cV = math.clamp(cA.Y - q.AbsolutePosition.Y, 0,
                                          q.AbsoluteSize.Y)
                    q.MainPoint.Position = UDim2.new(0, cU -
                                                         q.MainPoint
                                                             .AbsoluteSize.X / 2,
                                                     0, cV -
                                                         q.MainPoint
                                                             .AbsoluteSize.Y / 2)
                    b0 = cU / q.AbsoluteSize.X;
                    a3 = 1 - cV / q.AbsoluteSize.Y;
                    cy.BackgroundColor3 = Color3.fromHSV(cE, b0, a3)
                    q.MainPoint.ImageColor3 = Color3.fromHSV(cE, b0, a3)
                    cx.BackgroundColor3 = Color3.fromHSV(cE, 1, 1)
                    local cF = Color3.fromHSV(cE, b0, a3)
                    local cI, cJ, cK = math.floor(cF.R * 255 + 0.5),
                                       math.floor(cF.G * 255 + 0.5),
                                       math.floor(cF.B * 255 + 0.5)
                    cw.RGB.RInput.InputBox.Text = tostring(cI)
                    cw.RGB.GInput.InputBox.Text = tostring(cJ)
                    cw.RGB.BInput.InputBox.Text = tostring(cK)
                    cw.HexInput.InputBox.Text =
                        string.format("#%02X%02X%02X", cF.R * 0xFF, cF.G * 0xFF,
                                      cF.B * 0xFF)
                    pcall(function()
                        cv.Callback(Color3.fromHSV(cE, b0, a3))
                    end)
                    cv.Color = Color3.fromRGB(cI, cJ, cK)
                    a1()
                end
                if cC then
                    local cU = math.clamp(cA.X - cz.AbsolutePosition.X, 0,
                                          cz.AbsoluteSize.X)
                    cE = cU / cz.AbsoluteSize.X;
                    cy.BackgroundColor3 = Color3.fromHSV(cE, b0, a3)
                    cz.SliderPoint.Position = UDim2.new(0, cU -
                                                            cz.SliderPoint
                                                                .AbsoluteSize.X /
                                                            2, 0.5, 0)
                    cz.SliderPoint.ImageColor3 = Color3.fromHSV(cE, 1, 1)
                    cx.BackgroundColor3 = Color3.fromHSV(cE, 1, 1)
                    q.MainPoint.ImageColor3 = Color3.fromHSV(cE, b0, a3)
                    local cF = Color3.fromHSV(cE, b0, a3)
                    local cI, cJ, cK = math.floor(cF.R * 255 + 0.5),
                                       math.floor(cF.G * 255 + 0.5),
                                       math.floor(cF.B * 255 + 0.5)
                    cw.RGB.RInput.InputBox.Text = tostring(cI)
                    cw.RGB.GInput.InputBox.Text = tostring(cJ)
                    cw.RGB.BInput.InputBox.Text = tostring(cK)
                    cw.HexInput.InputBox.Text =
                        string.format("#%02X%02X%02X", cF.R * 0xFF, cF.G * 0xFF,
                                      cF.B * 0xFF)
                    pcall(function()
                        cv.Callback(Color3.fromHSV(cE, b0, a3))
                    end)
                    cv.Color = Color3.fromRGB(cI, cJ, cK)
                    a1()
                end
            end)
            if bo.ConfigurationSaving then
                if bo.ConfigurationSaving.Enabled and cv.Flag then
                    f.Flags[cv.Flag] = cv
                end
            end
            function cv:Set(cW)
                cv.Color = cW;
                cE, b0, a3 = cv.Color:ToHSV()
                cF = Color3.fromHSV(cE, b0, a3)
                cH()
            end
            return cv
        end
        function by:CreateSlider(cX)
            local O = false;
            local cz = s.Template.Slider:Clone()
            cz.Name = cX.Name;
            cz.Title.Text = cX.Name;
            cz.Visible = true;
            cz.Parent = K;
            cz.BackgroundTransparency = 1;
            cz.UIStroke.Transparency = 1;
            cz.Title.TextTransparency = 1;
            if H ~= f.Theme.Default then
                cz.Main.Shadow.Visible = false
            end
            if cX.Info then
                cz.Description.Text = cX.Info;
                local bC = false;
                local bD = false;
                local bE = cz.Size.Y.Offset;
                cz.MouseEnter:Connect(function(a7, bF)
                    bC = true;
                    wait(0.2)
                    if bC then
                        bD = true;
                        cz.Description.Visible = true;
                        game:GetService('TweenService'):Create(cz,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE +
                                                 cz.Description.Size.Y.Offset +
                                                 15)
                        }):Play()
                    end
                end)
                cz.MouseLeave:Connect(function(a7, bF)
                    if bC then bC = false end
                    if bD then
                        bD = false;
                        game:GetService('TweenService'):Create(cz,
                                                               TweenInfo.new(
                                                                   0.4,
                                                                   Enum.EasingStyle
                                                                       .Quint,
                                                                   Enum.EasingDirection
                                                                       .Out), {
                            Size = UDim2.new(1, -10, 0, bE)
                        }):Play()
                        delay(.4, function()
                            if not bD then
                                cz.Description.Visible = false
                            end
                        end)
                    end
                end)
            end
            cz.Main.BackgroundColor3 = H.SliderBackground;
            cz.Main.UIStroke.Color = H.SliderStroke;
            cz.Main.Progress.BackgroundColor3 = H.SliderProgress;
            h:Create(cz, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {BackgroundTransparency = 0}):Play()
            h:Create(cz.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {Transparency = 0}):Play()
            h:Create(cz.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {TextTransparency = 0}):Play()
            cz.Main.Progress.Size = UDim2.new(0,
                                              cz.Main.AbsoluteSize.X *
                                                  (cX.CurrentValue + cX.Range[1]) /
                                                  (cX.Range[2] - cX.Range[1]) >
                                                  5 and cz.Main.AbsoluteSize.X *
                                                  cX.CurrentValue /
                                                  (cX.Range[2] - cX.Range[1]) or
                                                  5, 1, 0)
            if not cX.Suffix then
                cz.Main.Information.Text = tostring(cX.CurrentValue)
            else
                cz.Main.Information.Text =
                    tostring(cX.CurrentValue) .. " " .. cX.Suffix
            end
            cz.MouseEnter:Connect(function()
                h:Create(cz, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackgroundHover}):Play()
            end)
            cz.MouseLeave:Connect(function()
                h:Create(cz, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                         {BackgroundColor3 = H.ElementBackground}):Play()
            end)
            cz.Main.Interact.InputBegan:Connect(function(S)
                if S.UserInputType == Enum.UserInputType.MouseButton1 then
                    O = true
                end
            end)
            cz.Main.Interact.InputEnded:Connect(function(S)
                if S.UserInputType == Enum.UserInputType.MouseButton1 then
                    O = false
                end
            end)
            cz.Main.Interact.MouseButton1Down:Connect(function(cY)
                local cZ = cz.Main.Progress.AbsolutePosition.X +
                               cz.Main.Progress.AbsoluteSize.X;
                local c_ = cZ;
                local d0 = cY;
                local cp;
                cp = j.Stepped:Connect(function()
                    if O then
                        d0 = g:GetMouseLocation().X;
                        cZ = cZ + 0.025 * (d0 - c_)
                        if d0 < cz.Main.AbsolutePosition.X then
                            d0 = cz.Main.AbsolutePosition.X
                        elseif d0 > cz.Main.AbsolutePosition.X +
                            cz.Main.AbsoluteSize.X then
                            d0 = cz.Main.AbsolutePosition.X +
                                     cz.Main.AbsoluteSize.X
                        end
                        if cZ < cz.Main.AbsolutePosition.X + 5 then
                            cZ = cz.Main.AbsolutePosition.X + 5
                        elseif cZ > cz.Main.AbsolutePosition.X +
                            cz.Main.AbsoluteSize.X then
                            cZ = cz.Main.AbsolutePosition.X +
                                     cz.Main.AbsoluteSize.X
                        end
                        if cZ <= d0 and d0 - c_ < 0 then
                            c_ = d0
                        elseif cZ >= d0 and d0 - c_ > 0 then
                            c_ = d0
                        end
                        h:Create(cz.Main.Progress, TweenInfo.new(0.15,
                                                                 Enum.EasingStyle
                                                                     .Quad,
                                                                 Enum.EasingDirection
                                                                     .Out), {
                            Size = UDim2.new(0, cZ - cz.Main.AbsolutePosition.X,
                                             1, 0)
                        }):Play()
                        local d1 = cX.Range[1] +
                                       (d0 - cz.Main.AbsolutePosition.X) /
                                       cz.Main.AbsoluteSize.X *
                                       (cX.Range[2] - cX.Range[1])
                        d1 =
                            math.floor(d1 / cX.Increment + 0.5) * cX.Increment *
                                10000000 / 10000000;
                        if not cX.Suffix then
                            cz.Main.Information.Text = tostring(d1)
                        else
                            cz.Main.Information.Text =
                                tostring(d1) .. " " .. cX.Suffix
                        end
                        if cX.CurrentValue ~= d1 then
                            local bf, bg = pcall(function()
                                cX.Callback(d1)
                            end)
                            if not bf then
                                h:Create(cz,
                                         TweenInfo.new(0.6,
                                                       Enum.EasingStyle.Quint),
                                         {
                                    BackgroundColor3 = Color3.fromRGB(85, 0, 0)
                                }):Play()
                                h:Create(cz.UIStroke, TweenInfo.new(0.6,
                                                                    Enum.EasingStyle
                                                                        .Quint),
                                         {Transparency = 1}):Play()
                                cz.Title.Text = "Callback Error"
                                print("Rayfield | " .. cX.Name ..
                                          " Callback Error " .. tostring(bg))
                                wait(0.5)
                                cz.Title.Text = cX.Name;
                                h:Create(cz,
                                         TweenInfo.new(0.6,
                                                       Enum.EasingStyle.Quint),
                                         {
                                    BackgroundColor3 = H.ElementBackground
                                }):Play()
                                h:Create(cz.UIStroke, TweenInfo.new(0.6,
                                                                    Enum.EasingStyle
                                                                        .Quint),
                                         {Transparency = 0}):Play()
                            end
                            cX.CurrentValue = d1;
                            a1()
                        end
                    else
                        h:Create(cz.Main.Progress, TweenInfo.new(0.15,
                                                                 Enum.EasingStyle
                                                                     .Quad,
                                                                 Enum.EasingDirection
                                                                     .Out), {
                            Size = UDim2.new(0,
                                             d0 - cz.Main.AbsolutePosition.X > 5 and
                                                 d0 - cz.Main.AbsolutePosition.X or
                                                 5, 1, 0)
                        }):Play()
                        cp:Disconnect()
                    end
                end)
            end)
            function cX:Set(d2)
                h:Create(cz.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle
                                                             .Quint,
                                                         Enum.EasingDirection
                                                             .Out), {
                    Size = UDim2.new(0,
                                     cz.Main.AbsoluteSize.X * (d2 + cX.Range[1]) /
                                         (cX.Range[2] - cX.Range[1]) > 5 and
                                         cz.Main.AbsoluteSize.X * d2 /
                                         (cX.Range[2] - cX.Range[1]) or 5, 1, 0)
                }):Play()
                cz.Main.Information.Text = tostring(d2) .. " " .. cX.Suffix;
                local bf, bg = pcall(function() cX.Callback(d2) end)
                if not bf then
                    h:Create(cz, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = Color3.fromRGB(85, 0, 0)})
                        :Play()
                    h:Create(cz.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 1}):Play()
                    cz.Title.Text = "Callback Error"
                    print("Rayfield | " .. cX.Name .. " Callback Error " ..
                              tostring(bg))
                    wait(0.5)
                    cz.Title.Text = cX.Name;
                    h:Create(cz, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {BackgroundColor3 = H.ElementBackground}):Play()
                    h:Create(cz.UIStroke,
                             TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                end
                cX.CurrentValue = d2;
                a1()
            end
            if bo.ConfigurationSaving then
                if bo.ConfigurationSaving.Enabled and cX.Flag then
                    f.Flags[cX.Flag] = cX
                end
            end
            return cX
        end
        return by
    end
    s.Visible = true;
    wait(0.7)
    h:Create(t.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    h:Create(t.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    h:Create(t.Version, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
             {TextTransparency = 1}):Play()
    wait(0.2)
    h:Create(q, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {Size = UDim2.new(0, 500, 0, 475)}):Play()
    h:Create(q.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.4}):Play()
    r.BackgroundTransparency = 1;
    r.Divider.Size = UDim2.new(0, 0, 0, 1)
    r.CornerRepair.BackgroundTransparency = 1;
    r.Title.TextTransparency = 1;
    r.Hide.ImageTransparency = 1;
    wait(0.5)
    r.Visible = true;
    h:Create(r, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    h:Create(r.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {BackgroundTransparency = 0}):Play()
    wait(0.1)
    h:Create(r.Divider, TweenInfo.new(1, Enum.EasingStyle.Quint),
             {Size = UDim2.new(1, 0, 0, 1)}):Play()
    wait(0.1)
    h:Create(r.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {TextTransparency = 0}):Play()
    wait(0.1)
    h:Create(r.Hide, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
             {ImageTransparency = 0.8}):Play()
    wait(0.3)
    function bs:Prompt(d3)
        local b7 = x.Prompt;
        x.Visible = true;
        x.BackgroundTransparency = 1;
        b7.BackgroundTransparency = 1;
        b7.UIStroke.Transparency = 1;
        b7.Content.TextTransparency = 1;
        b7.Title.TextTransparency = 1;
        b7.Sub.TextTransparency = 1;
        b7.Size = UDim2.new(0, 340, 0, 140)
        b7.Buttons.Template.Visible = false;
        b7.Buttons.Template.TextLabel.TextTransparency = 1;
        b7.Buttons.Template.UIStroke.Transparency = 1;
        b7.Content.Text = d3.Content;
        b7.Sub.Text = d3.SubTitle or ''
        if d3.Actions then
            for d4, d5 in pairs(d3.Actions) do
                print(d5)
                local bB = b7.Buttons.Template:Clone()
                bB.TextLabel.Text = d5.Name;
                bB.Interact.MouseButton1Up:Connect(function()
                    if not E then
                        local bf, bg = pcall(d5.Callback)
                        E = true;
                        if not bf then
                            ClosePrompt()
                            print(
                                "Rayfield | " .. d5.Name .. " Callback Error " ..
                                    tostring(bg))
                        else
                            ClosePrompt()
                        end
                    end
                end)
                bB.Name = d4;
                bB.Parent = b7.Buttons;
                bB.Size = UDim2.fromOffset(bB.TextLabel.TextBounds.X + 24, 30)
            end
        end
        h:Create(x, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                 {BackgroundTransparency = .5}):Play()
        wait(.2)
        h:Create(b7, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                 {BackgroundTransparency = 0, Size = UDim2.new(0, 350, 0, 150)})
            :Play()
        wait(0.2)
        h:Create(b7.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                 {Transparency = 0}):Play()
        h:Create(b7.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
                 {TextTransparency = 0}):Play()
        h:Create(b7.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
                 {TextTransparency = 0}):Play()
        h:Create(b7.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint),
                 {TextTransparency = 0}):Play()
        wait(1)
        if d3.Actions then
            for n, b8 in pairs(b7.Buttons:GetChildren()) do
                if b8.Name ~= 'Template' and b8.Name ~= 'Middle' and
                    b8:IsA('Frame') then
                    b8.Visible = true;
                    h:Create(b8.UIStroke,
                             TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                             {Transparency = 0}):Play()
                    h:Create(b8.TextLabel,
                             TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                             {TextTransparency = 0}):Play()
                    wait(.8)
                end
            end
        else
        end
    end
    return bs
end
function f:Destroy() m:Destroy() end
r.Search.MouseButton1Click:Connect(function()
    if D or B then return end
    if F then
        OpenSearch()
        F = false
    else
        F = true;
        CloseSearch()
    end
end)
r.Hide.MouseButton1Click:Connect(function()
    if D then return end
    if C then
        C = false;
        B = false;
        Unhide()
    else
        if not F then
            F = true;
            spawn(CloseSearch)
        end
        C = true;
        Hide()
    end
end)
g.InputBegan:Connect(function(ci, cj)
    if (ci.KeyCode == Enum.KeyCode.Home or ci.KeyCode == Enum.KeyCode.RightShift) and
        not cj then
        if D then return end
        if C then
            C = false;
            Unhide()
        else
            if not F then spawn(CloseSearch) end
            C = true;
            Hide()
        end
    end
end)
for n, bh in ipairs(r:GetChildren()) do
    if bh.ClassName == "ImageButton" then
        bh.MouseEnter:Connect(function()
            h:Create(bh, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0}):Play()
        end)
        bh.MouseLeave:Connect(function()
            h:Create(bh, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.8}):Play()
        end)
        bh.MouseButton1Click:Connect(function()
            h:Create(bh, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                     {ImageTransparency = 0.8}):Play()
        end)
    end
end
function f:LoadConfiguration()
    if A then
        pcall(function()
            if isfile(d .. "/" .. z .. e) then
                X(readfile(d .. "/" .. z .. e))
                f:Notify({
                    Title = "Configuration Loaded",
                    Content = "The configuration file for this script has been loaded from a previous session"
                })
            end
        end)
    end
end
task.delay(3.5, f.LoadConfiguration, f)
return f
