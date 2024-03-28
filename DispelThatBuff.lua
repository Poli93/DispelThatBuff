local _,class = UnitClass("player")
if class == "SHAMAN" or class == "PRIEST" or class == "WARRIOR" then
	local o = UnitBuff
	UnitBuff = function(unit,...)
		if (unit == "target" or unit == "focus") and UnitIsEnemy("player",unit) then  
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = o(unit,...)
			return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, debuffType == "Magic", shouldConsolidate, spellId
		else
			return o(unit,...)
		end
	end
	hooksecurefunc("TargetFrame_CheckFaction",TargetFrame_UpdateAuras)
	hooksecurefunc("FocusFrame_CheckFaction",FocusFrame_UpdateAuras)
end