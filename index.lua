assert(not game:IsLoaded() and game.Loaded:Wait() or game)
local cloneref = cloneref or function(...) return ... end
local Http = cloneref(game:GetService("HttpService"))
local Starter = cloneref(game:GetService("StarterGui"))
local ME = cloneref(game:GetService("Players")).LocalPlayer
local EmoteList = Http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/dog3951/-e-emote-/main/emotes.json"))
local function SetEmotesList(x)
	local Human = x:WaitForChild("Humanoid")
	if Human.RigType ~= Enum.HumanoidRigType.R15 then
		return
	end
	if not Starter:GetCoreGuiEnabled(5, true) then
		Starter:SetCoreGuiEnabled(5, true)
	end
	Human:WaitForChild("HumanoidDescription"):SetEmotes(EmoteList)
end
if ME.Character then
	task.spawn(SetEmotesList, ME.Character)
end
ME.CharacterAdded:Connect(SetEmotesList)
return EmoteList
