-- ===========================================================================
-- UNIQUE UNIT: 12TH DIVISION OPERATIVE (Оперативник 12-го отряда)
-- Заменяет Мечника (UNIT_SWORDSMAN)
-- ===========================================================================

INSERT INTO Types
        (Type,                          Kind)
VALUES  ('UNIT_SDRI_OPERATIVE',         'KIND_UNIT'),
        ('TRAIT_UNIT_SDRI_OPERATIVE',   'KIND_TRAIT');

INSERT INTO Traits
        (TraitType,                     Name,                           Description)
VALUES  ('TRAIT_UNIT_SDRI_OPERATIVE',   'LOC_UNIT_SDRI_OPERATIVE_NAME', 'LOC_UNIT_SDRI_OPERATIVE_DESCRIPTION');

INSERT INTO CivilizationTraits
        (CivilizationType,      TraitType)
VALUES  ('CIVILIZATION_GOTEI13', 'TRAIT_UNIT_SDRI_OPERATIVE');

INSERT INTO UnitReplaces
        (CivUniqueUnitType,     ReplacesUnitType)
VALUES  ('UNIT_SDRI_OPERATIVE', 'UNIT_SWORDSMAN');

INSERT INTO Units
        (UnitType,              Name,                           Description,                            Domain,         FormationClass,                 PromotionClass,         BaseMoves,  BaseSightRange, Combat, RangedCombat, Range,  Cost,   Maintenance,    PrereqTech,         PrereqCivic,    StrategicResource,  BuildCharges,   AdvisorType,        PurchaseYield,  TraitType)
VALUES  ('UNIT_SDRI_OPERATIVE', 'LOC_UNIT_SDRI_OPERATIVE_NAME', 'LOC_UNIT_SDRI_OPERATIVE_DESCRIPTION', 'DOMAIN_LAND',  'FORMATION_CLASS_LAND_COMBAT',  'PROMOTION_CLASS_MELEE', 3,          2,              38,     0,            0,      90,     2,              'TECH_IRON_WORKING', NULL,           'RESOURCE_IRON',    0,              'ADVISOR_CONQUEST','YIELD_GOLD',     'TRAIT_UNIT_SDRI_OPERATIVE');

INSERT INTO UnitUpgrades
        (Unit,                  UpgradeUnit)
VALUES  ('UNIT_SDRI_OPERATIVE', 'UNIT_MUSKETMAN');