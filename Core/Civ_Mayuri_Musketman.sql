-- ===========================================================================
-- UNIQUE UNIT: 12TH DIVISION LIEUTENANT (Лейтенант 12-го отряда)
-- Заменяет Мушкетера (UNIT_MUSKETMAN)
-- ===========================================================================

INSERT INTO Types
        (Type,                          Kind)
VALUES  ('UNIT_SDRI_LIEUTENANT',        'KIND_UNIT'),
        ('TRAIT_UNIT_SDRI_LIEUTENANT',  'KIND_TRAIT');

INSERT INTO Traits
        (TraitType,                     Name,                           Description)
VALUES  ('TRAIT_UNIT_SDRI_LIEUTENANT',   'LOC_UNIT_SDRI_LIEUTENANT_NAME', 'LOC_UNIT_SDRI_LIEUTENANT_DESCRIPTION');

INSERT INTO CivilizationTraits
        (CivilizationType,      TraitType)
VALUES  ('CIVILIZATION_GOTEI13', 'TRAIT_UNIT_SDRI_LIEUTENANT');

INSERT INTO UnitReplaces
        (CivUniqueUnitType,     ReplacesUnitType)
VALUES  ('UNIT_SDRI_LIEUTENANT', 'UNIT_MUSKETMAN');

INSERT INTO Units
        (UnitType,              Name,                           Description,                            Domain,         FormationClass,                 PromotionClass,         BaseMoves,  BaseSightRange, Combat, RangedCombat, Range,  Cost,   Maintenance,    PrereqTech,         PrereqCivic,    StrategicResource,  BuildCharges,   AdvisorType,        PurchaseYield,  TraitType)
VALUES  ('UNIT_SDRI_LIEUTENANT', 'LOC_UNIT_SDRI_LIEUTENANT_NAME', 'LOC_UNIT_SDRI_LIEUTENANT_DESCRIPTION', 'DOMAIN_LAND',  'FORMATION_CLASS_LAND_COMBAT',  'PROMOTION_CLASS_MELEE', 3,          2,              58,     0,            0,      220,    4,              'TECH_GUNPOWDER',   NULL,           'RESOURCE_NITER',   0,              'ADVISOR_CONQUEST','YIELD_GOLD',     'TRAIT_UNIT_SDRI_LIEUTENANT');

-- Апгрейд: в Линейного пехотинца, если он есть в игре, иначе в Пехотинца
INSERT INTO UnitUpgrades (Unit, UpgradeUnit)
SELECT 'UNIT_SDRI_LIEUTENANT', 'UNIT_LINE_INFANTRY'
WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_LINE_INFANTRY');

INSERT INTO UnitUpgrades (Unit, UpgradeUnit)
SELECT 'UNIT_SDRI_LIEUTENANT', 'UNIT_INFANTRY'
WHERE NOT EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_LINE_INFANTRY');