DesiredModifiers = {
    "Modifiers.CritChanceRandom",
    "Modifiers.CritDamageRandom",
    "Modifiers.MitigationChanceRandom",
    "Modifiers.MitigationStrengthRandom",
    "Modifiers.BonusQuickHackDamageRandom",
    "Modifiers.MeleeDamagePercentBonusRandom",
    "Modifiers.ReloadSpeedPercentBonusRandom",
    "Modifiers.HealingItemsChargesRegenMultRandom",
    "Modifiers.HealingItemsEffectPercentBonusRandom"
}

-- Copy paste your desired modifiers from the list below to above
-- DO NOT PUT A COMMA FOR THE LAST ONE IN THE LIST
-- If you delete a modifier from the list above, it may disappear from cyberwares that already have it
-- Do not modify any code from hereon

AllModifiers = {
    "Modifiers.ADSSpeedPercentBonusRandom",
    "Modifiers.ArmorRandom",
    "Modifiers.BleedingApplicationRateRandom",
    "Modifiers.BonusCritChanceVsElectrocutedEnemiesRandom",
    "Modifiers.BonusDamageAgainstBossesRandom",
    "Modifiers.BonusPercentDamageToEnemiesAtFullHealthRandom",
    "Modifiers.BonusPercentDamageToEnemiesBelowHalfHealthRandom",
    "Modifiers.BonusPercentDamageVsBurningEnemiesRandom",
    "Modifiers.BonusQuickHackDamageRandom",
    "Modifiers.BonusRicochetDamageRandom",
    "Modifiers.BurningApplicationRateRandom",
    "Modifiers.CarryCapacityRandom",
    "Modifiers.ChemicalDamageRandom",
    "Modifiers.ChemicalDamagePercentBonusRandom",
    "Modifiers.CritChanceRandom",
    "Modifiers.CritDamageRandom",
    "Modifiers.DamageOverTimePercentBonusRandom",
    "Modifiers.DamageOverTimeResistanceRandom",
    "Modifiers.DodgeStaminaCostReductionRandom",
    "Modifiers.DurationBonusQuickhackRandom",
    "Modifiers.ElectricDamageRandom",
    "Modifiers.ElectricDamagePercentBonusRandom",
    "Modifiers.ElectrocutedApplicationRateRandom",
    "Modifiers.ExplosionDamagePercentBonusRandom",
    "Modifiers.ExplosionResistanceRandom",
    "Modifiers.GrenadesChargesRegenMultRandom",
    "Modifiers.HeadshotDamageMultiplierRandom",
    "Modifiers.HealingItemsChargesRegenMultRandom",
    "Modifiers.HealingItemsEffectPercentBonusRandom",
    "Modifiers.HealOnKillingBleedingTargetRandom",
    "Modifiers.HealthRandom",
    "Modifiers.HealthRegenRandom",
    "Modifiers.HealthRegenPercentRandom",
    "Modifiers.MaxSpeedRandom",
    "Modifiers.MeleeDamagePercentBonusRandom",
    "Modifiers.MeleeResistanceRandom",
    "Modifiers.MitigationChanceRandom",
    "Modifiers.MitigationStrengthRandom",
    "Modifiers.PercentDamageReductionFromPoisonedEnemiesRandom",
    "Modifiers.PhysicalDamageRandom",
    "Modifiers.PoisonedApplicationRateRandom",
    "Modifiers.QuickhacksCooldownReductionRandom",
    "Modifiers.RamOnKillRandom",
    "Modifiers.RecoilPercentBonusRandom",
    "Modifiers.ReloadSpeedPercentBonusRandom",
    "Modifiers.StealthHitDamageBonusRandom",
    "Modifiers.ThermalDamageRandom",
    "Modifiers.ThermalDamagePercentBonusRandom",
    "Modifiers.VisibilityReductionRandom",
    "Modifiers.BossResistanceRandom",
    "Modifiers.ChemicalResistanceRandom",
    "Modifiers.ElectricResistanceRandom",
    "Modifiers.GrenadeDamagePercentBonusRandom",
    "Modifiers.HealthRegainOnKillRandom",
    "Modifiers.MechResistanceRandom",
    "Modifiers.QuickhackResistanceRandom",
    "Modifiers.ThermalResistanceRandom"
}


ListsToReplace = {
    "ModifierGroups.BodyCyberwareAdvancedDriverUpdate.statModifiers",
    "ModifierGroups.BodyCyberwareSimple.statModifiers",
    "ModifierGroups.BodyCyberwareSpecialized.statModifiers",
    "ModifierGroups.BodyCyberwareAdvanced.statModifiers",
    "ModifierGroups.CoolCyberwareSimple.statModifiers",
    "ModifierGroups.CoolCyberwareSpecialized.statModifiers",
    "ModifierGroups.CoolCyberwareAdvanced.statModifiers",
    "ModifierGroups.CoolCyberwareAdvancedDriverUpdate.statModifiers",
    "ModifierGroups.IntelligenceCyberwareSimple.statModifiers",
    "ModifierGroups.IntelligenceCyberwareSpecialized.statModifiers",
    "ModifierGroups.IntelligenceCyberwareAdvanced.statModifiers",
    "ModifierGroups.IntelligenceCyberwareAdvancedDriverUpdate.statModifiers",
    "ModifierGroups.ReflexesCyberwareSimple.statModifiers",
    "ModifierGroups.ReflexesCyberwareSpecialized.statModifiers",
    "ModifierGroups.ReflexesCyberwareAdvanced.statModifiers",
    "ModifierGroups.ReflexesCyberwareAdvancedDriverUpdate.statModifiers",
    "ModifierGroups.TechnicalAbilityCyberwareSimple.statModifiers",
    "ModifierGroups.TechnicalAbilityCyberwareSpecialized.statModifiers",
    "ModifierGroups.TechnicalAbilityCyberwareAdvanced.statModifiers",
    "ModifierGroups.TechnicalAbilityCyberwareAdvancedDriverUpdate.statModifiers",
    "ModifierGroups.SimpleCyberwareModifiers.statModifiers",
    "ModifierGroups.SpecializedCyberwareModifiers.statModifiers",
    "ModifierGroups.AdvancedCyberwareModifiers.statModifiers",
    "ModifierGroups.AdvancedCyberwareModifiersDriverUpdate.statModifiers"
}


CyberwareStatsRandomnessBeGone = {description = "Cyberware Stats Randomness Be Gone"}


function CyberwareStatsRandomnessBeGone:new()

    registerForEvent("onInit", function()
        if TweakDB:GetFlat("CyberwareRandom.Max") ~= true then
            TweakDB:SetFlat("CyberwareRandom.Max", true)
            for k, v in pairs(AllModifiers) do
                TweakDB:SetFlat(v .. ".min", TweakDB:GetFlat(v .. ".max"))
            end
        end

        for k, v in pairs(ListsToReplace) do
            TweakDB:SetFlat(v, DesiredModifiers)
        end

        ObserveBefore("RipperDocGameController", "StartCWUpgrade", function() Game.GetInventoryManager():IncrementCyberwareUpgradeSeed(1) end)

    end)
end

return CyberwareStatsRandomnessBeGone:new()
