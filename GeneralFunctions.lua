ChatPrefix = "@VintageEclipse:"

function dump(o)
  if type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end

function AnimationFadeIn(target, duration)
  if target:GetAlpha() < 1 then
    C_Timer.After(duration / 5, function() target:SetAlpha((1 - target:GetAlpha()) / 5) end)
    C_Timer.After(duration / 5 * 2, function() target:SetAlpha((1 - target:GetAlpha()) / 5 * 2) end)
    C_Timer.After(duration / 5 * 3, function() target:SetAlpha((1 - target:GetAlpha()) / 5 * 3) end)
    C_Timer.After(duration / 5 * 4, function() target:SetAlpha((1 - target:GetAlpha()) / 5 * 4) end)
    C_Timer.After(duration, function() target:SetAlpha(1) end)
  end
end

function AnimationFadeOut(target, duration)
  if target:GetAlpha() > 0 then
    C_Timer.After(duration / 5, function() target:SetAlpha(target:GetAlpha() / 5 * 4) end)
    C_Timer.After(duration / 5 * 2, function() target:SetAlpha(target:GetAlpha() / 5 * 3) end)
    C_Timer.After(duration / 5 * 3, function() target:SetAlpha(target:GetAlpha() / 5 * 2) end)
    C_Timer.After(duration / 5 * 4, function() target:SetAlpha(target:GetAlpha() / 5) end)
    C_Timer.After(duration, function() target:SetAlpha(0) end)
  end
end

function RGBAToFloat(r, g, b, a)
  return 1 / 255 * r, 1 / 255 * g, 1 / 255 * b, a or 1
end