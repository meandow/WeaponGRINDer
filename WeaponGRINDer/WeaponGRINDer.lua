-- File: WeaponGRINDer.lua
-- Name: WeaponGRINDer
-- Author: Meandow
-- Description: Automatically repairs your weapon
-- Version: 1.0.0

local function GrindWeapon()
	weaponId = 16
	canRepair = CanMerchantRepair()
	current, maximum = GetInventoryItemDurability(weaponId);
	needsRepair = (current/maximum) < 0.8
    if canRepair and needsRepair then
        ShowRepairCursor()
		PickupInventoryItem(weaponId)
    end
end

-- event frame
local grinder = CreateFrame("Frame")
grinder:RegisterEvent("MERCHANT_SHOW")
grinder:SetScript("OnEvent", GrindWeapon)