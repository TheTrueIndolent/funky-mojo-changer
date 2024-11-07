-- function for the Animation Frame --
local function ChoosingBackground(self)
	if select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 1 then --Warrior
		self:SetAtlas("talents-animations-class-warrior")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 2 then --Paladin
		self:SetAtlas("talents-animations-class-paladin")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 3 then --Hunter
		self:SetAtlas("talents-animations-class-hunter")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 4 then --Rogue
		self:SetAtlas("talents-animations-class-rogue")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 5 then --Priest
		self:SetAtlas("talents-animations-class-priest")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 6 then --Death Kight
		self:SetAtlas("talents-animations-class-deathknight")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 7 then --Shaman
		self:SetAtlas("talents-animations-class-shaman")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 8 then --Mage
		self:SetAtlas("talents-animations-class-mage")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 9 then --Warlock
		self:SetAtlas("talents-animations-class-warlock")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 10 then --Monk
		self:SetAtlas("talents-animations-class-monk")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 11 then --Druid
		self:SetAtlas("talents-animations-class-druid")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 12 then --Demon Hunter
		self:SetAtlas("talents-animations-class-demonhunter")
	elseif select(3, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))) == 13 then --Evoker
		self:SetAtlas("talents-animations-class-evoker")
	end
end
-- function for the position and bg of Animation --
local function fmocAnimationBGposition()
	if FMoCanimation["Background"] == "Class Banner" then
		FMoCframeFX:Show()
		FMoCframeFX1:Hide()
	elseif FMoCanimation["Background"] == "Runes" then
		FMoCframeFX:Hide()
		FMoCframeFX1:Show()
	elseif FMoCanimation["Background"] == "Hide it" then
		FMoCframeFX:Hide()
		FMoCframeFX1:Hide()
	end
	FMoCframeFX:ClearAllPoints()
	FMoCframeFX:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", FMoCanimation["X"], FMoCanimation["Y"])
	FMoCframeFX:SetWidth(FMoCanimation["Width"])
	FMoCframeFX:SetHeight(FMoCanimation["Height"])
	local frameX = FMoCframeFX:GetWidth() * 2
	local frameY = FMoCframeFX:GetHeight() * 2
	FMoCframeFXBG:SetSize(frameX, frameY)
	ChoosingBackground(FMoCframeFXBG)
end
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocAnimationBGposition()
	end
end
fmocZlave:HookScript("OnEvent", EventsTime)
