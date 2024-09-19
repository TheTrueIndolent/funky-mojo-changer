-- taking care of the panel --
fmocOptions0.BGtexture:SetAlpha(0.70)
fmocOptions0.TopTxt:SetText("It would be good when you open the"..fmocHighColor:WrapTextInColorCode(" Options' Panel ").."to close the other ones so you can watch what changes you are making!")
fmocOptions0.CenterTxt:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("FMoC", "Title").." is an add on that enchants your way of changing your Specialization, your Talents Loadout and your Loot Specialization!|n|nPress the button below to open the options pane!")
fmocOptions0.BottomTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
-- button 1 do it --
fmocOptions0Button1.Text:SetText("Options Panel")
fmocOptions0Button1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick: "..fmocMainColor:WrapTextInColorCode("Open the main panel of settings!")) 
end)
fmocOptions0Button1:SetScript("OnLeave", fmocLeavingMenus)
-- on click --
fmocOptions0Button1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		fmocShowMenu()
	end
end)
-- Move the Tabs --
fmocOptions00:RegisterForDrag("LeftButton")
fmocOptions00:SetScript("OnDragStart", fmocOptions00.StartMoving)
fmocOptions00:SetScript("OnDragStop", fmocOptions00.StopMovingOrSizing)
-- taking care of the Tabs --
fmocOptions00Tab2:SetPoint("TOP", fmocOptions00Tab1, "BOTTOM", 0, 0)
fmocOptions00Tab3:SetPoint("TOP", fmocOptions00Tab2, "BOTTOM", 0, 0)
fmocOptions00Tab4:SetPoint("TOP", fmocOptions00Tab3, "BOTTOM", 0, 0)
fmocOptions00Tab5:SetPoint("TOP", fmocOptions00Tab4, "BOTTOM", 0, 0)
fmocOptions00Tab1.Text:SetText("Spec Buttons")
fmocOptions00Tab2.Text:SetText("Loot Buttons")
fmocOptions00Tab3.Text:SetText("Talents Buttons")
fmocOptions00Tab4.Text:SetText("Animations")
fmocOptions00Tab5.Text:SetText("Profiles")
fmocOptions00Tab1.CenterTxt:Hide()
fmocOptions00Tab2.CenterTxt:Hide()
fmocOptions00Tab3.CenterTxt:Hide()
fmocOptions00Tab4.CenterTxt:Hide()
fmocOptions00Tab5.CenterTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
fmocOptions00.BGtexture:SetGradient("VERTICAL", fmocNoMainColor, fmocMainColor)
fmocOptions00.BGtexture:ClearAllPoints()
fmocOptions00.BGtexture:SetPoint("TOPRIGHT", fmocOptions00, "TOPRIGHT", 0, 0)
fmocOptions00.BGtexture:SetPoint("BOTTOMLEFT", fmocOptions00Tab5, "BOTTOMLEFT", 0, -128)
-- clicking on the tabs --
fmocOptions00Tab1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not fmocOptions1:IsShown() then fmocOptions1:Show() end
	end
end)
fmocOptions00Tab2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not fmocOptions2:IsShown() then fmocOptions2:Show() end
	end
end)
fmocOptions00Tab3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not fmocOptions3:IsShown() then fmocOptions3:Show() end
	end
end)
fmocOptions00Tab4:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not fmocOptions4:IsShown() then fmocOptions4:Show() end
	end
end)
fmocOptions00Tab5:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		if not fmocOptions5:IsShown() then fmocOptions5:Show() end
	end
end)
-- showing the tabs --
fmocOptions00:SetScript("OnShow", function(self)
	if not fmocOptions1:IsShown() then fmocOptions1:Show() end
end)
-- hiding the tabs --
fmocOptions00:HookScript("OnHide", function(self)
	if fmocOptions1:IsShown() then fmocOptions1:Hide() end
	if fmocOptions2:IsShown() then fmocOptions2:Hide() end
	if fmocOptions3:IsShown() then fmocOptions3:Hide() end
	if fmocOptions4:IsShown() then fmocOptions4:Hide() end
	if fmocOptions5:IsShown() then fmocOptions5:Hide() end
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		local category = Settings.RegisterCanvasLayoutCategory(self, "FMoC")
		category:SetName("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..C_AddOns.GetAddOnMetadata("FMoC", "Title"))
		Settings.RegisterAddOnCategory(category)
	end
end
fmocOptions0:SetScript("OnEvent", EventsTime)
