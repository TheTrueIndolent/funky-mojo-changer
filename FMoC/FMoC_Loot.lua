-- creating global variables --
local function CreateGlobalVariables()
-- function for position of Loot Buttons --
	function fmocLootButtonsPosition()
		if FMoClootButton["Visible"] == "Show" then
			for k = 1, 5, 1 do
				_G["fmocButtonLoot"..k]:ClearAllPoints()
				_G["fmocButtonLoot"..k]:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", FMoClootButton["Button"..k.."x"], FMoClootButton["Button"..k.."y"])
				_G["fmocButtonLoot"..k]:SetWidth(FMoClootButton["Demension"])
				_G["fmocButtonLoot"..k]:SetHeight(FMoClootButton["Demension"])
				_G["fmocButtonLoot"..k]:Show()
			end
		elseif FMoClootButton["Visible"] == "Hide" then
			for k = 1, 5, 1 do
				_G["fmocButtonLoot"..k]:Hide()
			end
		end
	end
-- Function for the Spec and Loot Buttons Background --
	function fmocLootButtonsShowHide()
		if FMoClootButton["Visible"] == "Show" then
			fmocButtonLoot1:Show()
			if GetNumSpecializations() == 2 then
				fmocButtonLoot2.Background:SetTexture(select(4, GetSpecializationInfo(1)))
				fmocButtonLoot3.Background:SetTexture(select(4, GetSpecializationInfo(2)))
				fmocButtonLoot4:Hide()
				fmocButtonLoot5:Hide()
			elseif GetNumSpecializations() == 3 then
				fmocButtonLoot2.Background:SetTexture(select(4, GetSpecializationInfo(1)))
				fmocButtonLoot3.Background:SetTexture(select(4, GetSpecializationInfo(2)))
				fmocButtonLoot4.Background:SetTexture(select(4, GetSpecializationInfo(3)))
				fmocButtonLoot5:Hide()
			elseif GetNumSpecializations() == 4 then
				fmocButtonLoot2.Background:SetTexture(select(4, GetSpecializationInfo(1)))
				fmocButtonLoot3.Background:SetTexture(select(4, GetSpecializationInfo(2)))
				fmocButtonLoot4.Background:SetTexture(select(4, GetSpecializationInfo(3)))
				fmocButtonLoot5.Background:SetTexture(select(4, GetSpecializationInfo(4)))
			end
		end
	end
-- function for the Loot Activated --
	function fmocLootButtonsSpecCheck()
		if GetLootSpecialization() == 0 then
			fmocButtonLoot1.Background:SetDesaturated(false)
			fmocButtonLoot2.Background:SetDesaturated(true)
			fmocButtonLoot3.Background:SetDesaturated(true)
			fmocButtonLoot4.Background:SetDesaturated(true)
			fmocButtonLoot5.Background:SetDesaturated(true)
		elseif GetLootSpecialization() == select(1, GetSpecializationInfo(1)) then
			fmocButtonLoot1.Background:SetDesaturated(true)
			fmocButtonLoot2.Background:SetDesaturated(false)
			fmocButtonLoot3.Background:SetDesaturated(true)
			fmocButtonLoot4.Background:SetDesaturated(true)
			fmocButtonLoot5.Background:SetDesaturated(true)
		elseif GetLootSpecialization() == select(1, GetSpecializationInfo(2)) then
			fmocButtonLoot1.Background:SetDesaturated(true)
			fmocButtonLoot2.Background:SetDesaturated(true)
			fmocButtonLoot3.Background:SetDesaturated(false)
			fmocButtonLoot4.Background:SetDesaturated(true)
			fmocButtonLoot5.Background:SetDesaturated(true)
		elseif GetLootSpecialization() == select(1, GetSpecializationInfo(3)) then
			fmocButtonLoot1.Background:SetDesaturated(true)
			fmocButtonLoot2.Background:SetDesaturated(true)
			fmocButtonLoot3.Background:SetDesaturated(true)
			fmocButtonLoot4.Background:SetDesaturated(false)
			fmocButtonLoot5.Background:SetDesaturated(true)
		elseif GetLootSpecialization() == select(1, GetSpecializationInfo(4)) then
			fmocButtonLoot1.Background:SetDesaturated(true)
			fmocButtonLoot2.Background:SetDesaturated(true)
			fmocButtonLoot3.Background:SetDesaturated(true)
			fmocButtonLoot4.Background:SetDesaturated(true)
			fmocButtonLoot5.Background:SetDesaturated(false)
		end
	end
end
-- Entering the Loot Button 1 --
fmocButtonLoot1:SetScript("OnEnter", function (self)
	fmocEntering(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChange your Loot Specialization into|n"..fmocHighColor:WrapTextInColorCode("Current Specialization ("..select(2, GetSpecializationInfo(GetSpecialization()))..")"))
	GameTooltip:Show()
end)
-- Leaving the Loot Button 1 --
fmocButtonLoot1:SetScript("OnLeave", function (self)
	if GetLootSpecialization() ~= 0 then
		fmocLeaving(self)
	else GameTooltip:Hide() end
end)
-- Clicking the Loot Button 1 --
fmocButtonLoot1:SetScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		SetLootSpecialization(0)
		DEFAULT_CHAT_FRAME:AddMessage("|cnYELLOW_FONT_COLOR:Loot Specialization set to: Current Specialization(".. select(2, GetSpecializationInfo(GetSpecialization())).. ")|r")
		PlaySound(841, "Master")
	end
end)
-- Entering the Loot Button 2 --
fmocButtonLoot2:SetScript("OnEnter", function (self)
	fmocEntering(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChange your Loot Specialization into|n"..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(1))).." Specialization!")
	GameTooltip:Show()
end)
-- Leaving the Loot Button 2 --
fmocButtonLoot2:SetScript("OnLeave", function (self)
	if GetLootSpecialization() ~= select(1, GetSpecializationInfo(1)) then
		fmocLeaving(self)
	else GameTooltip:Hide() end
end)
-- Clicking the Loot Button 2 --
fmocButtonLoot2:SetScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		SetLootSpecialization(select(1, GetSpecializationInfo(1)))
		PlaySound(841, "Master")
	end
end)
-- Entering the Loot Button 3 --
fmocButtonLoot3:SetScript("OnEnter", function (self)
	fmocEntering(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChange your Loot Specialization into|n"..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(2))).. " Specialization!")
	GameTooltip:Show()
end)
-- Leaving the Loot Button 3 --
fmocButtonLoot3:SetScript("OnLeave", function (self)
	if GetLootSpecialization() ~= select(1, GetSpecializationInfo(2)) then
		fmocLeaving(self)
	else GameTooltip:Hide() end
end)
-- Clicking the Loot Button 3 --
fmocButtonLoot3:SetScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		SetLootSpecialization(select(1, GetSpecializationInfo(2)))
		PlaySound(841, "Master")
	end
end)
-- Entering the Loot Button 4 --
fmocButtonLoot4:SetScript("OnEnter", function (self)
	fmocEntering(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChange your Loot Specialization into|n"..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(3))).." Specialization!")
	GameTooltip:Show()
end)
-- Leaving the Loot Button 4 --
fmocButtonLoot4:SetScript("OnLeave", function (self)
	if GetLootSpecialization() ~= select(1, GetSpecializationInfo(3)) then
		fmocLeaving(self)
	else GameTooltip:Hide() end
end)
-- Clicking the Loot Button 4 --
fmocButtonLoot4:SetScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		SetLootSpecialization(select(1, GetSpecializationInfo(3)))
		PlaySound(841, "Master")
	end
end)
-- Entering the Loot Button 5 --
fmocButtonLoot5:SetScript("OnEnter", function (self)
	fmocEntering(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChange your Loot Specialization into|n"..fmocHighColor:WrapTextInColorCode(select(2, GetSpecializationInfo(4))).. " Specialization!")
	GameTooltip:Show()
end)
-- Leaving the Loot Button 5 --
fmocButtonLoot5:SetScript("OnLeave", function (self)
	if GetLootSpecialization() ~= select(1, GetSpecializationInfo(4)) then
		fmocLeaving(self)
	else GameTooltip:Hide() end
end)
-- Clicking the Loot Button 5 --
fmocButtonLoot5:SetScript("OnClick", function (self, button, down)
	if button == "LeftButton" and down == false then
		SetLootSpecialization(select(1, GetSpecializationInfo(4)))
		PlaySound(841, "Master")
	end
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		CreateGlobalVariables()
		fmocLootButtonsPosition()
		fmocLootButtonsShowHide()
		fmocLootButtonsSpecCheck()
	elseif event == "PLAYER_LOOT_SPEC_UPDATED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocLootButtonsSpecCheck()
	end
end
fmocZlave:HookScript("OnEvent", EventsTime)
