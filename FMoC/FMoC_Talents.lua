-- taking care of the base of talents --
FMoCtalentsBase:SetMouseClickEnabled(false)
FMoCtalentsBase:SetText("Right Click and drag to move me!")
-- enter on talents button --
for i = 1, 4, 1 do
	_G["fmocButtonTalents"..i]:HookScript("OnEnter", function(self)
		fmocEnteringMenus(self)
		GameTooltip:SetText("|A:"..C_AddOns.GetAddOnMetadata("FMoC", "IconAtlas")..":16:16|a "..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."|nChoose your Talent Loadout!") 
	end)
end
-- leave talents button --
for i = 1, 4, 1 do
	_G["fmocButtonTalents"..i]:HookScript("OnLeave", function(self) fmocLeavingMenus(self) end)
end
-- taking care of the Choice0 --
for k = 1, 4, 1 do
	_G["fmocButtonTalents"..k.."Choice0"].Text:SetText("Nothing")
	_G["fmocButtonTalents"..k.."Choice0"]:SetWidth(_G["fmocButtonTalents"..k.."Choice0"].Text:GetWidth() * 1.50)
	_G["fmocButtonTalents"..k.."Choice0"]:SetScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			local fmocTime = GameTime_GetTime(false)
			DEFAULT_CHAT_FRAME:AddMessage(fmocTime.." ["..fmocMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("FMoC", "Title")).."] I did nothing, I literally do nothing as button!")
			_G["fmocButtonTalents"..k.."Choice0"]:Hide()
		end
	end)
end
-- function for creating Talents Button for 2 specs --
local function DoButtonsSpec2()
-- Spec 1 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec1)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec1Layouts = FMoCspec1Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents1Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", fmocButtonTalents1Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", "FMoCspec1Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", "FMoCspec1Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 2 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec2)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec2Layouts = FMoCspec2Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents2Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", fmocButtonTalents2Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", "FMoCspec2Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", "FMoCspec2Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
end
-- function for creating Talents Button for 3 specs --
local function DoButtonsSpec3()
-- Spec 1 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec1)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec1Layouts = FMoCspec1Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents1Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", fmocButtonTalents1Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", "FMoCspec1Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", "FMoCspec1Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 2 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec2)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec2Layouts = FMoCspec2Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents2Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", fmocButtonTalents2Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", "FMoCspec2Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", "FMoCspec2Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 3 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec3)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec3Layouts = FMoCspec3Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec3Pop"..k1, fmocButtonTalents3Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents3Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("TOP", fmocButtonTalents3Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec3Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec3Pop"..k1]:SetWidth(_G["FMoCspec3Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec3Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec3"]["one"] = FMoCspec3
								FMoCtalentsProfile["LastConfig"]["spec3"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec3"]["two"] end
								fmocButtonTalents3Choice0:Hide()
							else
								fmocButtonTalents3Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec3Pop"..k1, fmocButtonTalents3Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("BOTTOM", "FMoCspec3Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("TOP", "FMoCspec3Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec3Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec3Pop"..k1]:HookScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec3"]["one"] = FMoCspec3
								FMoCtalentsProfile["LastConfig"]["spec3"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec3"]["two"] end
								fmocButtonTalents3Choice0:Hide()
							else
								fmocButtonTalents3Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
end
-- function for creating Talents Button for 4 specs --
local function DoButtonsSpec4()
-- Spec 1 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec1)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec1Layouts = FMoCspec1Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents1Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", fmocButtonTalents1Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec1Pop"..k1, fmocButtonTalents1Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("BOTTOM", "FMoCspec1Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec1Pop"..k1]:ClearAllPoints()
						_G["FMoCspec1Pop"..k1]:SetPoint("TOP", "FMoCspec1Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec1Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec1Pop"..k1]:SetWidth(_G["FMoCspec1Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec1Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec1"]["one"] = FMoCspec1
								FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec1"]["two"] end
								fmocButtonTalents1Choice0:Hide()
							else
								fmocButtonTalents1Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 2 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec2)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec2Layouts = FMoCspec2Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents2Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", fmocButtonTalents2Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec2Pop"..k1, fmocButtonTalents2Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("BOTTOM", "FMoCspec2Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec2Pop"..k1]:ClearAllPoints()
						_G["FMoCspec2Pop"..k1]:SetPoint("TOP", "FMoCspec2Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec2Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec2Pop"..k1]:SetWidth(_G["FMoCspec2Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec2Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec2"]["one"] = FMoCspec2
								FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec2"]["two"] end
								fmocButtonTalents2Choice0:Hide()
							else
								fmocButtonTalents2Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 3 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec3)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec3Layouts = FMoCspec3Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec3Pop"..k1, fmocButtonTalents3Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents3Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("TOP", fmocButtonTalents3Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec3Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec3Pop"..k1]:SetWidth(_G["FMoCspec3Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec3Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec3"]["one"] = FMoCspec3
								FMoCtalentsProfile["LastConfig"]["spec3"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec3"]["two"] end
								fmocButtonTalents3Choice0:Hide()
							else
								fmocButtonTalents3Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec3Pop"..k1, fmocButtonTalents3Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("BOTTOM", "FMoCspec3Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec3Pop"..k1]:ClearAllPoints()
						_G["FMoCspec3Pop"..k1]:SetPoint("TOP", "FMoCspec3Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec3Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec3Pop"..k1]:SetWidth(_G["FMoCspec3Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec3Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec3"]["one"] = FMoCspec3
								FMoCtalentsProfile["LastConfig"]["spec3"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec3"]["two"] end
								fmocButtonTalents3Choice0:Hide()
							else
								fmocButtonTalents3Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
-- Spec 4 --
	for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(FMoCspec4)) do
		for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
			if k11 == "name" then
				FMoCspec4Layouts = FMoCspec4Layouts + 1
				if k1 == 1 then
					local dobtn = CreateFrame("Button", "FMoCspec4Pop"..k1, fmocButtonTalents4Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec4Pop"..k1]:ClearAllPoints()
						_G["FMoCspec4Pop"..k1]:SetPoint("BOTTOM", fmocButtonTalents4Choice0, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec4Pop"..k1]:ClearAllPoints()
						_G["FMoCspec4Pop"..k1]:SetPoint("TOP", fmocButtonTalents4Choice0, "BOTTOM", 0, 0)
					end
					_G["FMoCspec4Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec4Pop"..k1]:SetWidth(_G["FMoCspec4Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec4Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec4"]["one"] = FMoCspec4
								FMoCtalentsProfile["LastConfig"]["spec4"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec4"]["two"] end
								fmocButtonTalents4Choice0:Hide()
							else
								fmocButtonTalents4Choice0:Hide()
							end
						end
					end)
				elseif k1 >= 2 then
					local dobtn = CreateFrame("Button", "FMoCspec4Pop"..k1, fmocButtonTalents4Choice0, "fmocPopOutButton")
					if FMoCtalentButtons["Direction"] == "Upward" then
						_G["FMoCspec4Pop"..k1]:ClearAllPoints()
						_G["FMoCspec4Pop"..k1]:SetPoint("BOTTOM", "FMoCspec4Pop"..k1 - 1, "TOP", 0, 0)
					elseif FMoCtalentButtons["Direction"] == "Downward" then
						_G["FMoCspec4Pop"..k1]:ClearAllPoints()
						_G["FMoCspec4Pop"..k1]:SetPoint("TOP", "FMoCspec4Pop"..k1 - 1, "BOTTOM", 0, 0)
					end
					_G["FMoCspec4Pop"..k1]:SetText(k1.. ". ".. v11)
					_G["FMoCspec4Pop"..k1]:SetWidth(_G["FMoCspec4Pop"..k1].Text:GetWidth() * 1.50)
					_G["FMoCspec4Pop"..k1]:SetScript("OnClick", function(self, button, down)
						if button == "LeftButton" and down == false then
							if not IsPlayerMoving() then
								C_ClassTalents.LoadConfig(v1, true)
								FMoCtalentsProfile["LastConfig"]["spec4"]["one"] = FMoCspec4
								FMoCtalentsProfile["LastConfig"]["spec4"]["two"] = v1
								if PlayerSpellsFrame ~= nil then PlayerSpellsFrame.TalentsFrame.commitedConfigID = FMoCtalentsProfile["LastConfig"]["spec4"]["two"] end
								fmocButtonTalents4Choice0:Hide()
							else
								fmocButtonTalents4Choice0:Hide()
							end
						end
					end)
				end
			end
		end
	end
end
-- creating global variables --
local function CreateGlobalVariables()
	fmocOverlayCastbar = false
-- function for Talents Buttons positioning --
	function fmocTalentsButtonsPosition()
		FMoCtalentsBase:ClearAllPoints()
		FMoCtalentsBase:SetPoint("BOTTOM", UIParent, "BOTTOMLEFT", FMoCtalentButtons["baseX"], FMoCtalentButtons["baseY"])
		for k = 1, 4, 1 do
			_G["fmocButtonTalents"..k].NormalTexture:SetVertexColor(fmocClassColor:GetRGB())
		end
	end
-- function for Talents Buttons direction --
	function fmocTalentsButtonsDirection()
		for k = 1, 4, 1 do
			if FMoCtalentButtons["Direction"] == "Upward" then
				_G["fmocButtonTalents"..k.."Choice0"]:ClearAllPoints()
				_G["fmocButtonTalents"..k.."Choice0"]:SetPoint("BOTTOM", _G["fmocButtonTalents"..k], "TOP", 0, -4)
			elseif FMoCtalentButtons["Direction"] == "Downward" then
				_G["fmocButtonTalents"..k.."Choice0"]:ClearAllPoints()
				_G["fmocButtonTalents"..k.."Choice0"]:SetPoint("TOP", _G["fmocButtonTalents"..k], "BOTTOM", 0, 4)
			end
		end
	end
-- Create the talents Button --
	function fmocTalentsButtonsCreate()
		if GetNumSpecializations() == 2 then
			FMoCspec1 = (select (1, GetSpecializationInfo(1)))
			FMoCspec2 = (select (1, GetSpecializationInfo(2)))
			DoButtonsSpec2()
		elseif GetNumSpecializations() == 3 then
			FMoCspec1 = (select (1, GetSpecializationInfo(1)))
			FMoCspec2 = (select (1, GetSpecializationInfo(2)))
			FMoCspec3 = (select (1, GetSpecializationInfo(3)))
			DoButtonsSpec3()
		elseif GetNumSpecializations() == 4 then
			FMoCspec1 = (select (1, GetSpecializationInfo(1)))
			FMoCspec2 = (select (1, GetSpecializationInfo(2)))
			FMoCspec3 = (select (1, GetSpecializationInfo(3)))
			FMoCspec4 = (select (1, GetSpecializationInfo(4)))
			DoButtonsSpec4()
		end	
	end
-- Show the Talents Button --
	function fmocTalentsButtonsShow()
		if GetSpecialization() == 1 then
			fmocButtonTalents1:Show()
			fmocButtonTalents2:Hide()
			fmocButtonTalents3:Hide()
			fmocButtonTalents4:Hide()
		elseif GetSpecialization() == 2 then
			fmocButtonTalents1:Hide()
			fmocButtonTalents2:Show()
			fmocButtonTalents3:Hide()
			fmocButtonTalents4:Hide()
		elseif GetSpecialization() == 3 then
			fmocButtonTalents1:Hide()
			fmocButtonTalents2:Hide()
			fmocButtonTalents3:Show()
			fmocButtonTalents4:Hide()
		elseif GetSpecialization() == 4 then
			fmocButtonTalents1:Hide()
			fmocButtonTalents2:Hide()
			fmocButtonTalents3:Hide()
			fmocButtonTalents4:Show()
		end
	end
-- function for profile talent equipment --
	function fmocProfileTalentsEquipment()
		if GetNumSpecializations() == 2 then
			if FMoCtalentsProfile[FMoCspec1] == nil then FMoCtalentsProfile[FMoCspec1] = {} end
			if FMoCtalentsProfile[FMoCspec2] == nil then FMoCtalentsProfile[FMoCspec2] = {} end
		elseif GetNumSpecializations() == 3 then
			if FMoCtalentsProfile[FMoCspec1] == nil then FMoCtalentsProfile[FMoCspec1] = {} end
			if FMoCtalentsProfile[FMoCspec2] == nil then FMoCtalentsProfile[FMoCspec2] = {} end
			if FMoCtalentsProfile[FMoCspec3] == nil then FMoCtalentsProfile[FMoCspec3] = {} end
		elseif GetNumSpecializations() == 4 then
			if FMoCtalentsProfile[FMoCspec1] == nil then FMoCtalentsProfile[FMoCspec1] = {} end
			if FMoCtalentsProfile[FMoCspec2] == nil then FMoCtalentsProfile[FMoCspec2] = {} end
			if FMoCtalentsProfile[FMoCspec3] == nil then FMoCtalentsProfile[FMoCspec3] = {} end
			if FMoCtalentsProfile[FMoCspec4] == nil then FMoCtalentsProfile[FMoCspec4] = {} end
		end	
	end
-- function pre checking talents button --
	function fmocTalentsButtonsPreCheck()
		if GetSpecialization() == 1 then
			if fmocOverlayCastbar then
				FMoCtalentsProfile["LastConfig"]["spec1"]["two"] = PlayerSpellsFrame.TalentsFrame.LoadSystem.lastValidSelectionID
				fmocOverlayCastbar = false
			end
			C_ClassTalents.UpdateLastSelectedSavedConfigID(FMoCtalentsProfile["LastConfig"]["spec1"]["one"], FMoCtalentsProfile["LastConfig"]["spec1"]["two"])
		elseif GetSpecialization() == 2 then
			if fmocOverlayCastbar then
				FMoCtalentsProfile["LastConfig"]["spec2"]["two"] = PlayerSpellsFrame.TalentsFrame.LoadSystem.lastValidSelectionID
				fmocOverlayCastbar = false
			end
			C_ClassTalents.UpdateLastSelectedSavedConfigID(FMoCtalentsProfile["LastConfig"]["spec2"]["one"], FMoCtalentsProfile["LastConfig"]["spec2"]["two"])
		elseif GetSpecialization() == 3 then
			if fmocOverlayCastbar then
				FMoCtalentsProfile["LastConfig"]["spec3"]["two"] = PlayerSpellsFrame.TalentsFrame.LoadSystem.lastValidSelectionID
				fmocOverlayCastbar = false
			end
			C_ClassTalents.UpdateLastSelectedSavedConfigID(FMoCtalentsProfile["LastConfig"]["spec3"]["one"], FMoCtalentsProfile["LastConfig"]["spec3"]["two"])
		elseif GetSpecialization() == 4 then
			if fmocOverlayCastbar then
				FMoCtalentsProfile["LastConfig"]["spec4"]["two"] = PlayerSpellsFrame.TalentsFrame.LoadSystem.lastValidSelectionID
				fmocOverlayCastbar = false
			end
			C_ClassTalents.UpdateLastSelectedSavedConfigID(FMoCtalentsProfile["LastConfig"]["spec4"]["one"], FMoCtalentsProfile["LastConfig"]["spec4"]["two"])
		end
	end
-- Checking the Talents --
	function fmocTalentsButtonsCheck()
		local chkSpecID = PlayerUtil.GetCurrentSpecID()
		local chkTalentID = C_ClassTalents.GetLastSelectedSavedConfigID(chkSpecID)
		if chkTalentID == nil then
			if GetSpecialization() == 1 then
				fmocButtonTalents1:SetText("Starter Build")
				FMoCtalentsBase:SetWidth(fmocButtonTalents1.Text:GetWidth() * 1.50)
			elseif GetSpecialization() == 2 then
				fmocButtonTalents2:SetText("Starter Build")
				FMoCtalentsBase:SetWidth(fmocButtonTalents2.Text:GetWidth() * 1.50)
			elseif GetSpecialization() == 3 then
				fmocButtonTalents3:SetText("Starter Build")
				FMoCtalentsBase:SetWidth(fmocButtonTalents3.Text:GetWidth() * 1.50)
			elseif GetSpecialization() == 4 then
				fmocButtonTalents4:SetText("Starter Build")
				FMoCtalentsBase:SetWidth(fmocButtonTalents4.Text:GetWidth() * 1.50)
			end
		else
			for k1, v1 in pairs(C_ClassTalents.GetConfigIDsBySpecID(chkSpecID)) do
				for k11, v11 in pairs(C_Traits.GetConfigInfo(v1)) do
					if v1 == chkTalentID and k11 == "name" then
						if GetSpecialization() == 1 then
							fmocButtonTalents1:SetText(k1.. ". ".. v11)
							FMoCtalentsBase:SetWidth(fmocButtonTalents1.Text:GetWidth() * 1.50)
							if FMoCtalentsProfile[FMoCspec1][fmocButtonTalents1:GetText()] ~= nil then
								local _, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(FMoCtalentsProfile[FMoCspec1][fmocButtonTalents1:GetText()])
								if isEquipped == false then C_EquipmentSet.UseEquipmentSet(FMoCtalentsProfile[FMoCspec1][fmocButtonTalents1:GetText()]) end
							end
						elseif GetSpecialization() == 2 then
							fmocButtonTalents2:SetText(k1.. ". ".. v11)
							FMoCtalentsBase:SetWidth(fmocButtonTalents2.Text:GetWidth() * 1.50)
							if FMoCtalentsProfile[FMoCspec2][fmocButtonTalents2:GetText()] ~= nil then
								local _, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(FMoCtalentsProfile[FMoCspec2][fmocButtonTalents2:GetText()])
								if isEquipped == false then C_EquipmentSet.UseEquipmentSet(FMoCtalentsProfile[FMoCspec2][fmocButtonTalents2:GetText()]) end
							end
						elseif GetSpecialization() == 3 then
							fmocButtonTalents3:SetText(k1.. ". ".. v11)
							FMoCtalentsBase:SetWidth(fmocButtonTalents3.Text:GetWidth() * 1.50)
							if FMoCtalentsProfile[FMoCspec3][fmocButtonTalents3:GetText()] ~= nil then
								local _, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(FMoCtalentsProfile[FMoCspec3][fmocButtonTalents3:GetText()])
								if isEquipped == false then C_EquipmentSet.UseEquipmentSet(FMoCtalentsProfile[FMoCspec3][fmocButtonTalents3:GetText()]) end
							end
						elseif GetSpecialization() == 4 then
							fmocButtonTalents4:SetText(k1.. ". ".. v11)
							FMoCtalentsBase:SetWidth(fmocButtonTalents4.Text:GetWidth() * 1.50)
							if FMoCtalentsProfile[FMoCspec4][fmocButtonTalents4:GetText()] ~= nil then
								local _, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(FMoCtalentsProfile[FMoCspec4][fmocButtonTalents4:GetText()])
								if isEquipped == false then C_EquipmentSet.UseEquipmentSet(FMoCtalentsProfile[FMoCspec4][fmocButtonTalents4:GetText()]) end
							end
						end
					end
				end
			end
		end
	end
end
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		CreateGlobalVariables()
		fmocTalentsButtonsPosition()
		fmocTalentsButtonsDirection()
		fmocTalentsButtonsCreate()
		fmocProfileTalentsEquipment()
		fmocTalentsButtonsShow()
		fmocTalentsButtonsCheck()
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" and UnitLevel("player") >= 10 and GetSpecialization() ~= 5 then
		fmocTalentsButtonsShow()
		fmocTalentsButtonsPreCheck()
		fmocTalentsButtonsCheck()
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" and arg1 == "player" and (arg3 == 200749 or arg3 == 384255) then
		fmocTalentsButtonsCheck()
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "player" and arg3 == 384255 then
		fmocTalentsButtonsPreCheck()
		fmocTalentsButtonsCheck()
	end
end
fmocZlave:HookScript("OnEvent", EventsTime)
