-- Colors --
fmocMainColor = CreateColorFromRGBAHexString("F0E68CFF")
fmocHighColor = CreateColorFromRGBAHexString("FF7F50FF")
fmocNoMainColor = CreateColorFromRGBAHexString("F0E68C00")
fmocNoHighColor = CreateColorFromRGBAHexString("FF7F5000")
-- function for showing the menu --
function fmocShowMenu()
	if not InCombatLockdown() then
		if UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
			if not fmocOptions00:IsShown() then
				fmocOptions00:Show()
			else
				fmocOptions00:Hide()
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
-- Function for stoping the movement --
function fmocStopMoving(self, var1, var2, var3)
	var1[var2] = Round(self:GetLeft())
	var1[var3] = Round(self:GetBottom())
	self:StopMovingOrSizing()
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
