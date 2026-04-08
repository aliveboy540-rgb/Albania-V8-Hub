local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
       Name = "Albanian Scripter | Quantum Hub",
          LoadingTitle = "Quantum Edition v3.0",
             LoadingSubtitle = "Complete Edition",
                Theme = "Ocean"
})

-- FLY FUNCTION (The "Anti-Ban" Teleport)
local function FlyTo(targetCFrame)
    local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                
                    local distance = (humanoidRootPart.Position - targetCFrame.p).Magnitude
                        local speed = 100 -- Adjust this speed (Higher = Faster)
                            
                                local tweenService = game:GetService("TweenService")
                                    local info = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
                                        local tween = tweenService:Create(humanoidRootPart, info, {CFrame = targetCFrame})
                                            
                                                tween:Play()
                                                end

local function GetCurrentSea()
    local level = game.Players.LocalPlayer.Data.Level.Value
    if level >= 1 and level < 300 then
        return 1
    elseif level >= 300 and level < 600 then
        return 2
    elseif level >= 600 then
        return 3
    end
end

local Locations = {
    [1] = {
        ["Starter Island"] = CFrame.new(123, 10, 456), -- Replace with real coords
        -- Add more Sea 1 islands
    },
    [2] = {
        ["Sea 2"] = CFrame.new(789, 10, 101),
        ["Frozen Village"] = CFrame.new(-1200, 50, 2500),
        -- Add more Sea 2 islands
    },
    [3] = {
        ["Magma Island"] = CFrame.new(0, 0, 0), -- Replace with real coords
        -- Add more Sea 3 islands
    }
}

                                                -- 1. MAIN (Grinding)
                                                local MainTab = Window:CreateTab("🏠 Main", 4483362458)
                                                MainTab:CreateToggle({Name = "Auto Farm Level", CurrentValue = false, Callback = function(v) _G.Farm = v end})
                                                MainTab:CreateToggle({Name = "Auto-Quest", CurrentValue = false, Callback = function(v) _G.AutoQuest = v end})
                                                MainTab:CreateToggle({Name = "Sea Beast Farm", CurrentValue = false, Callback = function(v) _G.SeaBeastFarm = v end})
                                                MainTab:CreateToggle({Name = "Ship Farm", CurrentValue = false, Callback = function(v) _G.ShipFarm = v end})

                                                -- 2. TELEPORT (With Fly Logic)
                                                local TPTab = Window:CreateTab("🌍 Teleport", 4483345998)
                                                local currentSea = GetCurrentSea()
                                                local islandOptions = {}
                                                for island, _ in pairs(Locations[currentSea]) do
                                                    table.insert(islandOptions, island)
                                                end
                                                TPTab:CreateDropdown({
                                                       Name = "Fly to Island",
                                                          Options = islandOptions,
                                                             CurrentOption = {islandOptions[1]},
                                                                Callback = function(Option)
                                                                       if Locations[currentSea][Option[1]] then
                                                                                         FlyTo(Locations[currentSea][Option[1]])
                                                                                                end
                                                                                                   end,
                                                })

                                                -- 3. STATS (Auto-Stats)
                                                local StatsTab = Window:CreateTab("📊 Stats", 4483362458)
                                                StatsTab:CreateToggle({Name = "Auto-Stats Melee", CurrentValue = false, Callback = function(v) _G.StatMelee = v end})
                                                StatsTab:CreateToggle({Name = "Auto-Stats Defense", CurrentValue = false, Callback = function(v) _G.StatDef = v end})

                                                -- 4. COMBAT (PVP/Boss)
                                                local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)
                                                CombatTab:CreateToggle({Name = "Kill Aura", CurrentValue = false, Callback = function(v) _G.KillAura = v end})
                                                CombatTab:CreateToggle({Name = "Weapon Reach", CurrentValue = false, Callback = function(v) _G.WeaponReach = v end})

                                                -- 5. FISCH (Your Speciality)
                                                local FischTab = Window:CreateTab("🎣 Fisch", 4483362458)
                                                FischTab:CreateToggle({Name = "Auto Shake", CurrentValue = false, Callback = function(v) _G.AutoShake = v end})
                                                FischTab:CreateToggle({Name = "Auto Reel", CurrentValue = false, Callback = function(v) _G.AutoReel = v end})

                                                -- 6. RAIDS / DUNGEONS
                                                local RaidTab = Window:CreateTab("🔥 Raids", 4483362458)
                                                RaidTab:CreateButton({Name = "Auto Next Island", Callback = function() print("Raid Logic Active") end})

                                                -- 7. SHOP / INVENTORY
                                                local ShopTab = Window:CreateTab("🛒 Shop", 4483345998)
                                                ShopTab:CreateButton({Name = "Buy Random Fruit", Callback = function() print("Purchasing...") end})
                                                ShopTab:CreateToggle({Name = "Fruit Sniper", CurrentValue = false, Callback = function(v) _G.FruitSniper = v end})
                                                ShopTab:CreateToggle({Name = "Fruit Eater", CurrentValue = false, Callback = function(v) _G.FruitEater = v end})
                                                ShopTab:CreateButton({Name = "Remote Item Purchase", Callback = function() print("Remote Purchase Logic") end})

                                                -- 8. VISUALS / FPS
                                                local VisualsTab = Window:CreateTab("⚡ Visuals", 4483345998)
                                                VisualsTab:CreateToggle({Name = "Full Bright", CurrentValue = false, Callback = function(v) 
                                                    if v then game:GetService("Lighting").Brightness = 2 else game:GetService("Lighting").Brightness = 1 end 
                                                    end})
                                                VisualsTab:CreateToggle({Name = "ESP", CurrentValue = false, Callback = function(v) _G.ESP = v end})

                                                    -- 9. SETTINGS / MISC
                                                    local MiscTab = Window:CreateTab("🛠️ Misc", 4483345998)
                                                    MiscTab:CreateButton({Name = "Server Hop", Callback = function() --[[Hop Logic]] end})
                                                    MiscTab:CreateButton({Name = "Server Rejoin", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
                                                    MiscTab:CreateToggle({Name = "Walkspeed Bypass", CurrentValue = false, Callback = function(v) _G.WalkspeedBypass = v end})
                                                    MiscTab:CreateToggle({Name = "Jump Bypass", CurrentValue = false, Callback = function(v) _G.JumpBypass = v end})
                                                    MiscTab:CreateToggle({Name = "FPS Booster", CurrentValue = false, Callback = function(v) 
                                                        if v then
                                                            game:GetService("Lighting").GlobalShadows = false
                                                            game:GetService("Lighting").FogEnd = 9e9
                                                            -- Add more optimizations
                                                        else
                                                            game:GetService("Lighting").GlobalShadows = true
                                                            game:GetService("Lighting").FogEnd = 1000
                                                        end
                                                    end})
                                                    MiscTab:CreateButton({Name = "Discord Link", Callback = function() setclipboard("https://discord.gg/yourlink") end})
                                                    
                                                                       }
                                                })
})
