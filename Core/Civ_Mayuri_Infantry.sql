-- ===========================================================================
-- UNIQUE UNIT: 12TH DIVISION LINE INFANTRY (Линейный пехотинец 12-го отряда)
-- Заменяет Линейного пехотинца (UNIT_LINE_INFANTRY)
-- ===========================================================================

INSERT INTO Types
        (Type,                              Kind)
VALUES  ('UNIT_SDRI_LINE_INFANTRY',         'KIND_UNIT'),
        ('TRAIT_UNIT_SDRI_LINE_INFANTRY',   'KIND_TRAIT');

INSERT INTO Traits
        (TraitType,                         Name,                               Description)
VALUES  ('TRAIT_UNIT_SDRI_LINE_INFANTRY',   'LOC_UNIT_SDRI_LINE_INFANTRY_NAME', 'LOC_UNIT_SDRI_LINE_INFANTRY_DESCRIPTION');

INSERT INTO CivilizationTraits
        (CivilizationType,      TraitType)
VALUES  ('CIVILIZATION_GOTEI13', 'TRAIT_UNIT_SDRI_LINE_INFANTRY');

-- Динамическая замена: если в игре есть UNIT_LINE_INFANTRY (GS/NFP), заменяет его; иначе UNIT_INFANTRY
INSERT INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType)
SELECT 'UNIT_SDRI_LINE_INFANTRY', 'UNIT_LINE_INFANTRY'
WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_LINE_INFANTRY');

INSERT INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType)
SELECT 'UNIT_SDRI_LINE_INFANTRY', 'UNIT_INFANTRY'
WHERE NOT EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_LINE_INFANTRY');

INSERT INTO Units
        (UnitType,                  Name,                               Description,                                Domain,         FormationClass,                 PromotionClass,         BaseMoves,  BaseSightRange, Combat, RangedCombat, Range,  Cost,   Maintenance,    PrereqTech,                 PrereqCivic,    StrategicResource,  BuildCharges,   AdvisorType,        PurchaseYield,  TraitType)
VALUES  ('UNIT_SDRI_LINE_INFANTRY', 'LOC_UNIT_SDRI_LINE_INFANTRY_NAME', 'LOC_UNIT_SDRI_LINE_INFANTRY_DESCRIPTION', 'DOMAIN_LAND',  'FORMATION_CLASS_LAND_COMBAT',  'PROMOTION_CLASS_MELEE', 3,         2,              68,     0,            0,      360,    5,              'TECH_MILITARY_SCIENCE',    NULL,           'RESOURCE_NITER',   0,              'ADVISOR_CONQUEST','YIELD_GOLD',     'TRAIT_UNIT_SDRI_LINE_INFANTRY');

INSERT INTO UnitUpgrades
        (Unit,                      UpgradeUnit)
VALUES  ('UNIT_SDRI_LINE_INFANTRY', 'UNIT_INFANTRY');