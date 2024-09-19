fmocOptions5.TopTxt:SetText("Create, load, delete profiles!")
fmocOptions5Box1.TitleTxt:SetText("Create a profile!")
fmocOptions5Box2:SetPoint("TOP", fmocOptions5Box1, "BOTTOM", 0, 0)
fmocOptions5Box2.TitleTxt:SetText("Load a profile!")
fmocOptions5Box3:SetPoint("TOP", fmocOptions5Box2, "BOTTOM", 0, 0)
fmocOptions5Box3.TitleTxt:SetText("Delete a profile!")
fmocOptions5Box3.CenterTxt:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocHighColor:WrapTextInColorCode("Note: ").."When you "..fmocHighColor:WrapTextInColorCode("SAVE")..", "..fmocHighColor:WrapTextInColorCode("LOAD")..", or "..fmocHighColor:WrapTextInColorCode("DELETE").." a Profile, the UI will be RELOADED!")
-- some variables --
local NameExist = false
-- finding keys --
local function FindingKeys()
	local Keys = 0
	for k, v in pairs(FMCrProfile) do
		Keys = Keys + 1
	end
	FMCrNumber = Keys
end
-- coping the tables --
local function CopyTable(k)
	FMoCspecButtons = FMCrProfile[k]["specButtons"]
	FMoCtalentButtons = FMCrProfile[k]["talentButtons"]
	FMoClootButton = FMCrProfile[k]["lootButton"]
	FMoCanimation = FMCrProfile[k]["animation"]
end
-- deleting keys --
local function DeletingKeys(self)
	for k, v in pairs(FMCrProfile) do
		if k == self:GetText() then
		FMCrProfile[k] = nil
		end
	end
end
-- functions for loading the profiles --
local function LoadingProfiles()
	if FMCrCounterLoading == 0 and FMCrNumber > 0 then
		for k, v in pairs(FMCrProfile) do
			FMCrCounterLoading = FMCrCounterLoading + 1
			local button = CreateFrame("Button" , "fmocOptions5Box2PopOut1Choice"..FMCrCounterLoading, fmocOptions5Box2PopOut1Choice0, "fmocPopOutButton")
			_G["fmocOptions5Box2PopOut1Choice"..FMCrCounterLoading]:SetPoint("TOP","fmocOptions5Box2PopOut1Choice"..FMCrCounterLoading - 1, "BOTTOM", 0, 0)
			_G["fmocOptions5Box2PopOut1Choice"..FMCrCounterLoading].Text:SetText(k)
			_G["fmocOptions5Box2PopOut1Choice"..FMCrCounterLoading]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					CopyTable(k)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- functions for deleting the profiles --
local function DeletingProfiles()
	if FMCrCounterDeleting == 0 and FMCrNumber > 0 then
		for k, v in pairs(FMCrProfile) do
			FMCrCounterDeleting = FMCrCounterDeleting + 1
			local button = CreateFrame("Button" , "fmocOptions5Box3PopOut1Choice"..FMCrCounterDeleting, fmocOptions5Box3PopOut1Choice0, "fmocPopOutButton")
			_G["fmocOptions5Box3PopOut1Choice"..FMCrCounterDeleting]:SetPoint("TOP","fmocOptions5Box3PopOut1Choice"..FMCrCounterDeleting - 1, "BOTTOM", 0, 0)
			_G["fmocOptions5Box3PopOut1Choice"..FMCrCounterDeleting].Text:SetText(k)
			_G["fmocOptions5Box3PopOut1Choice"..FMCrCounterDeleting]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					DeletingKeys(self)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- taking care of the edit box --
-- width and height --
local fontFile, height, flags = fmocOptions5Box1EditBox1.WritingLine:GetFont()
fmocOptions5Box1EditBox1.WritingLine:SetHeight(height)
fmocOptions5Box1EditBox1:SetWidth(fmocOptions5Box1:GetWidth()*0.65)
fmocOptions5Box1EditBox1:SetHeight(fmocOptions5Box1EditBox1.WritingLine:GetHeight()*1.75)
fmocOptions5Box1EditBox1.WritingLine:SetWidth(fmocOptions5Box1EditBox1:GetWidth()*0.95)
-- entering, leaving --
fmocOptions5Box1EditBox1.WritingLine:HookScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nWrite a name for your profile in the Edit Box and|npress enter to save your settings/options!") 
end)
fmocOptions5Box1EditBox1.WritingLine:HookScript("OnLeave", fmocLeavingMenus)
-- pressing enter --
fmocOptions5Box1EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		local name = self:GetText()
		for k, v in pairs(FMCrProfile) do
			if k == name then
				NameExist = true
			else
				NameExist = false
			end
			if NameExist then
				local fmocTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] This Profile already exist please try another name!")
				return
			end
		end
		FMCrNumber = FMCrNumber + 1
		FMCrProfile[name] = {specButtons = FMoCspecButtons, talentButtons = FMoCtalentButtons, lootButton = FMoClootButton, animation = FMoCanimation}
		C_UI.Reload()
	else
		local fmocTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] Please enter a name for your profile!")
	end
end)
-- Box 1, Load a profile --
-- Popout 1, Load --
fmocOptions5Box2PopOut1:SetWidth(fmocOptions5Box2:GetWidth()*0.65)
-- enter --
fmocOptions5Box2PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nSelect one of the profiles to be "..fmocHighColor:WrapTextInColorCode("LOADED!")) 
end)
-- leave --
fmocOptions5Box2PopOut1:SetScript("OnLeave", fmocLeavingMenus)
-- drop down --
fmocClickPopOut(fmocOptions5Box2PopOut1, fmocOptions5Box2PopOut1Choice0)
-- click --
fmocOptions5Box2PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local fmocTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] I did nothing, I literally do nothing as button!")
		fmocOptions5Box2PopOut1Choice0:Hide()
	end
end)
-- naming --
fmocOptions5Box2PopOut1Choice0.Text:SetText("Nothing")
-- Box 2, Delete a profile --
-- Popout 1, Delete --
fmocOptions5Box3PopOut1:SetWidth(fmocOptions5Box3:GetWidth()*0.65)
-- enter --
fmocOptions5Box3PopOut1:SetScript("OnEnter", function(self)
	fmocEnteringMenus(self)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nSelect one of the profiles to be "..fmocHighColor:WrapTextInColorCode("DELETED!")) 
end)
-- leave --
fmocOptions5Box3PopOut1:SetScript("OnLeave", fmocLeavingMenus)
-- drop down --
fmocClickPopOut(fmocOptions5Box3PopOut1, fmocOptions5Box3PopOut1Choice0)
-- click --
fmocOptions5Box3PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local fmocTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." |A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] I did nothing, I literally do nothing as button!")
		fmocOptions5Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
fmocOptions5Box3PopOut1Choice0.Text:SetText("Nothing")
-- Showing the panel --
fmocOptions5:HookScript("OnShow", function(self)
	FindingKeys()
	LoadingProfiles()
	DeletingProfiles()
	fmocOptions5Box2PopOut1.Text:SetText("Click me")
	fmocOptions5Box3PopOut1.Text:SetText("Click me")
	if fmocOptions2:IsShown() then fmocOptions2:Hide() end
	if fmocOptions3:IsShown() then fmocOptions3:Hide() end
	if fmocOptions4:IsShown() then fmocOptions4:Hide() end
	if fmocOptions1:IsShown() then fmocOptions1:Hide() end
	fmocOptions00Tab1.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab2.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab3.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab4.Text:SetTextColor(fmocMainColor:GetRGB())
	fmocOptions00Tab5.Text:SetTextColor(fmocHighColor:GetRGB())
end)
-- taking of the options panels --
for i = 1, 5, 1 do
	_G["fmocOptions"..i]:ClearAllPoints()
	_G["fmocOptions"..i]:SetPoint("TOPLEFT", fmocOptions00, "TOPLEFT", 0, 0)
	_G["fmocOptions"..i].BGtexture:SetAlpha(1)
	_G["fmocOptions"..i].CenterTxt:Hide()
	_G["fmocOptions"..i].BottomTxt:Hide()
	_G["fmocOptions"..i].BottomLeftTxt:Hide()
end
