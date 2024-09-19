-- taking of the panel --
fmocOptions2.TopTxt:SetText("Loot buttons options!")
fmocOptions2Box1.TitleTxt:SetText("Demensions of the loot buttons")
fmocOptions2Box2:SetPoint("TOP", fmocOptions2Box1, "BOTTOM", 0, 0)
fmocOptions2Box2.TitleTxt:SetText("Position of the loot buttons")
fmocOptions2Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The loot buttons now are unlocked and you can move them with the "..fmocHighColor:WrapTextInColorCode("Right Button").." of your mouse!|nJust click and drag with the "..fmocHighColor:WrapTextInColorCode("Right Click").."!")
fmocOptions2Box3:SetPoint("TOP", fmocOptions2Box2, "BOTTOM", 0, 0)
fmocOptions2Box3.TitleTxt:SetText("Visibility of the loot buttons")
-- Mouse Wheel on Sliders --
local function MouseWheelSlider(self, delta)
	if delta == 1 then
		PlaySound(858, "Master")
		self:SetValue(self:GetValue() + 1)
	elseif delta == -1 then
		PlaySound(858, "Master")
		self:SetValue(self:GetValue() - 1)
	end
end
-- Moving loot Button --
for k = 1, 5, 1 do
	_G["fmocButtonLoot"..k]:SetScript("OnDragStart", _G["fmocButtonLoot"..k].StartMoving)
	_G["fmocButtonLoot"..k]:SetScript("OnDragStop", function(self) fmocStopMoving(self, FMoClootButton, "Button"..k.."x", "Button"..k.."y") end)
end
-- Slider 1 Demensions of the Loot Buttons --
fmocOptions2Box1Slider1.MinText:SetText(16)
fmocOptions2Box1Slider1.MaxText:SetText(80)
fmocOptions2Box1Slider1.Slider:SetMinMaxValues(16, 80)
-- Entering, Leaving, Mousewheel --
fmocOptions2Box1Slider1.Slider:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!")
end)
fmocOptions2Box1Slider1.Slider:SetScript("OnLeave", fmocLeavingMenus)
fmocOptions2Box1Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
fmocOptions2Box1Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	fmocOptions2Box1Slider1.TopText:SetText("Spec Buttons Size: "..self:GetValue())
	FMoClootButton["Demension"] = self:GetValue()
	for k = 1, 5, 1 do
		_G["fmocButtonLoot"..k]:SetWidth(FMoClootButton["Demension"])
		_G["fmocButtonLoot"..k]:SetHeight(FMoClootButton["Demension"])
	end
end)
-- Box 3, pop out 1, Loot Buttons Show or Hide --
-- Entering, leaving, click --
fmocOptions2Box3PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nDo you want the|nLoot Buttons to be shown?") 
end)
fmocOptions2Box3PopOut1:SetScript("OnLeave", fmocLeavingMenus)
fmocClickPopOut(fmocOptions2Box3PopOut1, fmocOptions2Box3PopOut1Choice0)
-- sort & clicking --
fmocOptions2Box3PopOut1Choice1:SetParent(fmocOptions2Box3PopOut1Choice0)
fmocOptions2Box3PopOut1Choice1:SetPoint("TOP",fmocOptions2Box3PopOut1Choice0, "BOTTOM", 0, 0)
fmocOptions2Box3PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoClootButton["Visible"] = self.Text:GetText()
		fmocOptions2Box3PopOut1.Text:SetText(self:GetText())
		fmocOptions2Box3PopOut1Choice0:Hide()
	end
end)
fmocOptions2Box3PopOut1Choice1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		FMoClootButton["Visible"] = self.Text:GetText()
		fmocOptions2Box3PopOut1.Text:SetText(self:GetText())
		fmocOptions2Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
fmocOptions2Box3PopOut1Choice0.Text:SetText("Show")
fmocOptions2Box3PopOut1Choice1.Text:SetText("Hide")
-- Hiding the Pop out buttons --
fmocOptions2Box3PopOut1Choice0:HookScript("OnHide", function (self)
	fmocLootButtonsPosition()
	fmocLootButtonsShowHide()
	fmocLootButtonsSpecCheck()
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	fmocOptions2Box1Slider1.Slider:SetValue(FMoClootButton["Demension"])
	fmocOptions2Box3PopOut1.Text:SetText(FMoClootButton["Visible"])
end
-- Showing the panel --
fmocOptions2:HookScript("OnShow", function(self)
	CheckSavedVariables()
	if fmocOptions1:IsShown() then fmocOptions1:Hide() end
	if fmocOptions3:IsShown() then fmocOptions3:Hide() end
	if fmocOptions4:IsShown() then fmocOptions4:Hide() end
	if fmocOptions5:IsShown() then fmocOptions5:Hide() end
	fmocOptions00Tab1.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab2.Text:SetTextColor(fmocHighColor:GetRGB())
	fmocOptions00Tab3.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab4.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab5.Text:SetTextColor(fmocMainColor:GetRGB())
	for k = 1, 5, 1 do
		_G["fmocButtonLoot"..k]:RegisterForDrag("RightButton")
	end
end)
-- hiding the panel --
fmocOptions2:SetScript("OnHide", function (self)
	for k = 1, 5, 1 do
		_G["fmocButtonLoot"..k]:RegisterForDrag("None")
	end
end)
