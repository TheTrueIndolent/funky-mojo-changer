-- function for showing the menu --
function fmocShowMenu()
	if not fmocOptions00:IsShown() then
		fmocOptions00:Show()
	else
		fmocOptions00:Hide()
	end
end
-- Slash Command --
SLASH_FUNKYMOJOCHAGER1, SLASH_FUNKYMOJOCHAGER2 = '/fmoc', '/funkymojochanger'
function SlashCmdList.FUNKYMOJOCHAGER(msg, editBox)
	fmocShowMenu()
end
-- Colors --
fmocMainColor = CreateColorFromRGBAHexString("F0E68CFF")
fmocHighColor = CreateColorFromRGBAHexString("FF7F50FF")
fmocNoMainColor = CreateColorFromRGBAHexString("F0E68C00")
fmocNoHighColor = CreateColorFromRGBAHexString("FF7F5000")
-- Mini Map Button Functions --
-- Clicky Clicky --
function fmocMinimapClick(addonName, buttonName)
	if buttonName == "LeftButton" then
		fmocShowMenu()
	end
end
-- On Enter --
function fmocMinimapOnEnter()
	GameTooltip_ClearStatusBars(GameTooltip)
	GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
	GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nClick: "..fmocMainColor:WrapTextInColorCode("Open the main panel of settings!")) 
	GameTooltip:Show()
end
-- On Leave --
function fmocMinimapOnLeave()
	GameTooltip:Hide()
end
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
