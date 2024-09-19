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
		fmocClassColor = C_ClassColor.GetClassColor(select(2, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))))
		FirstTimeVariables()
		fmocSpecButtonsPosition()
		fmocSpecButtonsCheck()
		fmocAnimationBGposition()
		fmocLootButtonsPosition()
		fmocLootButtonsShowHide()
		fmocLootButtonsSpecCheck()
		fmocTalentsButtonsPosition()
		fmocTalentsButtonsDirection()
		fmocTalentsButtonsCreate()
		fmocProfileTalentsEquipment()
		fmocTalentsButtonsShow()
		fmocTalentsButtonsCheck()
		fmocEquipmentButtonsCreate()
		fmocEquipmentTalentsButtonsCreate()
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocSpecButtonsCheck()
		fmocTalentsButtonsShow()
		fmocTalentsButtonsPreCheck()
		fmocTalentsButtonsCheck()
		fmocEquipmentTalentsButtonsShow()
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
		fmocTalentsButtonsCheck()
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "player" and arg3 == 384255 then
		fmocTalentsButtonsPreCheck()
		fmocTalentsButtonsCheck()
	elseif event == "PLAYER_LOOT_SPEC_UPDATED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocLootButtonsSpecCheck()
	end
end
fmocZlave:SetScript("OnEvent", EventsTime)
