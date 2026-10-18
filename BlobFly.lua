local _P=game:GetService("Players")
local _R=game:GetService("RunService")
local _H=game:GetService("HttpService")
local _L=_P.LocalPlayer
local _a=nil
local _b={c1=nil,c2=nil,c3="position",c4=false,c5=60,c6=0,c7=nil,c8=nil,c9=nil,c10=false,c11=nil,c12=0,c13=nil,c14=nil,c15=false}
local _c16=0
local _c17=0
local function _d(_1) local _2,_3=pcall(memory_read,"uintptr_t",_1) if _2 and _3 and _3~=0 then return _3 end end
local function _e(_4) local _5,_6=pcall(memory_read,"float",_4) if _5 and _6 and _6==_6 then return _6 end end
local function _f(_7) local _8,_9,_10=_e(_7),_e(_7+4),_e(_7+8) if _8 and _9 and _10 then return Vector3.new(_8,_9,_10) end end
local function _g(_11,_12) pcall(memory_write,"float",_11,_12.X) pcall(memory_write,"float",_11+4,_12.Y) pcall(memory_write,"float",_11+8,_12.Z) end
local function _h()
    local _13=httpget("https://offsets.imtheo.lol/roblox/version")
    if not _13 or _13=="" then return nil end
    _13=_13:gsub("%s+","")
    local _14=httpget("https://offsets.imtheo.lol/".._13.."/offsets.json")
    if not _14 or _14=="" then return nil end
    local _15,_16=pcall(function() return _H:JSONDecode(_14) end)
    if not _15 or not _16 then return nil end
    return _16.Offsets
end
local function _i()
    _a=_h()
    if not _a then return false end
    local _17=_a.Primitive or {}
    _b.c1=_17.Position
    _b.c2=_17.AssemblyLinearVelocity or _17.Velocity or _17.LinearVelocity
    if not _b.c1 then return false end
    if not _b.c2 then _b.c3="position" end
    return true
end
local function _j(_18)
    if not _18 or not _a or not _a.BasePart or not _a.BasePart.Primitive then return nil end
    local _19=_d(_18.Address+_a.BasePart.Primitive)
    if not _19 or _19<0x10000 or _19>0x7FFFFFFFFFFF then return nil end
    return _19
end
local function _k() local _20=_L.Character return _20 and _20:FindFirstChild("HumanoidRootPart") end
local function _l() local _21=_L.Character return _21 and _21:FindFirstChildOfClass("Humanoid") end
local function _m() _b.c11=nil _b.c9=nil _b.c7=nil _b.c8=nil _b.c12=0 end
local function _n()
    if _b.c11 and _b.c11.Parent and _b.c9 and _b.c9.Parent and _b.c9.Parent==_b.c11.Parent then
        return _b.c11
    end
    local _22=tick()
    if _22-_b.c12<2.0 and _b.c11 and _b.c11.Parent then
        if not _b.c9 or not _b.c9.Parent or _b.c9.Parent~=_b.c11.Parent then _m() else return _b.c11 end
    end
    _b.c12=_22
    local _23=_k()
    if not _23 then return nil end
    local _24=_23.Position
    local _25,_26=nil,15
    local _27,_28=pcall(function() return workspace:GetDescendants() end)
    if not _27 or not _28 then return nil end
    for _,_29 in ipairs(_28) do
        local _30=_29.ClassName
        if _30=="Seat" or _30=="VehicleSeat" then
            local _31,_32=pcall(function() return _29.Position end)
            if _31 and _32 then local _33=(_32-_24).Magnitude if _33<_26 then _26,_25=_33,_29 end end
        end
    end
    _b.c11=_25
    return _25
end
local function _o()
    if _b.c9 and _b.c9.Parent and _b.c7 then
        local _34=_n()
        if _34 and _34.Parent==_b.c9.Parent then return true end
        _m()
    end
    local _35=_n()
    if not _35 then return false end
    local _36=_35.Parent
    if not _36 then return false end
    local _37=_36:FindFirstChild("HumanoidRootPart")
    if not _37 then return false end
    _b.c9=_37
    _b.c8=_37
    _b.c7=_j(_37)
    return _b.c7~=nil
end
local function _p()
    local _38=_l()
    if not _38 then return false end
    local _39,_40=pcall(function() return _38.SeatPart end)
    if _39 and _40 then return true end
    if _b.c11 and _b.c11.Parent then
        local _41,_42=pcall(function() return _b.c11.Occupant end)
        if _41 and _42 and _42==_38 then return true end
    end
    if _b.c9 and _b.c9.Parent and _b.c11 and _b.c11.Parent and _b.c9.Parent==_b.c11.Parent then return true end
    if _b.c9 and _b.c9.Parent then
        local _43=_k()
        if _43 then
            local _44,_45=pcall(function() return _b.c9.Position end)
            local _46,_47=pcall(function() return _43.Position end)
            if _44 and _46 and _45 and _47 and (_45-_47).Magnitude<30 then return true end
        end
    end
    return false
end
local function _q(_48)
    local _49,_50,_51=_48.CFrame.LookVector,_48.CFrame.RightVector,Vector3.yAxis
    local _52=Vector3.zero
    if iskeypressed(0x57) then _52=_52+_49 end
    if iskeypressed(0x53) then _52=_52-_49 end
    if iskeypressed(0x44) then _52=_52+_50 end
    if iskeypressed(0x41) then _52=_52-_50 end
    if iskeypressed(0x20) then _52=_52+_51 end
    if iskeypressed(0x11) then _52=_52-_51 end
    if _52.Magnitude>0 then _52=_52.Unit end
    return _52
end
local function _r(_53)
    if not _p() then
        _c17=_c17+1
        if _c17>30 then
            _c17=0
            if _b.c4 then _s() UI.SetValue("bf_on",false) end
        end
        return
    end
    _c17=0
    if not _b.c7 and not _o() then return end
    local _54=_b.c7
    if not _54 then return end
    local _55=workspace.CurrentCamera
    if not _55 then return end
    pcall(function()
        local _56=_q(_55)
        if _b.c3=="position" and _b.c1 then
            local _57=_f(_54+_b.c1)
            if _57 then _g(_54+_b.c1,_57+_56*_b.c5*_53) end
        elseif _b.c2 then
            _g(_54+_b.c2,_56*_b.c5)
        end
    end)
end
local function _t()
    if _b.c4 then return end
    if not _a and not _i() then notify("Offsets failed to load","Blob Fly",3) return end
    if not _b.c1 then notify("No Position offset","Blob Fly",3) return end
    _b.c10=true
    _b.c4=true
    UI.SetValue("bf_on",true)
    _b.c6=tick()
    if _b.c13 then _b.c13:Disconnect() end
    _b.c13=_R.RenderStepped:Connect(function()
        local _58=tick()
        local _59=_58-_b.c6
        _b.c6=_58
        if _59>0.1 then _59=0.1 elseif _59<0 then _59=0 end
        pcall(_r,_59)
    end)
    notify("Blob Fly ON","Blob Fly",2)
    task.spawn(function() _o() end)
end
function _s()
    _b.c10=false
    if not _b.c4 then return end
    _b.c4=false
    if _b.c13 then _b.c13:Disconnect() _b.c13=nil end
    notify("Blob Fly OFF","Blob Fly",2)
end
local function _u()
    if _b.c4 then _s() else _t() end
    UI.SetValue("bf_on",_b.c4)
end
UI.AddTab("Blob Fly",function(_60)
    local _61=_60:Section("Fly","Left")
    _61:Toggle("bf_on","Fly Blob",false,function(_62) if _62 then _t() else _s() end end)
    _b.c14=_61:Keybind("bf_kb",0x54,"toggle")
    _61:SliderInt("bf_speed","Speed",10,300,_b.c5,function(_63) _b.c5=_63 end)
    _61:Combo("bf_mode","Mode",{"position","velocity"},0,function(_64) _b.c3=(_64==0) and "position" or "velocity" end)
end)
task.spawn(function()
    while true do
        local _65=false
        if _b.c14 then local _66,_67=pcall(function() return _b.c14:IsEnabled() end) _65=_66 and _67==true end
        if _65 and not _b.c15 then pcall(_u) end
        _b.c15=_65
        wait(0.02)
    end
end)
task.spawn(function()
    while true do
        if _b.c10 and not _b.c4 then
            if _a or _i() then
                if _o() then
                    _b.c4=true
                    _b.c6=tick()
                    if _b.c13 then _b.c13:Disconnect() end
                    _b.c13=_R.RenderStepped:Connect(function()
                        local _68=tick()
                        local _69=_68-_b.c6
                        _b.c6=_68
                        if _69>0.1 then _69=0.1 elseif _69<0 then _69=0 end
                        pcall(_r,_69)
                    end)
                    notify("Blob Fly ON","Blob Fly",2)
                    UI.SetValue("bf_on",true)
                end
            end
        end
        wait(0.2)
    end
end)
task.spawn(function()
    local _70=nil
    local _c18=0
    while true do
        local _71=nil
        local _72=_l()
        if _72 then local _73,_74=pcall(function() return _72.SeatPart end) if _73 then _71=_74 end end
        if _71~=_70 then
            if _71==nil then
                _c18=_c18+1
                if _c18>10 then
                    _c18=0
                    _70=nil
                    _m()
                end
            else
                _c18=0
                _70=_71
                _m()
            end
        end
        wait(0.1)
    end
end)
task.spawn(function() if not _i() then wait(30) _i() end end)
