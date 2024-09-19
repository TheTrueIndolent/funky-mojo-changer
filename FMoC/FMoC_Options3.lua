-- taking care of the panel --
fmocOptions3.TopTxt:SetText("Talents Buttons options!")
fmocOptions3Box1.TitleTxt:SetText("General information about the Talents Buttons!")
fmocOptions3Box1.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocHighColor:WrapTextInColorCode("Note 1:").." When you "..fmocHighColor:WrapTextInColorCode("CREATE")..", "..fmocHighColor:WrapTextInColorCode("DELETE")..", or "..fmocHighColor:WrapTextInColorCode("CHANGE").." talents loadout, it would be good to relog (log out and then log in)|n|n".."|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocHighColor:WrapTextInColorCode("Note 2:").." When you "..fmocHighColor:WrapTextInColorCode("CREATE")..", or "..fmocHighColor:WrapTextInColorCode("DELETE").." an equipment set, it would be good to relog (log out and then log in)")
fmocOptions3Box2:SetPoint("TOP", fmocOptions3Box1, "BOTTOM", 0, 0)
fmocOptions3Box2.TitleTxt:SetText("Position of the Talents Buttons!")
fmocOptions3Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The Talents Buttons now are unlocked and you can move them with the "..fmocHighColor:WrapTextInColorCode("Right Button").." of your mouse|nJust click and drag with the "..fmocHighColor:WrapTextInColorCode("Right Click").."!")
fmocOptions3Box3:SetPoint("TOP", fmocOptions3Box2, "BOTTOM", 0, 0)
fmocOptions3Box3.TitleTxt:SetText("Direction of the Talents Buttons")
fmocOptions3Box4:SetPoint("TOP", fmocOptions3Box3, "BOTTOM", 0, 0)
fmocOptions3Box4.TitleTxt:SetText("Assign an Equipment Set to a Talent Loadout!")
-- function for hidding the talents button and showing the base frame --
local function ShowingHidingTalentsButton()
	fmocButtonTalents1:Hide()
	fmocButtonTalents2:Hide()
	fmocButtonTalents3:Hide()
	fmocButtonTalents4:Hide()
	FMoCtalentsBase:SetMouseClickEnabled(true)
	FMoCtalentsBase:RegisterForDrag("RightButton")
	FMoCtalentsBase:SetWidth(FMoCtalentsBase.Text:GetWidth() * 1.50)
	FMoCtalentsBase:Show()
end
-- Moving Talents Buttons --
FMoCtalentsBase:SetScript("OnDragStart", FMoCtalentsBase.StartMoving)
FMoCtalentsBase:SetScript("OnDragStop", function(self)
	FMoCtalentButtons["baseX"] = Round(self:GetLeft() + (self:GetWidth()/2))
	FMoCtalentButtons["baseY"] = Round(self:GetBottom())
	self:StopMovingOrSizing()
end)
-- Box 3, pop out 1, Talents Buttons Direction --
-- Entering, leaving, click --
fmocOptions3Box3PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nSelect the Direction of the Talents Buttons!|n"..fmocHighColor:WrapTextInColorCode("Note:").." the Game will be reloaded when you choose the direction") 
end)
fmocOptions3Box3PopOut1:SetScript("OnLeave", fmocLeavingMenus)
fmocClickPopOut(fmocOptions3Box3PopOut1, fmocOptions3Box3PopOut1Choice0)
-- sort & clicking --
fmocOptions3Box3PopOut1Choice1:SetParent(fmocOptions3Box3PopOut1Choice0)
fmocOptions3Box3PopOut1Choice1:SetPoint("TOP",fmocOptions3Box3PopOut1Choice0, "BOTTOM", 0, 0)
fmocOptions3Box3PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoCtalentButtons["Direction"] = self.Text:GetText()
		C_UI.Reload()
	end
end)
fmocOptions3Box3PopOut1Choice1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoCtalentButtons["Direction"] = self.Text:GetText()
		C_UI.Reload()
	end
end)
-- naming --
fmocOptions3Box3PopOut1Choice0.Text:SetText("Upward")
fmocOptions3Box3PopOut1Choice1.Text:SetText("Downward")
-- Box 4, pop out 1, Equipment --
-- Entering, leaving, click --
fmocOptions3Box4PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nSelect an Equipment Set!") 
end)
fmocOptions3Box4PopOut1:SetScript("OnLeave", fmocLeavingMenus)
fmocClickPopOut(fmocOptions3Box4PopOut1, fmocOptions3Box4PopOut1Choice0)
-- naming --
fmocOptions3Box4PopOut1Choice0.Text:SetText("None")
fmocOptions3Box4PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		fmocOptions3Box4PopOut1:SetText(self.Text:GetText())
		fmocOptions3Box4PopOut1Choice0:Hide()
	end
end)
-- Function for Equipment Buttons --
function fmocEquipmentButtonsCreate()
	for k = 0, C_EquipmentSet.GetNumEquipmentSets() - 1, 1 do
		local name, _, setID = C_EquipmentSet.GetEquipmentSetInfo(k)
		if FMoCtalentsProfile[name] == nil then FMoCtalentsProfile[name] = setID else FMoCtalentsProfile[name] = setID end
		local dobtn = CreateFrame("Button", "fmocOptions3Box4PopOut1Choice"..k+1, fmocOptions3Box4PopOut1Choice0, "fmocPopOutButton")
		_G["fmocOptions3Box4PopOut1Choice"..k+1]:SetPoint("TOP", "fmocOptions3Box4PopOut1Choice"..k, "BOTTOM", 0, 0)
		_G["fmocOptions3Box4PopOut1Choice"..k+1]:SetText(name)
		_G["fmocOptions3Box4PopOut1Choice"..k+1]:SetWidth(fmocOptions3Box4PopOut1:GetWidth())
		_G["fmocOptions3Box4PopOut1Choice"..k+1]:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				fmocOptions3Box4PopOut1:SetText(self:GetText())
				fmocOptions3Box4PopOut1Choice0:Hide()
			end
		end)
	end
end
-- Box 4, pop out 2, 3, 4, 5 Talents Loadout --
-- Entering, leaving, click --
for k = 2, 5, 1 do
	_G["fmocOptions3Box4PopOut"..k]:SetScript("OnEnter", function(self)
		fmocEnteringMenus(self)
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nSelect a Talent Loadout!") 
	end)
	_G["fmocOptions3Box4PopOut"..k]:SetScript("OnLeave", fmocLeavingMenus)
	fmocClickPopOut(_G["fmocOptions3Box4PopOut"..k], _G["fmocOptions3Box4PopOut"..k.."Choice0"])
-- naming --
	_G["fmocOptions3Box4PopOut"..k.."Choice0"].Text:SetText("None")
	_G["fmocOptions3Box4PopOut"..k.."Choice0"]:SetScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			_G["fmocOptions3Box4PopOut"..k]:SetText(self.Text:GetText())
			_G["fmocOptions3Box4PopOut"..k.."Choice0"]:Hide()
		end
	end)
end
-- functions for creating the Equipment - Talents Buttons --
-- Spec 1 --
local function DoTalentsButtonsSpec1()
	for k = 1, FMoCspec1Layouts, 1 do
		local dobtn = CreateFrame("Button", "fmocOptions3Box4PopOut2Choice"..k, fmocOptions3Box4PopOut2Choice0, "fmocPopOutButton")
		_G["fmocOptions3Box4PopOut2Choice"..k]:SetPoint("TOP", "fmocOptions3Box4PopOut2Choice"..k-1, "BOTTOM", 0, 0)
		_G["fmocOptions3Box4PopOut2Choice"..k]:SetText(_G["FMoCspec1Pop"..k]:GetText())
		_G["fmocOptions3Box4PopOut2Choice"..k]:SetWidth(fmocOptions3Box4PopOut2:GetWidth())
		_G["fmocOptions3Box4PopOut2Choice"..k]:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				fmocOptions3Box4PopOut2:SetText(self:GetText())
				fmocOptions3Box4PopOut2Choice0:Hide()
			end
		end)
	end
end
-- Spec 2 --
local function DoTalentsButtonsSpec2()
	for k = 1, FMoCspec2Layouts, 1 do
		local dobtn = CreateFrame("Button", "fmocOptions3Box4PopOut3Choice"..k, fmocOptions3Box4PopOut3Choice0, "fmocPopOutButton")
		_G["fmocOptions3Box4PopOut3Choice"..k]:SetPoint("TOP", "fmocOptions3Box4PopOut3Choice"..k-1, "BOTTOM", 0, 0)
		_G["fmocOptions3Box4PopOut3Choice"..k]:SetText(_G["FMoCspec2Pop"..k]:GetText())
		_G["fmocOptions3Box4PopOut3Choice"..k]:SetWidth(fmocOptions3Box4PopOut3:GetWidth())
		_G["fmocOptions3Box4PopOut3Choice"..k]:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				fmocOptions3Box4PopOut3:SetText(self:GetText())
				fmocOptions3Box4PopOut3Choice0:Hide()
			end
		end)
	end
end
-- Spec 3 --
local function DoTalentsButtonsSpec3()
	for k = 1, FMoCspec3Layouts, 1 do
		local dobtn = CreateFrame("Button", "fmocOptions3Box4PopOut4Choice"..k, fmocOptions3Box4PopOut4Choice0, "fmocPopOutButton")
		_G["fmocOptions3Box4PopOut4Choice"..k]:SetPoint("TOP", "fmocOptions3Box4PopOut4Choice"..k-1, "BOTTOM", 0, 0)
		_G["fmocOptions3Box4PopOut4Choice"..k]:SetText(_G["FMoCspec3Pop"..k]:GetText())
		_G["fmocOptions3Box4PopOut4Choice"..k]:SetWidth(fmocOptions3Box4PopOut4:GetWidth())
		_G["fmocOptions3Box4PopOut4Choice"..k]:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				fmocOptions3Box4PopOut4:SetText(self:GetText())
				fmocOptions3Box4PopOut4Choice0:Hide()
			end
		end)
	end
end
-- Spec 4 --
local function DoTalentsButtonsSpec4()
	for k = 1, FMoCspec4Layouts, 1 do
		local dobtn = CreateFrame("Button", "fmocOptions3Box4PopOut5Choice"..k, fmocOptions3Box4PopOut5Choice0, "fmocPopOutButton")
		_G["fmocOptions3Box4PopOut5Choice"..k]:SetPoint("TOP", "fmocOptions3Box4PopOut5Choice"..k-1, "BOTTOM", 0, 0)
		_G["fmocOptions3Box4PopOut5Choice"..k]:SetText(_G["FMoCspec4Pop"..k]:GetText())
		_G["fmocOptions3Box4PopOut5Choice"..k]:SetWidth(fmocOptions3Box4PopOut5:GetWidth())
		_G["fmocOptions3Box4PopOut5Choice"..k]:SetScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				fmocOptions3Box4PopOut5:SetText(self:GetText())
				fmocOptions3Box4PopOut5Choice0:Hide()
			end
		end)
	end
end
-- Create the Equipment - Talents Buttons --
function fmocEquipmentTalentsButtonsCreate()
	if GetNumSpecializations() == 2 then
		DoTalentsButtonsSpec1()
		DoTalentsButtonsSpec2()
	elseif GetNumSpecializations() == 3 then
		DoTalentsButtonsSpec1()
		DoTalentsButtonsSpec2()
		DoTalentsButtonsSpec3()
	elseif GetNumSpecializations() == 4 then
		DoTalentsButtonsSpec1()
		DoTalentsButtonsSpec2()
		DoTalentsButtonsSpec3()
		DoTalentsButtonsSpec4()
	end	
end
-- Show the Equipment - Talents Buttons --
function fmocEquipmentTalentsButtonsShow()
	if GetSpecialization() == 1 then
		fmocOptions3Box4PopOut2:Show()
		fmocOptions3Box4PopOut3:Hide()
		fmocOptions3Box4PopOut4:Hide()
		fmocOptions3Box4PopOut5:Hide()
	elseif GetSpecialization() == 2 then
		fmocOptions3Box4PopOut2:Hide()
		fmocOptions3Box4PopOut3:Show()
		fmocOptions3Box4PopOut4:Hide()
		fmocOptions3Box4PopOut5:Hide()
	elseif GetSpecialization() == 3 then
		fmocOptions3Box4PopOut2:Hide()
		fmocOptions3Box4PopOut3:Hide()
		fmocOptions3Box4PopOut4:Show()
		fmocOptions3Box4PopOut5:Hide()
	elseif GetSpecialization() == 4 then
		fmocOptions3Box4PopOut2:Hide()
		fmocOptions3Box4PopOut3:Hide()
		fmocOptions3Box4PopOut4:Hide()
		fmocOptions3Box4PopOut5:Show()
	end
end
-- button 1 do it --
fmocOptions3Box4Button1.Text:SetText("Assign the Equipment")
fmocOptions3Box4Button1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nAssign the selected Equipmet set|nto the selected Talent Loadout!")
end)
fmocOptions3Box4Button1:SetScript("OnLeave", fmocLeavingMenus)
-- on click --
fmocOptions3Box4Button1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		for k = 1, 4, 1 do
			if GetSpecialization() == k then
				if _G["fmocOptions3Box4PopOut"..k+1]:GetText() == "None" or _G["fmocOptions3Box4PopOut"..k+1]:GetText() == nil or fmocOptions3Box4PopOut1:GetText() == "None" or fmocOptions3Box4PopOut1:GetText() == nil then
					fmocTime = GameTime_GetTime(false)
					DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..C_AddOns.GetAddOnMetadata("FMoC", "Title").."] One of the Choices is 'None' or 'nil'!")
				elseif _G["fmocOptions3Box4PopOut"..k+1]:GetText() ~= "None" and _G["fmocOptions3Box4PopOut"..k+1]:GetText() ~= nil and fmocOptions3Box4PopOut1:GetText() ~= "None" and fmocOptions3Box4PopOut1:GetText() ~= nil then
					if FMoCtalentsProfile[_G["FMoCspec"..k]][_G["fmocOptions3Box4PopOut"..k+1]:GetText()] == nil then
						FMoCtalentsProfile[_G["FMoCspec"..k]][_G["fmocOptions3Box4PopOut"..k+1]:GetText()] = FMoCtalentsProfile[fmocOptions3Box4PopOut1:GetText()]
					else
						FMoCtalentsProfile[_G["FMoCspec"..k]][_G["fmocOptions3Box4PopOut"..k+1]:GetText()] = FMoCtalentsProfile[fmocOptions3Box4PopOut1:GetText()]
					end
					fmocTime = GameTime_GetTime(false)
					DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..C_AddOns.GetAddOnMetadata("FMoC", "Title").."] The Equipment Set '"..fmocHighColor:WrapTextInColorCode(fmocOptions3Box4PopOut1:GetText()).."' has been assign to the '"..fmocMainColor:WrapTextInColorCode(_G["fmocOptions3Box4PopOut"..k+1]:GetText()).."' Talent Loadout!")
				end
			end
		end
	end
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	fmocOptions3Box3PopOut1.Text:SetText(FMoCtalentButtons["Direction"])
end
-- Showing the panel --
fmocOptions3:HookScript("OnShow", function(self)
	CheckSavedVariables()
	ShowingHidingTalentsButton()
	fmocEquipmentTalentsButtonsShow()
	for k = 1, 5, 1 do
		_G["fmocOptions3Box4PopOut"..k]:SetText("None")
	end
	if fmocOptions2:IsShown() then fmocOptions2:Hide() end
	if fmocOptions1:IsShown() then fmocOptions1:Hide() end
	if fmocOptions4:IsShown() then fmocOptions4:Hide() end
	if fmocOptions5:IsShown() then fmocOptions5:Hide() end
	fmocOptions00Tab1.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab2.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab3.Text:SetTextColor(fmocHighColor:GetRGB())
	fmocOptions00Tab4.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab5.Text:SetTextColor(fmocMainColor:GetRGB())
end)
-- hiding the panel --
fmocOptions3:SetScript("OnHide", function (self)
	FMoCtalentsBase:SetMouseClickEnabled(false)
	FMoCtalentsBase:RegisterForDrag("None")
	FMoCtalentsBase:Hide()
	fmocTalentsButtonsCheck()
	fmocTalentsButtonsShow()
end)
