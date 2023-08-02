local Storage = CreateFrame("Frame")

SLASH_VintageEclipse1 = "/eclipse"
SlashCmdList.VintageEclipse = function(msg, editBox)
   local commandList = "/eclipse [scale/size] [number]\n /eclipse [reset]\n /eclipse [help]"
	local action, value = strsplit(" ", msg)
   if (action == "help")
   then
		print(ChatPrefix, "following commands exist:\n", commandList)
   elseif (action == "scale" or action == "size")
   then
      if (tonumber(value) and true or false) then  
         StinkiStorage.scale = (tonumber(value) or 1)
         ReloadUI()
      else
         print(ChatPrefix, "current scale is set to", StinkiStorage.scale)
      end
   elseif (action == "reset")
   then
      StinkiStorage.point = "CENTER"
      StinkiStorage.xOfs = 0
      StinkiStorage.yOfs = 0
      ReloadUI()
   else
		print(ChatPrefix, "command unknown, see\n", commandList)
   end
end

local function AddonLoaded(self, event, addOnName)
	if addOnName == "VintageEclipse" then
		StinkiStorage = StinkiStorage or {}
		StinkiStorage.scale = (StinkiStorage.scale or 1.5)
      StinkiStorage.xOfs = (StinkiStorage.xOfs or 0)
      StinkiStorage.yOfs = (StinkiStorage.yOfs or 0)
      StinkiStorage.point = (StinkiStorage.point or "CENTER")
      if (type(StinkiStorage.point) ~= "string") or (StinkiStorage.xOfs == 0 and StinkiStorage.yOfs == 0)
      then
         StinkiStorage.point = "CENTER"
      end
      
      local className, classFilename, classId = UnitClass("player");
      if classId == 11 and GetSpecialization() == 1 then
         RenderVintageEclipse()
      end
	end
end

Storage:RegisterEvent("ADDON_LOADED")
Storage:SetScript("OnEvent", AddonLoaded)