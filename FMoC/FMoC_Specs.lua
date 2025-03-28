-- function for the position of Spec Buttons --
local function fmocSpecButtonsPosition()
	for k = 1, 3, 1 do
		_G["fmocButtonSpec"..k]:ClearAllPoints()
		_G["fmocButtonSpec"..k]:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", FMoCspecButtons["Button"..k.."x"], FMoCspecButtons["Button"..k.."y"])
		_G["fmocButtonSpec"..k]:SetWidth(FMoCspecButtons["Demension"])
		_G["fmocButtonSpec"..k]:SetHeight(FMoCspecButtons["Demension"])
		_G["fmocButtonSpec"..k.."Circle"]:SetWidth(FMoCspecButtons["Demension"] * 3)
		_G["fmocButtonSpec"..k.."Circle"]:SetHeight(FMoCspecButtons["Demension"] * 3)
		_G["fmocButtonSpec"..k.."Circle"]:SetVertexColor(fmocClassColor:GetRGB())
		_G["fmocButtonSpec"..k].Border:SetVertexColor(fmocClassColor:GetRGB())
	end
end
-- Function for the Spec Buttons Background --
local function fmocSpecButtonsCheck()
	if GetNumSpecializations() == 2 then
		fmocButtonSpec1:Show()
		if GetSpecialization() == 1 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(2))))
		elseif GetSpecialization() == 2 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
		end
	elseif GetNumSpecializations() == 3 then
		fmocButtonSpec1:Show()
		fmocButtonSpec2:Show()
		if GetSpecialization() == 1 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(2))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 2 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 3 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(2))))
		end
	elseif GetNumSpecializations() == 4 then
		fmocButtonSpec1:Show()
		fmocButtonSpec2:Show()
		fmocButtonSpec3:Show()
		if GetSpecialization() == 1 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(2))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(3))))
			SetPortraitToTexture(fmocButtonSpec3.Background, (select(4, GetSpecializationInfo(4))))
		elseif GetSpecialization() == 2 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(3))))
			SetPortraitToTexture(fmocButtonSpec3.Background, (select(4, GetSpecializationInfo(4))))
		elseif GetSpecialization() == 3 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(2))))
			SetPortraitToTexture(fmocButtonSpec3.Background, (select(4, GetSpecializationInfo(4))))
		elseif GetSpecialization() == 4 then
			SetPortraitToTexture(fmocButtonSpec1.Background, (select(4, GetSpecializationInfo(1))))
			SetPortraitToTexture(fmocButtonSpec2.Background, (select(4, GetSpecializationInfo(2))))
			SetPortraitToTexture(fmocButtonSpec3.Background, (select(4, GetSpecializationInfo(3))))
		end
	end
end
-- Entering the Specialization Button 1 --
fmocButtonSpec1:SetScript("OnEnter", function (self)
	fmocEntering(self)
	if GetNumSpecializations() == 2 then
		if GetSpecialization() == 1 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocHighColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		elseif GetSpecialization() == 2 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		end
	elseif GetNumSpecializations() == 3 then
		if GetSpecialization() == 1 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		elseif GetSpecialization() == 2 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		elseif GetSpecialization() == 3 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		end
	elseif GetNumSpecializations() == 4 then
		if GetSpecialization() == 1 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		elseif GetSpecialization() == 2 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		elseif GetSpecialization() == 3 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		elseif GetSpecialization() == 4 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(1))))
		end
	end
	GameTooltip:Show()
end)
-- Leavin the Specialization Button 1 --
fmocButtonSpec1:SetScript("OnLeave", function (self)
	fmocLeaving(self)
end)
-- Clicky Clicky the Specialization Button 1 --
fmocButtonSpec1:HookScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		if GetNumSpecializations() == 2 then
			if GetSpecialization()== 1 then
				C_SpecializationInfo.SetSpecialization(2)
			else C_SpecializationInfo.SetSpecialization(1)
			end
		elseif GetNumSpecializations() == 3 then
			if GetSpecialization() == 1 then
				C_SpecializationInfo.SetSpecialization(2)
			else
				C_SpecializationInfo.SetSpecialization(1)
			end
		elseif GetNumSpecializations() == 4 then
			if GetSpecialization() == 1 then
				C_SpecializationInfo.SetSpecialization(2)
			else C_SpecializationInfo.SetSpecialization(1)
			end
		end
		fmocButtonPressed = 1
		PlaySound(841, "Master")
	end
end)
-- Entering the Specialization Button 2 --
fmocButtonSpec2:SetScript("OnEnter", function (self)
	fmocEntering(self)
	if GetNumSpecializations() == 3 then
		if GetSpecialization() == 1 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 2 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 3 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		end
	elseif GetNumSpecializations() == 4 then
		if GetSpecialization() == 1 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 2 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(3))))
		elseif GetSpecialization() == 3 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		elseif GetSpecialization() == 4 then
			GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(2))))
		end
	end
	GameTooltip:Show()
end)
-- Leavin the Specialization Button 2 --
fmocButtonSpec2:SetScript("OnLeave", function (self)
	fmocLeaving(self)
end)
-- Clicky Clicky the Specialization Button 2 --
fmocButtonSpec2:HookScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		if GetNumSpecializations() == 3 then
			if GetSpecialization() == 1 or GetSpecialization() == 2 then
				C_SpecializationInfo.SetSpecialization(3)
			else
				C_SpecializationInfo.SetSpecialization(2)
			end
		elseif GetNumSpecializations() == 4 then
			if GetSpecialization()== 1 or GetSpecialization() == 2 then
				C_SpecializationInfo.SetSpecialization(3)
			else C_SpecializationInfo.SetSpecialization(2)
			end
		end
		fmocButtonPressed = 2
		PlaySound(841, "Master")
	end
end)
-- Entering the Specialization Button 3 --
fmocButtonSpec3:SetScript("OnEnter", function (self)
	fmocEntering(self)
	if GetSpecialization()== 1 then
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(4)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(4))))
	elseif GetSpecialization() == 2 then
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(4)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(4))))
	elseif GetSpecialization() == 3 then
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(4)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(4))))
	elseif GetSpecialization() == 4 then
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick to change into: "..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3)))..", "..fmocMainColor:WrapTextInColorCode(select(5, GetSpecializationInfo(3))))
	end
	GameTooltip:Show()
end)
-- Leavin the Specialization Button 3 --
fmocButtonSpec3:SetScript("OnLeave", function (self)
	fmocLeaving(self)
end)
-- Clicky Clicky the Specialization Button 3 --
fmocButtonSpec3:HookScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		if GetSpecialization() == 4 then
			C_SpecializationInfo.SetSpecialization(3)
		else C_SpecializationInfo.SetSpecialization(4)
		end
		fmocButtonPressed = 3
		PlaySound(841, "Master")
	end
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocSpecButtonsPosition()
		fmocSpecButtonsCheck()
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocSpecButtonsCheck()
	end
end
fmocZlave:HookScript("OnEvent", EventsTime)
