-- taking of the panel --
fmocOptions4.TopTxt:SetText("Animations options!")
fmocOptions4Box1.TitleTxt:SetText("Choose the animation!")
fmocOptions4Box2:SetPoint("TOP", fmocOptions4Box1, "BOTTOM", 0, 0)
fmocOptions4Box2.TitleTxt:SetText("Position of the animation!")
fmocOptions4Box3:SetPoint("TOP", fmocOptions4Box2, "BOTTOM", 0, 0)
fmocOptions4Box3.TitleTxt:SetText("Size of the animation!")
-- hiding animation class banner --
local function HidingClassBanner()
	FMoCframeFX:Hide()
	FMoCframeFX:SetAlpha(0)
	FMoCframeFX:SetMouseClickEnabled(false)
end
-- hiding animation runes --
local function HidingRunes()
	FMoCframeFX1:Hide()
	FMoCframeFX1RuneTopLeft:SetAlpha(0)
	FMoCframeFX1RuneBottomRight:SetAlpha(0)
	FMoCframeFX1RuneBottomLeft:SetAlpha(0)
	FMoCframeFX1RuneTopRight:SetAlpha(0)
	FMoCframeFX1RuneTop:SetAlpha(0)
	FMoCframeFX1RuneTopLeftLight:SetAlpha(0)
	FMoCframeFX1RuneBottomRightLight:SetAlpha(0)
	FMoCframeFX1RuneBottomLeftLight:SetAlpha(0)
	FMoCframeFX1RuneTopRightLight:SetAlpha(0)
	FMoCframeFX1RuneTopLight:SetAlpha(0)
end
-- show animation runes --
local function ShowRunes()
	FMoCframeFX1:Show()
	FMoCframeFX1RuneTopLeft:SetAlpha(1)
	FMoCframeFX1RuneBottomRight:SetAlpha(1)
	FMoCframeFX1RuneBottomLeft:SetAlpha(1)
	FMoCframeFX1RuneTopRight:SetAlpha(1)
	FMoCframeFX1RuneTop:SetAlpha(1)
	FMoCframeFX1RuneTopLeftLight:SetAlpha(1)
	FMoCframeFX1RuneBottomRightLight:SetAlpha(1)
	FMoCframeFX1RuneBottomLeftLight:SetAlpha(1)
	FMoCframeFX1RuneTopRightLight:SetAlpha(1)
	FMoCframeFX1RuneTopLight:SetAlpha(1)
end
-- Moving Animation --
FMoCframeFX:RegisterForDrag("RightButton")
FMoCframeFX:SetScript("OnDragStart", FMoCframeFX.StartMoving)
FMoCframeFX:SetScript("OnDragStop", function(self) fmocStopMoving(self, FMoCanimation, "X", "Y") end)
-- Mouse Wheel on Sliders --
local function MouseWheelSlider(self, delta)
	if delta == 1 then
		self:SetValue(self:GetValue() + 1)
		PlaySound(858, "Master")
	elseif delta == -1 then
		self:SetValue(self:GetValue() - 1)
		PlaySound(858, "Master")
	end
end
-- Box 1, pop out 1, Animation Show or Hide --
-- Entering, leaving, click --
fmocOptions4Box1PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nWhat kind of|nAnimation do you want?") 
end)
fmocOptions4Box1PopOut1:SetScript("OnLeave", fmocLeavingMenus)
fmocClickPopOut(fmocOptions4Box1PopOut1, fmocOptions4Box1PopOut1Choice0)
-- sort & clicking --
fmocOptions4Box1PopOut1Choice1:SetParent(fmocOptions4Box1PopOut1Choice0)
fmocOptions4Box1PopOut1Choice1:SetPoint("TOP",fmocOptions4Box1PopOut1Choice0, "BOTTOM", 0, 0)
fmocOptions4Box1PopOut1Choice2:SetParent(fmocOptions4Box1PopOut1Choice0)
fmocOptions4Box1PopOut1Choice2:SetPoint("TOP",fmocOptions4Box1PopOut1Choice1, "BOTTOM", 0, 0)
fmocOptions4Box1PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoCanimation["Background"] = self.Text:GetText()
		fmocOptions4Box1PopOut1Choice0:Hide()
	end
end)
fmocOptions4Box1PopOut1Choice1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoCanimation["Background"] = self.Text:GetText()
		fmocOptions4Box1PopOut1Choice0:Hide()
	end
end)
fmocOptions4Box1PopOut1Choice2:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoCanimation["Background"] = self.Text:GetText()
		fmocOptions4Box1PopOut1Choice0:Hide()
	end
end)
-- naming --
fmocOptions4Box1PopOut1Choice0.Text:SetText("Hide it")
fmocOptions4Box1PopOut1Choice1.Text:SetText("Class Banner")
fmocOptions4Box1PopOut1Choice2.Text:SetText("Runes")
-- Slider 1 Demensions of the Animation --
fmocOptions4Box3Slider1.MinText:SetText(80)
fmocOptions4Box3Slider1.MaxText:SetText(200)
fmocOptions4Box3Slider1.Slider:SetMinMaxValues(80, 200)
-- Entering, Leaving, Mousewheel --
fmocOptions4Box3Slider1.Slider:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title").."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!"))
end)
fmocOptions4Box3Slider1.Slider:SetScript("OnLeave", fmocLeavingMenus)
fmocOptions4Box3Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
fmocOptions4Box3Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	fmocOptions4Box3Slider1.TopText:SetText("Animation's Size: "..self:GetValue())
	FMoCanimation["Width"] = self:GetValue()
	FMoCanimation["Height"] = self:GetValue()
	FMoCframeFX:SetWidth(FMoCanimation["Width"])
	FMoCframeFX:SetHeight(FMoCanimation["Height"])
	local frameX = FMoCframeFX:GetWidth() * 2
	local frameY = FMoCframeFX:GetHeight() * 2
	FMoCframeFXBG:SetSize(frameX, frameY)
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	if FMoCanimation["Background"] == "Class Banner" then
		FMoCframeFX:Show()
		FMoCframeFX:SetAlpha(1)
		FMoCframeFX:SetMouseClickEnabled(true)
		fmocOptions4Box3Slider1.Slider:SetValue(FMoCanimation["Width"])
		HidingRunes()
		fmocOptions4Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The Class Banner now is unlocked and you can move it with the "..fmocHighColor:WrapTextInColorCode("Right Button").." of your mouse.|nJust click and drag with the "..fmocHighColor:WrapTextInColorCode("Right Click").."!")
		if fmocOptions4Box3.CenterText:IsShown() then fmocOptions4Box3.CenterText:Hide() end
		if not fmocOptions4Box3Slider1:IsShown() then fmocOptions4Box3Slider1:Show() end
	elseif FMoCanimation["Background"] == "Runes" then
		HidingClassBanner()
		ShowRunes()
		fmocOptions4Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The Runes can't be moved.")
		if not fmocOptions4Box3.CenterText:IsShown() then fmocOptions4Box3.CenterText:Show() end
		if fmocOptions4Box3Slider1:IsShown() then fmocOptions4Box3Slider1:Hide() end
		fmocOptions4Box3.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The Runes can't change size.")
	elseif FMoCanimation["Background"] == "Hide it" then
		HidingClassBanner()
		HidingRunes()
		fmocOptions4Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a There is nothing that can be moved.")
		if not fmocOptions4Box3.CenterText:IsShown() then fmocOptions4Box3.CenterText:Show() end
		if fmocOptions4Box3Slider1:IsShown() then fmocOptions4Box3Slider1:Hide() end
		fmocOptions4Box3.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a There is nothing that can change size.")
	end
	fmocOptions4Box1PopOut1.Text:SetText(FMoCanimation["Background"])
end
-- Hiding the Pop out buttons --
fmocOptions4Box1PopOut1Choice0:HookScript("OnHide", function (self)
	CheckSavedVariables()
end)
-- Showing the panel --
fmocOptions4:HookScript("OnShow", function(self)
	CheckSavedVariables()
	if fmocOptions1:IsShown() then fmocOptions1:Hide() end
	if fmocOptions2:IsShown() then fmocOptions2:Hide() end
	if fmocOptions3:IsShown() then fmocOptions3:Hide() end
	if fmocOptions5:IsShown() then fmocOptions5:Hide() end
	fmocOptions00Tab1.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab2.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab3.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab4.Text:SetTextColor(fmocHighColor:GetRGB())
	fmocOptions00Tab5.Text:SetTextColor(fmocMainColor:GetRGB())
end)
-- hiding the panel --
fmocOptions4:SetScript("OnHide", function (self)
	HidingClassBanner()
	HidingRunes()
end)
