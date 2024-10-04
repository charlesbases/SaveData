CWRandomMax = {
    description = "Cyberware Max Random Stat"
}

function CWRandomMax:new()
    registerForEvent("onInit", function()
        if TweakDB:GetFlat("CyberwareRandom.Max") ~= true then
            TweakDB:SetFlat("CyberwareRandom.Max", true)
            TweakDB:SetFlat("Modifiers.BonusQuickHackDamageRandom.min", TweakDB:GetFlat("Modifiers.BonusQuickHackDamageRandom.max"))
            TweakDB:SetFlat("Modifiers.MeleeDamagePercentBonusRandom.min", TweakDB:GetFlat("Modifiers.MeleeDamagePercentBonusRandom.max"))
            TweakDB:SetFlat("Modifiers.ReloadSpeedPercentBonusRandom.min", TweakDB:GetFlat("Modifiers.ReloadSpeedPercentBonusRandom.max"))
            TweakDB:SetFlat("Modifiers.CritChanceRandom.min", TweakDB:GetFlat("Modifiers.CritChanceRandom.max"))
            TweakDB:SetFlat("Modifiers.CritDamageRandom.min", TweakDB:GetFlat("Modifiers.CritDamageRandom.max"))
            TweakDB:SetFlat("Modifiers.MitigationChanceRandom.min", TweakDB:GetFlat("Modifiers.MitigationChanceRandom.max"))
            TweakDB:SetFlat("Modifiers.MitigationStrengthRandom.min", TweakDB:GetFlat("Modifiers.MitigationStrengthRandom.max"))
            TweakDB:SetFlat("Modifiers.HealingItemsChargesRegenMultRandom.min", TweakDB:GetFlat("Modifiers.HealingItemsChargesRegenMultRandom.max"))
            TweakDB:SetFlat("Modifiers.HealingItemsEffectPercentBonusRandom.min", TweakDB:GetFlat("Modifiers.HealingItemsEffectPercentBonusRandom.max"))
        end
    end)
end

return CWRandomMax:new()
