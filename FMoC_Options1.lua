-- taking of the panel --
fmocOptions1.TopTxt:SetText("Specialization buttons options!")
fmocOptions1Box1.TitleTxt:SetText("Demensions of the specialization buttons")
fmocOptions1Box2:SetPoint("TOP", fmocOptions1Box1, "BOTTOM", 0, 0)
fmocOptions1Box2.TitleTxt:SetText("Position of the specialization buttons")
fmocOptions1Box2.CenterText:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a The Specialization Buttons now are unlocked and you can move them with the "..fmocHighColor:WrapTextInColorCode("Right Button").." of your mouse!|nJust click and drag with the "..fmocHighColor:WrapTextInColorCode("Right Click").."!")
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
-- Moving Spec button --
for k = 1, 3, 1 do
	_G["fmocButtonSpec"..k]:SetScript("OnDragStart", _G["fmocButtonSpec"..k].StartMoving)
	_G["fmocButtonSpec"..k]:SetScript("OnDragStop", function(self) fmocStopMoving(self, FMoCspecButtons, "Button"..k.."x", "Button"..k.."y") end)
end
-- Slider 1 Demensions of the Specialization Buttons --
fmocOptions1Box1Slider1.MinText:SetText(16)
fmocOptions1Box1Slider1.MaxText:SetText(80)
fmocOptions1Box1Slider1.Slider:SetMinMaxValues(16, 80)
-- Entering, Leaving, Mousewheel --
fmocOptions1Box1Slider1.Slider:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nYou can also use your mousewheel|nor the buttons to the edge|nto change the value!")
end)
fmocOptions1Box1Slider1.Slider:SetScript("OnLeave", fmocLeavingMenus)
fmocOptions1Box1Slider1.Slider:SetScript("OnMouseWheel", MouseWheelSlider)
-- On Value Changed --
fmocOptions1Box1Slider1.Slider:SetScript("OnValueChanged", function (self, value, userInput)
	fmocOptions1Box1Slider1.TopText:SetText("Spec Buttons Size: "..self:GetValue())
	FMoCspecButtons["Demension"] = self:GetValue()
	for k = 1, 3, 1 do
		_G["fmocButtonSpec"..k]:SetWidth(FMoCspecButtons["Demension"])
		_G["fmocButtonSpec"..k]:SetHeight(FMoCspecButtons["Demension"])
		_G["fmocButtonSpec"..k.."Circle"]:SetWidth(FMoCspecButtons["Demension"] * 3)
		_G["fmocButtonSpec"..k.."Circle"]:SetHeight(FMoCspecButtons["Demension"] * 3)
	end
end)
-- Checking the Saved Variables --
local function CheckSavedVariables()
	fmocOptions1Box1Slider1.Slider:SetValue(FMoCspecButtons["Demension"])
end
-- Showing the panel --
fmocOptions1:HookScript("OnShow", function(self)
	CheckSavedVariables()
	if fmocOptions2:IsShown() then fmocOptions2:Hide() end
	if fmocOptions3:IsShown() then fmocOptions3:Hide() end
	if fmocOptions4:IsShown() then fmocOptions4:Hide() end
	if fmocOptions5:IsShown() then fmocOptions5:Hide() end
	fmocOptions00Tab1.Text:SetTextColor(fmocHighColor:GetRGB())
	fmocOptions00Tab2.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab3.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab4.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab5.Text:SetTextColor(fmocMainColor:GetRGB())
	for k = 1, 3, 1 do
		_G["fmocButtonSpec"..k]:RegisterForDrag("RightButton")
	end
end)
-- hiding the panel --
fmocOptions1:SetScript("OnHide", function (self)
	for k = 1, 3, 1 do
		_G["fmocButtonSpec"..k]:RegisterForDrag("None")
	end
end)
