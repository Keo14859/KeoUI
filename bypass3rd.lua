local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Listen for camera change
camera:GetPropertyChangedSignal("CameraType"):Connect(function()
    if camera.CameraType ~= Enum.CameraType.Custom then
        -- Forcefully reset the camera back to custom
        camera.CameraType = Enum.CameraType.Custom
        camera.CameraSubject = player.Character:FindFirstChild("Humanoid")
    end
end)

-- Cancel any idle animations triggered
RunService.RenderStepped:Connect(function()
    local char = player.Character
    if char then
        for _, track in ipairs(char:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
            if track.Name:lower():find("cutscene") or track.Name:lower():find("delivery") then
                track:Stop()
            end
        end
    end
end)
