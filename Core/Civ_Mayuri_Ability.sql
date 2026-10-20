-- ===========================================================================
-- LEADER ABILITY: RESEARCH AND SACRIFICE (Подопытные)
-- Победа над вражеским боевым юнитом захватывает его на месте гибели:
--   * обычные войска       -> Подопытный I   (UNIT_SDRI_SUBJECT)
--   * уникальные юниты 12-го отряда -> Подопытный II (UNIT_SDRI_SUBJECT_2, x2 Науки)
-- Подопытных можно потратить только в районе «НИИ Синигами» (Lua-скрипт).
-- ===========================================================================

-- 1. Тег «элитный юнит 12-го отряда» для трёх уникальных юнитов
INSERT INTO Tags
        (Tag,                   Vocabulary)
VALUES  ('CLASS_SDRI_ELITE',    'ABILITY_CLASS');

INSERT INTO TypeTags
        (Type,                      Tag)
VALUES  ('UNIT_SDRI_OPERATIVE',     'CLASS_SDRI_ELITE'),
        ('UNIT_SDRI_LIEUTENANT',    'CLASS_SDRI_ELITE'),
        ('UNIT_SDRI_LINE_INFANTRY', 'CLASS_SDRI_ELITE');

-- 2. Наборы требований: «обычный юнит» / «элитный юнит»
INSERT INTO Requirements
        (RequirementId,                     RequirementType,                Inverse)
VALUES  ('MAYURI_REQUIRES_NON_ELITE_UNIT',  'REQUIREMENT_UNIT_TAG_MATCHES', 1),
        ('MAYURI_REQUIRES_ELITE_UNIT',      'REQUIREMENT_UNIT_TAG_MATCHES', 0);

INSERT INTO RequirementArguments
        (RequirementId,                     Name,   Value)
VALUES  ('MAYURI_REQUIRES_NON_ELITE_UNIT',  'Tag',  'CLASS_SDRI_ELITE'),
        ('MAYURI_REQUIRES_ELITE_UNIT',      'Tag',  'CLASS_SDRI_ELITE');

INSERT INTO RequirementSets
        (RequirementSetId,              RequirementSetType)
VALUES  ('MAYURI_NON_ELITE_UNIT_SET',   'REQUIREMENTSET_TEST_ALL'),
        ('MAYURI_ELITE_UNIT_SET',       'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
        (RequirementSetId,              RequirementId)
VALUES  ('MAYURI_NON_ELITE_UNIT_SET',   'MAYURI_REQUIRES_NON_ELITE_UNIT'),
        ('MAYURI_ELITE_UNIT_SET',       'MAYURI_REQUIRES_ELITE_UNIT');

-- 3. Типы способностей
INSERT INTO Types
        (Type,                                  Kind)
VALUES  ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'KIND_ABILITY'),
        ('ABILITY_MAYURI_CAPTURE_ELITE',        'KIND_ABILITY');

-- 4. Классы боевых юнитов, способных захватывать
INSERT INTO TypeTags
        (Type,                                  Tag)
VALUES  ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_MELEE'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_RANGED'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_ANTI_CAVALRY'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_LIGHT_CAVALRY'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_HEAVY_CAVALRY'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_SIEGE'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_RECON'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_NAVAL_MELEE'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_NAVAL_RANGED'),
        ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'CLASS_NAVAL_RAIDER'),
        ('ABILITY_MAYURI_CAPTURE_ELITE',        'CLASS_SDRI_ELITE');

INSERT INTO UnitAbilities
        (UnitAbilityType,                       Name,                                           Description,                                            Inactive)
VALUES  ('ABILITY_MAYURI_CAPTURE_EXPERIMENT',   'LOC_ABILITY_MAYURI_CAPTURE_EXPERIMENT_NAME',   'LOC_ABILITY_MAYURI_CAPTURE_EXPERIMENT_DESCRIPTION',    1),
        ('ABILITY_MAYURI_CAPTURE_ELITE',        'LOC_ABILITY_MAYURI_CAPTURE_ELITE_NAME',        'LOC_ABILITY_MAYURI_CAPTURE_ELITE_DESCRIPTION',         1);

-- 5. Захват подопытных реализован в Scripts/Mayuri_Subjects.lua через Events.Combat

-- 6. Трейт лидера раздаёт способности (обычным - Подопытный I, элитным - Подопытный II)
INSERT INTO Modifiers
        (ModifierId,                            ModifierType,                           SubjectRequirementSetId)
VALUES  ('TRAIT_MAYURI_GRANT_CAPTURE_ABILITY',  'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',  'MAYURI_NON_ELITE_UNIT_SET'),
        ('TRAIT_MAYURI_GRANT_CAPTURE_ELITE',    'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',  'MAYURI_ELITE_UNIT_SET');

INSERT INTO ModifierArguments
        (ModifierId,                            Name,           Value)
VALUES  ('TRAIT_MAYURI_GRANT_CAPTURE_ABILITY',  'AbilityType',  'ABILITY_MAYURI_CAPTURE_EXPERIMENT'),
        ('TRAIT_MAYURI_GRANT_CAPTURE_ELITE',    'AbilityType',  'ABILITY_MAYURI_CAPTURE_ELITE');

INSERT INTO TraitModifiers
        (TraitType,                             ModifierId)
VALUES  ('TRAIT_LEADER_RESEARCH_AND_SACRIFICE', 'TRAIT_MAYURI_GRANT_CAPTURE_ABILITY'),
        ('TRAIT_LEADER_RESEARCH_AND_SACRIFICE', 'TRAIT_MAYURI_GRANT_CAPTURE_ELITE');