-- ===========================================================================
-- ПОДОПЫТНЫЕ (гражданские юниты по типу Великого учёного)
-- Подопытный I   - добыт обычными войсками (почти полудохлый)
-- Подопытный II  - добыт уникальными юнитами 12-го отряда (живой и целый)
-- Использование: зайти в район «НИИ Синигами» - юнит расходуется и даёт
-- разовый бонус Науки, зависящий от эпохи (см. Scripts/Mayuri_Subjects.lua).
-- ===========================================================================

INSERT INTO Types
        (Type,                  Kind)
VALUES  ('UNIT_SDRI_SUBJECT',   'KIND_UNIT'),
        ('UNIT_SDRI_SUBJECT_2', 'KIND_UNIT');

INSERT INTO Units
        (UnitType,              Name,                               Description,                                BaseSightRange, BaseMoves,  Domain,         FormationClass,                 Cost,   CanTrain,   CostProgressionModel,   CostProgressionParam1,  Combat, CanEarnExperience, Stackable)
VALUES  ('UNIT_SDRI_SUBJECT',   'LOC_UNIT_SDRI_SUBJECT_NAME',       'LOC_UNIT_SDRI_SUBJECT_DESCRIPTION',        2,              3,          'DOMAIN_LAND',  'FORMATION_CLASS_CIVILIAN',     1,      0,          'NO_COST_PROGRESSION',  0,                      0,      0,                0),
        ('UNIT_SDRI_SUBJECT_2', 'LOC_UNIT_SDRI_SUBJECT_2_NAME',     'LOC_UNIT_SDRI_SUBJECT_2_DESCRIPTION',      2,              3,          'DOMAIN_LAND',  'FORMATION_CLASS_CIVILIAN',     1,      0,          'NO_COST_PROGRESSION',  0,                      0,      0,                0);

INSERT INTO TypeTags
        (Type,                  Tag)
VALUES  ('UNIT_SDRI_SUBJECT',   'CLASS_LANDCIVILIAN'),
        ('UNIT_SDRI_SUBJECT_2', 'CLASS_LANDCIVILIAN');

INSERT INTO UnitAIInfos
        (UnitType,              AiType)
VALUES  ('UNIT_SDRI_SUBJECT',   'UNITTYPE_CIVILIAN'),
        ('UNIT_SDRI_SUBJECT_2', 'UNITTYPE_CIVILIAN');
