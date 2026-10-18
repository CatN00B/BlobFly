local _P=game:GetService("Players")
local _R=game:GetService("RunService")
local _H=game:GetService("HttpService")
local _L=_P.LocalPlayer

local _a,_b,_c,_d,_e,_f,_g,_h,_i,_j,_k,_l,_m,_n,_o,_p,_q,_r,_s,_t,_u,_v,_w,_x,_y,_z
local _A,_B,_C,_D,_E,_F,_G,_I,_J,_K,_M,_N,_O,_Q,_S,_T,_U,_V,_W,_X,_Y,_Z
local _65,_66,_67,_68,_69,_70

local function _f0(_1,_2)
    local _3,_4=pcall(memory_read,"uintptr_t",_1)
    if _3 and _4 and _4~=0 then return _4 end
end
local function _f1(_5)
    local _6,_7=pcall(memory_read,"float",_5)
    if _6 and _7 and _7==_7 then return _7 end
end
local function _f2(_8)
    local _9,_10,_11=_f1(_8),_f1(_8+4),_f1(_8+8)
    if _9 and _10 and _11 then return Vector3.new(_9,_10,_11) end
end
local function _f3(_12,_13)
    pcall(memory_write,"float",_12,_13.X)
    pcall(memory_write,"float",_12+4,_13.Y)
    pcall(memory_write,"float",_12+8,_13.Z)
end

local function _f4()
    local _14=httpget("https://offsets.imtheo.lol/roblox/version")
    if not _14 or _14=="" then return nil end
    _14=_14:gsub("%s+","")
    local _15=httpget("https://offsets.imtheo.lol/".._14.."/offsets.json")
    if not _15 or _15=="" then return nil end
    local _16,_17=pcall(function() return _H:JSONDecode(_15) end)
    if not _16 or not _17 then return nil end
    return _17.Offsets
end

local function _f5()
    _a=_f4()
    if not _a then return false end
    local _18=_a.Primitive or {}
    _b=_18.Position
    _c=_18.AssemblyLinearVelocity or _18.Velocity or _18.LinearVelocity
    if not _b then return false end
    if not _c then _d="position" end
    return true
end

local function _f6(_19)
    if not _19 or not _a or not _a.BasePart or not _a.BasePart.Primitive then return nil end
    local _20=_f0(_19.Address+_a.BasePart.Primitive)
    if not _20 or _20<0x10000 or _20>0x7FFFFFFFFFFF then return nil end
    return _20
end

local function _f7()
    local _21=_L.Character
    return _21 and _21:FindFirstChild("HumanoidRootPart")
end

local function _f15()
    _f=nil
    _g=nil
    _h=nil
    _i=nil
    _e=0
end

local function _f8()
    local _22=tick()
    if _22-_e<1.0 and _f and _f.Parent then
        if not _g or not _g.Parent or _g.Parent~=_f.Parent then
            _f15()
        else
            return _f
        end
    end
    _e=_22
    local _23=_f7()
    if not _23 then return nil end
    local _24=_23.Position
    local _25,_26=nil,15
    local _27,_28=pcall(function() return workspace:GetDescendants() end)
    if not _27 or not _28 then return nil end
    for _,_29 in ipairs(_28) do
        local _30=_29.ClassName
        if _30=="Seat" or _30=="VehicleSeat" then
            local _31,_32=pcall(function() return _29.Position end)
            if _31 and _32 then
                local _33=(_32-_24).Magnitude
                if _33<_26 then _26,_25=_33,_29 end
            end
        end
    end
    _f=_25
    return _25
end

local function _f9()
    if _g and _g.Parent and _h then
        local _66b=_f8()
        if _66b and _66b.Parent==_g.Parent then
            return true
        end
        _f15()
    end
    local _34=_f8()
    if not _34 then return false end
    local _35=_34.Parent
    if not _35 then return false end
    local _36=_35:FindFirstChild("HumanoidRootPart")
    if not _36 then return false end
    _g=_36
    _i=_36
    _h=_f6(_36)
    return _h~=nil
end

local function _f16()
    local _71=_L.Character
    local _72=_71 and _71:FindFirstChildOfClass("Humanoid")
    if not _72 then return false end
    local _73,_74=pcall(function() return _72.SeatPart end)
    if _73 and _74 then return true end
    if _f and _f.Parent then
        local _75,_76=pcall(function() return _f.Occupant end)
        if _75 and _76 and _76==_72 then return true end
    end
    if _g and _g.Parent then
        local _77=_f7()
        if _77 then
            local _78,_79=pcall(function() return _g.Position end)
            local _80,_81=pcall(function() return _77.Position end)
            if _78 and _80 and _79 and _81 then
                if (_79-_81).Magnitude < 8 then return true end
            end
        end
    end
    return false
end

local function _f10(_37)
    local _38,_39,_40=_37.CFrame.LookVector,_37.CFrame.RightVector,Vector3.yAxis
    local _41=Vector3.zero
    if iskeypressed(0x57) then _41=_41+_38 end
    if iskeypressed(0x53) then _41=_41-_38 end
    if iskeypressed(0x44) then _41=_41+_39 end
    if iskeypressed(0x41) then _41=_41-_39 end
    if iskeypressed(0x20) then _41=_41+_40 end
    if iskeypressed(0x11) then _41=_41-_40 end
    if _41.Magnitude>0 then _41=_41.Unit end
    return _41
end

local function _f11(_42)
    if not _f16() then
        if _k then _f13() UI.SetValue("bf_on",false) end
        return
    end
    if not _h and not _f9() then return end
    local _43=_h
    if not _43 then return end
    local _44=workspace.CurrentCamera
    if not _44 then return end
    pcall(function()
        local _45=_f10(_44)
        if _d=="position" and _b then
            local _46=_f2(_43+_b)
            if _46 then _f3(_43+_b,_46+_45*_j*_42) end
        elseif _c then
            _f3(_43+_c,_45*_j)
        end
    end)
end

local function _f12()
    if _k then return end
    if not _a and not _f5() then
        notify("Offsets failed to load","Blob Fly",3)
        return
    end
    if not _b then
        notify("No Position offset","Blob Fly",3)
        return
    end
    _l=true
    if not _f9() then return end
    _k=true
    _m=tick()
    if _n then _n:Disconnect() end
    _n=_R.RenderStepped:Connect(function()
        local _47=tick()
        local _48=_47-_m
        _m=_47
        if _48>0.1 then _48=0.1 elseif _48<0 then _48=0 end
        pcall(_f11,_48)
    end)
    notify("Blob Fly ON","Blob Fly",2)
end

local function _f13()
    _l=false
    if not _k then return end
    _k=false
    if _n then _n:Disconnect() _n=nil end
    notify("Blob Fly OFF","Blob Fly",2)
end

local function _f14()
    if _k then _f13() else _f12() end
    UI.SetValue("bf_on",_k)
end

UI.AddTab("Blob Fly",function(_49)
    local _50=_49:Section("Fly","Left")
    _50:Toggle("bf_on","Fly Blob",false,function(_51)
        if _51 then _f12() else _f13() end
    end)
    _o=_50:Keybind("bf_kb",0x46,"toggle")
    _50:SliderInt("bf_speed","Speed",10,300,_j,function(_52) _j=_52 end)
    _50:Combo("bf_mode","Mode",{"position","velocity"},0,function(_53)
        _d=(_53==0) and "position" or "velocity"
    end)
end)

_j=60
_d="position"
_k=false
_l=false
_e=0

task.spawn(function()
    while true do
        local _54=false
        if _o then
            local _55,_56=pcall(function() return _o:IsEnabled() end)
            _54=_55 and _56==true
        end
        if _54 and not _p then pcall(_f14) end
        _p=_54
        wait(0.02)
    end
end)

task.spawn(function()
    while true do
        if _l and not _k then
            if _a or _f5() then
                if _f9() then
                    _k=true
                    _m=tick()
                    if _n then _n:Disconnect() end
                    _n=_R.RenderStepped:Connect(function()
                        local _57=tick()
                        local _58=_57-_m
                        _m=_57
                        if _58>0.1 then _58=0.1 elseif _58<0 then _58=0 end
                        pcall(_f11,_58)
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
    while true do
        local _59=nil
        local _60=_L.Character
        local _61=_60 and _60:FindFirstChildOfClass("Humanoid")
        if _61 then
            local _62,_63=pcall(function() return _61.SeatPart end)
            if _62 then _59=_63 end
        end
        if _59~=_65 then
            _65=_59
            _f15()
        end
        wait(0.1)
    end
end)

task.spawn(function()
    if not _f5() then
        wait(30)
        _f5()
    end
end)
