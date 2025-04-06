local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Kill cutscene animations safely
local function stopCutsceneTracks()
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                local name = track.Name:lower()
                if name:find("cutscene") or name:find("delivery") then
                    track:Stop()
                end
            end
        end
    end
end

-- Run every frame
RunService.RenderStepped:Connect(stopCutsceneTracks)
