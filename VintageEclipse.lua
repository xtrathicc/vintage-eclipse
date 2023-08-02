local VintageEclipse = CreateFrame("Frame")

function RenderVintageEclipse()
   VintageEclipse.MainFrame = CreateFrame("Frame", nil, UIParent)
   VintageEclipse.MainFrame:SetSize(128 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.MainFrame:SetPoint(StinkiStorage.point, StinkiStorage.xOfs, StinkiStorage.yOfs)
   VintageEclipse.MainFrame:SetMovable(true)
   VintageEclipse.MainFrame:EnableMouse(true)
   VintageEclipse.MainFrame:RegisterForDrag("LeftButton")
   VintageEclipse.MainFrame:SetScript("OnDragStart", function(self, button) self:StartMoving() end)
   VintageEclipse.MainFrame:SetScript("OnDragStop", function(self)
      self:StopMovingOrSizing()
      local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
      StinkiStorage.point = point
      StinkiStorage.xOfs = xOfs
      StinkiStorage.yOfs = yOfs
   end)

   VintageEclipse.Bar = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.Bar:SetFrameLevel(4)
   VintageEclipse.Bar.texture = VintageEclipse.Bar:CreateTexture()
   VintageEclipse.Bar.texture:SetPoint("CENTER", VintageEclipse.MainFrame)
   VintageEclipse.Bar.texture:SetSize(128 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.Bar.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\EclipseBarBackground")

   VintageEclipse.SolarIcon = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.SolarIcon:SetFrameLevel(3)
   VintageEclipse.SolarIcon.texture = VintageEclipse.SolarIcon:CreateTexture()
   VintageEclipse.SolarIcon.texture:SetPoint("CENTER", VintageEclipse.MainFrame, 48 * StinkiStorage.scale,
      -2 * StinkiStorage.scale)
   VintageEclipse.SolarIcon.texture:SetSize(32 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.SolarIcon.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\SolarInactive")

   VintageEclipse.LunarIcon = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.LunarIcon:SetFrameLevel(3)
   VintageEclipse.LunarIcon.texture = VintageEclipse.LunarIcon:CreateTexture()
   VintageEclipse.LunarIcon.texture:SetPoint("CENTER", VintageEclipse.MainFrame, -48 * StinkiStorage.scale,
      -2 * StinkiStorage.scale)
   VintageEclipse.LunarIcon.texture:SetSize(32 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.LunarIcon.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\LunarInactive")

   VintageEclipse.SolarBarGlow = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.SolarBarGlow:SetFrameLevel(5)
   VintageEclipse.SolarBarGlow.texture = VintageEclipse.SolarBarGlow:CreateTexture()
   VintageEclipse.SolarBarGlow.texture:SetPoint("CENTER", VintageEclipse.MainFrame, 29 * StinkiStorage.scale,
      -1 * StinkiStorage.scale)
   VintageEclipse.SolarBarGlow.texture:SetSize(64 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.SolarBarGlow.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\SolarActiveBarOverlay")
   VintageEclipse.SolarBarGlow:SetAlpha(0)

   VintageEclipse.LunarBarGlow = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.LunarBarGlow:SetFrameLevel(5)
   VintageEclipse.LunarBarGlow.texture = VintageEclipse.LunarBarGlow:CreateTexture()
   VintageEclipse.LunarBarGlow.texture:SetPoint("CENTER", VintageEclipse.MainFrame, -29 * StinkiStorage.scale,
      -1 * StinkiStorage.scale)
   VintageEclipse.LunarBarGlow.texture:SetSize(70 * StinkiStorage.scale, 32 * StinkiStorage.scale)
   VintageEclipse.LunarBarGlow.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\LunarActiveBarOverlay")
   VintageEclipse.LunarBarGlow:SetAlpha(0)

   VintageEclipse.SolarIconGlow = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.SolarIconGlow:SetFrameLevel(6)
   VintageEclipse.SolarIconGlow.texture = VintageEclipse.SolarIconGlow:CreateTexture()
   VintageEclipse.SolarIconGlow.texture:SetPoint("CENTER", VintageEclipse.MainFrame, 49 * StinkiStorage.scale,
      -1.5 * StinkiStorage.scale)
   VintageEclipse.SolarIconGlow.texture:SetSize(38 * StinkiStorage.scale, 38 * StinkiStorage.scale)
   VintageEclipse.SolarIconGlow.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\SolarActiveOverlay")
   VintageEclipse.SolarIconGlow:SetAlpha(0)

   VintageEclipse.LunarIconGlow = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.LunarIconGlow:SetFrameLevel(6)
   VintageEclipse.LunarIconGlow.texture = VintageEclipse.LunarIconGlow:CreateTexture()
   VintageEclipse.LunarIconGlow.texture:SetPoint("CENTER", VintageEclipse.MainFrame, -51 * StinkiStorage.scale,
      -3 * StinkiStorage.scale)
   VintageEclipse.LunarIconGlow.texture:SetSize(38 * StinkiStorage.scale, 38 * StinkiStorage.scale)
   VintageEclipse.LunarIconGlow.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\LunarActiveOverlay")
   VintageEclipse.LunarIconGlow:SetAlpha(0)

   VintageEclipse.Cooldown = CreateFrame("Cooldown", "VintageEclipse.Cooldown", VintageEclipse.MainFrame,
      "CooldownFrameTemplate")
   VintageEclipse.Cooldown:SetFrameLevel(10)
   VintageEclipse.Cooldown:SetPoint("CENTER", VintageEclipse.MainFrame)
   VintageEclipse.Cooldown:SetDrawBling(false)
   VintageEclipse.Cooldown:SetDrawEdge(false)
   VintageEclipse.Cooldown:SetDrawSwipe(false)

   VintageEclipse.AstralPowerStatusBar = CreateFrame("StatusBar", nil, VintageEclipse.MainFrame)
   VintageEclipse.AstralPowerStatusBar:SetFrameLevel(1)
   VintageEclipse.AstralPowerStatusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
   VintageEclipse.AstralPowerStatusBar:GetStatusBarTexture():SetHorizTile(false)
   VintageEclipse.AstralPowerStatusBar:SetMinMaxValues(0, 100)
   VintageEclipse.AstralPowerStatusBar:SetValue(UnitPower("player", 8))
   VintageEclipse.AstralPowerStatusBar:SetWidth(80 * StinkiStorage.scale)
   VintageEclipse.AstralPowerStatusBar:SetHeight(8 * StinkiStorage.scale)
   VintageEclipse.AstralPowerStatusBar:SetPoint("CENTER", VintageEclipse.MainFrame, "CENTER", 0, -18 * StinkiStorage.scale)
   VintageEclipse.AstralPowerStatusBar:SetStatusBarColor(RGBAToFloat(248, 200, 220))

   VintageEclipse.AstralPowerValue = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.AstralPowerValue:SetFrameLevel(9)
   VintageEclipse.AstralPowerValue.text = VintageEclipse.AstralPowerValue:CreateFontString(nil, "Overlay",
      "GameFontHighlight")
   VintageEclipse.AstralPowerValue.text:SetPoint("CENTER", VintageEclipse.MainFrame, "CENTER", 0, -18.5 * StinkiStorage
      .scale)
   VintageEclipse.AstralPowerValue.text:SetText((UnitPower("player", 8) > 0) and UnitPower("player", 8) or "")
   VintageEclipse.AstralPowerValue.text:SetFont("Fonts\\FRIZQT__.TTF", 8 * StinkiStorage.scale, "OUTLINE, MONOCHROME")
   --Mixin(EclipseAstralPowerBar,SmoothStatusBarMixin)

   VintageEclipse.AstralPowerBackground = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.AstralPowerBackground:SetFrameLevel(0)
   VintageEclipse.AstralPowerBackground.texture = VintageEclipse.AstralPowerBackground:CreateTexture()
   VintageEclipse.AstralPowerBackground.texture:SetPoint("CENTER", VintageEclipse.MainFrame, "CENTER", 0,
      -18 * StinkiStorage.scale)
   VintageEclipse.AstralPowerBackground.texture:SetSize(80 * StinkiStorage.scale, 8 * StinkiStorage.scale)
   VintageEclipse.AstralPowerBackground.texture:SetColorTexture(RGBAToFloat(48, 25, 52))

   -- Astral Power Bar Border
   VintageEclipse.AstralPowerBorder = CreateFrame("Frame", nil, VintageEclipse.MainFrame)
   VintageEclipse.AstralPowerBorder:SetFrameLevel(2)
   VintageEclipse.AstralPowerBorder.texture = VintageEclipse.AstralPowerBorder:CreateTexture()
   VintageEclipse.AstralPowerBorder.texture:SetPoint("CENTER", VintageEclipse.MainFrame, "CENTER", 0,
      -17 * StinkiStorage.scale)
   VintageEclipse.AstralPowerBorder.texture:SetSize(140 * StinkiStorage.scale, 16 * StinkiStorage.scale)
   VintageEclipse.AstralPowerBorder.texture:SetTexture("Interface\\AddOns\\VintageEclipse\\textures\\AstralPowerBorder")
end

local function startEclipseCooldown(duration, eclipse)
   VintageEclipse.Cooldown:SetCooldown(GetTime(), duration)
   VintageEclipse.Cooldown:SetScript("OnCooldownDone", function()
      AnimationFadeOut(VintageEclipse.SolarIconGlow, 0.15)
      AnimationFadeOut(VintageEclipse.SolarBarGlow, 0.15)
      AnimationFadeOut(VintageEclipse.LunarIconGlow, 0.15)
      AnimationFadeOut(VintageEclipse.LunarBarGlow, 0.15)
   end)
   if eclipse == "solar" then
      AnimationFadeIn(VintageEclipse.SolarIconGlow, 0.075)
      AnimationFadeIn(VintageEclipse.SolarBarGlow, 0.075)
   end
   if eclipse == "lunar" then
      AnimationFadeIn(VintageEclipse.LunarIconGlow, 0.075)
      AnimationFadeIn(VintageEclipse.LunarBarGlow, 0.075)
   end
end


local function UnitAura(self, event, unitTarget, updateInfo)
   if (updateInfo.addedAuras and unitTarget == "player") then
      for k, v in pairs(updateInfo.addedAuras) do
         if (v.spellId == 48517) then -- solar
            startEclipseCooldown(v.duration, "solar")
         end
         if (v.spellId == 48518) then --lunar
            startEclipseCooldown(v.duration, "lunar")
         end
      end
   end
end

local function UnitPowerUpdate(self, event, unitTarget, powerType)
   if (unitTarget == "player" and powerType == "LUNAR_POWER") then
      VintageEclipse.AstralPowerValue.text:SetText((UnitPower("player", 8) > 0) and UnitPower("player", 8) or "")
      VintageEclipse.AstralPowerStatusBar:SetValue(UnitPower("player", 8));
   end
end

local function PlayerSpecializationChanged(self, event, unitTarget)
   local className, classFilename, classId = UnitClass("player");
   if classId == 11 and GetSpecialization() == 1 then
      RenderVintageEclipse()
      VintageEclipse.MainFrame:SetAlpha(1)
   else
      if VintageEclipse.MainFrame ~= nil then
         VintageEclipse.MainFrame:SetAlpha(0)
      end
   end
end

VintageEclipse.UnitAura = CreateFrame("Frame")
VintageEclipse.UnitAura:RegisterEvent("UNIT_AURA")
VintageEclipse.UnitAura:SetScript("OnEvent", UnitAura)

VintageEclipse.UnitPowerUpdate = CreateFrame("Frame")
VintageEclipse.UnitPowerUpdate:RegisterEvent("UNIT_POWER_UPDATE")
VintageEclipse.UnitPowerUpdate:SetScript("OnEvent", UnitPowerUpdate)

VintageEclipse.PlayerSpecializationChanged = CreateFrame("Frame")
VintageEclipse.PlayerSpecializationChanged:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
VintageEclipse.PlayerSpecializationChanged:SetScript("OnEvent", PlayerSpecializationChanged)