-- creating global variables --
local function CreateGlobalVariables()
-- Colors --
	fmocMainColor = CreateColorFromRGBAHexString("F0E68CFF")
	fmocHighColor = CreateColorFromRGBAHexString("FF7F50FF")
	fmocNoMainColor = CreateColorFromRGBAHexString("F0E68C00")
	fmocNoHighColor = CreateColorFromRGBAHexString("FF7F5000")
	fmocClassColor = C_ClassColor.GetClassColor(select(2, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))))
-- function for showing the menu --
	function fmocShowMenu()
		if not InCombatLockdown() then
			if UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
				local _, loaded = C_AddOns.IsAddOnLoaded("FMoC_Options")
				local loadable, reason = C_AddOns.IsAddOnLoadable("FMoC_Options" , nil , true)
				if loadable and not loaded then
					C_AddOns.LoadAddOn("FMoC_Options")
					if not fmocOptions00:IsShown() then
						fmocOptions00:Show()
					else
						fmocOptions00:Hide()
					end
				elseif loadable and loaded then
					if not fmocOptions00:IsShown() then
						fmocOptions00:Show()
					else
						fmocOptions00:Hide()
					end
				else
					local fmocTime = GameTime_GetTime(false)
					DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] The addon with the name "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC_Options", "Title")).." is "..reason.."!")
				end
			else
				local fmocTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] You have to be level 10 in order to use this add on!")
			end
		else
			local fmocTime = GameTime_GetTime(false)
			DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] While you are in combat, you can't do this!")
		end
	end
-- Slash Command --
	RegisterNewSlashCommand(fmocShowMenu, "fmoc", "funkymojochanger")
-- Mini Map Button Functions --
	AddonCompartmentFrame:RegisterAddon({
		text = fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")),
		icon = C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas"),
		notCheckable = true,
		func = function(button, menuInputData, menu)
			local buttonName = menuInputData.buttonName
			if buttonName == "LeftButton" then
				fmocShowMenu()
			end
		end,
		funcOnEnter = function(button)
			MenuUtil.ShowTooltip(button, function(tooltip)
			tooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nLeft Click: "..fmocMainColor:WrapTextInColorCode("Open the main panel of settings!"))
			end)
		end,
		funcOnLeave = function(button)
			MenuUtil.HideTooltip(button)
		end,
	})
-- click on Pop Out --
	function fmocClickPopOut(var1, var2)
		var1:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if not var2:IsShown() then
					var2:Show()
					PlaySound(855, "Master")
				else
					var2:Hide()
				end
			end
		end)
	end
-- functions for the buttons and popouts --
-- on enter --
	function fmocEnteringMenus(self)
		GameTooltip_ClearStatusBars(GameTooltip)
		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("RIGHT", self, "LEFT", 0, 0)
	end
-- on leave --
	function fmocLeavingMenus()
		GameTooltip:Hide()
	end
-- functions for the spec and loot buttons --
-- on enter --
	function fmocEntering(self)
		self.Background:SetDesaturated(false)
		GameTooltip_ClearStatusBars(GameTooltip)
		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("TOP", self, "BOTTOM", 0, 0)
	end
-- on leave --
	function fmocLeaving(self)
		self.Background:SetDesaturated(true)
		GameTooltip:Hide()
	end
-- Some Variables --
	FMoCspec1Layouts = 0
	FMoCspec2Layouts = 0
	FMoCspec3Layouts = 0
	FMoCspec4Layouts = 0
-- taking care of the click pop out talents button --
	fmocClickPopOut(fmocButtonTalents1, fmocButtonTalents1Choice0)
	fmocClickPopOut(fmocButtonTalents2, fmocButtonTalents2Choice0)
	fmocClickPopOut(fmocButtonTalents3, fmocButtonTalents3Choice0)
	fmocClickPopOut(fmocButtonTalents4, fmocButtonTalents4Choice0)
end
-- function for main animation --
local function MainAnimation()
	if FMoCanimation["Background"] == "Class Banner" then
		FMoCframeFX.Animation.Main:SetDuration(PlayerCastingBarFrame.maxValue)
		FMoCframeFX.Animation:Play()
	elseif FMoCanimation["Background"] == "Runes" then
		FMoCframeFX1.Animation.Rune1b:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune1:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune2b:SetStartDelay(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune2:SetStartDelay((PlayerCastingBarFrame.maxValue/5) + 0.15)
		FMoCframeFX1.Animation.Rune2:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune3b:SetStartDelay((PlayerCastingBarFrame.maxValue/5)*2)
		FMoCframeFX1.Animation.Rune3:SetStartDelay(((PlayerCastingBarFrame.maxValue/5)*2) + 0.15)
		FMoCframeFX1.Animation.Rune3:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune4b:SetStartDelay((PlayerCastingBarFrame.maxValue/5)*3)
		FMoCframeFX1.Animation.Rune4:SetStartDelay(((PlayerCastingBarFrame.maxValue/5)*3) + 0.15)
		FMoCframeFX1.Animation.Rune4:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation.Rune5b:SetStartDelay((PlayerCastingBarFrame.maxValue/5)*4)
		FMoCframeFX1.Animation.Rune5:SetStartDelay(((PlayerCastingBarFrame.maxValue/5)*4) + 0.15)
		FMoCframeFX1.Animation.Rune5:SetDuration(PlayerCastingBarFrame.maxValue/5)
		FMoCframeFX1.Animation:Play()
	end
end
-- Function for first time variables--
local function FirstTimeVariables()
	if FMCrCounterLoading == nil or FMCrCounterLoading ~= nil then FMCrCounterLoading = 0 end
	if FMCrCounterDeleting == nil or FMCrCounterDeleting ~= nil then FMCrCounterDeleting = 0 end
	if FMCrProfile == nil then FMCrProfile = {} end
	if FMCrNumber == nil then FMCrNumber = 0 end
	if FMoCanimation == nil then
		FMoCanimation = {
			X = 55,
			Y = 440,
			Background = "Class Banner",
			Width = 200,
			Height = 200,
		}
	end
	if FMoCspecButtons == nil then
		FMoCspecButtons = {
			Button1x = 290,
			Button1y = 570,
			Button2x = 360,
			Button2y = 570,
			Button3x = 430,
			Button3y = 570,
			Demension = 64,
		}
	end
	if FMoClootButton == nil then
		FMoClootButton = {
			Button1x = 300,
			Button1y = 480,
			Button2x = 370,
			Button2y = 480,
			Button3x = 440,
			Button3y = 480,
			Button4x = 510,
			Button4y = 480,
			Button5x = 580,
			Button5y = 480,
			Demension = 64,
			Visible = "Show",
		}
	end
	if FMoCtalentButtons == nil then
		FMoCtalentButtons = {
			baseX = 430,
			baseY = 440,
			Direction = "Downward",
		}
	end
	if FMoCtalentsProfile == nil then FMoCtalentsProfile = {} end
	if FMoCtalentsProfile["LastConfig"] == nil then
		FMoCtalentsProfile["LastConfig"] = {
			spec1 = {one = 0, two = 0,},
			spec2 = {one = 0, two = 0,},
			spec3 = {one = 0, two = 0,},
			spec4 = {one = 0, two = 0,},
		}
	end
end
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		CreateGlobalVariables()
		FirstTimeVariables()
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		local _, loaded = C_AddOns.IsAddOnLoaded("FMoC_Options")
		local loadable, reason = C_AddOns.IsAddOnLoadable("FMoC_Options" , nil , true)
		if loadable and loaded then fmocEquipmentTalentsButtonsShow() end
	elseif event == "UNIT_SPELLCAST_START" and arg1 == "player" and (arg3 == 200749 or arg3 == 384255) then
		if arg3 == 200749 then
			if fmocButtonPressed == 1 then 
				fmocButtonSpec1.Animation.Wirls:SetDuration(PlayerCastingBarFrame.maxValue)
				fmocButtonSpec1.Animation:Play()
			end
			if fmocButtonPressed == 2 then 
				fmocButtonSpec2.Animation.Wirls:SetDuration(PlayerCastingBarFrame.maxValue)
				fmocButtonSpec2.Animation:Play()
			end
			if fmocButtonPressed == 3 then 
				fmocButtonSpec3.Animation.Wirls:SetDuration(PlayerCastingBarFrame.maxValue)
				fmocButtonSpec3.Animation:Play()
			end
			MainAnimation()
		elseif arg3 == 384255 then
			MainAnimation()
			if OverlayPlayerCastingBarFrame.showCastbar then
				fmocOverlayCastbar = true
			end
		end
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == "player" and (arg3 == 200749 or arg3 == 384255) then
		if fmocButtonSpec1.Animation:IsPlaying() then fmocButtonSpec1.Animation:Stop() end
		if fmocButtonSpec2.Animation:IsPlaying() then fmocButtonSpec2.Animation:Stop() end
		if fmocButtonSpec3.Animation:IsPlaying() then fmocButtonSpec3.Animation:Stop() end
		if FMoCframeFX.Animation:IsPlaying() then FMoCframeFX.Animation:Stop() end
		if FMoCframeFX1.Animation:IsPlaying() then FMoCframeFX1.Animation:Stop() end
	end
end
fmocZlave:SetScript("OnEvent", EventsTime)
