-- Function for stoping the movement --
function fmocStopMoving(self, var1, var2, var3)
	var1[var2] = Round(self:GetLeft())
	var1[var3] = Round(self:GetBottom())
	self:StopMovingOrSizing()
end
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "ADDON_LOADED" and arg1 == "FMoC_Options" then
		fmocEquipmentButtonsCreate()
		fmocEquipmentTalentsButtonsCreate()
	end
end
fmocZlave:HookScript("OnEvent", EventsTime)
