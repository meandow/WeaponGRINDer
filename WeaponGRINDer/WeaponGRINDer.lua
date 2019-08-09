-- File: WeaponGRINDer.lua
-- Name: WeaponGRINDer
-- Author: Meandow
-- Description: Repair your weapon
-- Version: 1.0.0

local function GrindWeapon()
	canRepair = CanMerchantRepair()
	current, maximum = GetInventoryItemDurability(16);
	needsRepair = (current/maximum) < 0.8
    if canRepair and needsRepair then
        ShowRepairCursor()
		message('Bitch your weapon is low on durability')
    end
end

-- event frame
local grinder = CreateFrame("Frame")
grinder:RegisterEvent("MERCHANT_SHOW")
grinder:SetScript("OnEvent", GrindWeapon)