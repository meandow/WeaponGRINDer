-- File: WeaponGRINDer.lua
-- Name: WeaponGRINDer
-- Author: Meandow
-- Description: Automatically repairs your weapon
-- Version: 1.0.0

local function GrindWeapon()
	weaponId = 16
	canRepair = CanMerchantRepair()
    if canRepair then
        ShowRepairCursor()
		PickupInventoryItem(weaponId)
    end
end

local function CheckWeapon()
	weaponId = 16
	canRepair = CanMerchantRepair()
	current, maximum = GetInventoryItemDurability(weaponId);
	durability = current/maximum
    if durability == 0 then
		message('Your weapon is broken.')
	elseif durability < 0.12 then
	    message('Your weapon will break on next death.')
	elseif durability < 0.37 then
        message('Your weapon will break on next spirit release.')
    end
end


-- event frame
local grinder = CreateFrame("Frame")
grinder:RegisterEvent("MERCHANT_SHOW")
grinder:SetScript("OnEvent", GrindWeapon)

local checkDurabilityAlive = CreateFrame("Frame")
checkDurabilityAlive:RegisterEvent("PLAYER_ALIVE")
checkDurabilityAlive:SetScript("OnEvent", CheckWeapon)

local checkDurabilityGhost = CreateFrame("Frame")
checkDurabilityGhost:RegisterEvent("PLAYER_UNGHOST")
checkDurabilityGhost:SetScript("OnEvent", CheckWeapon)

local checkDurabilityZone = CreateFrame("Frame")
checkDurabilityZone:RegisterEvent("ZONE_CHANGED")
checkDurabilityZone:SetScript("OnEvent", CheckWeapon)