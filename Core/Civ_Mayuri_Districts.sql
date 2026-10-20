-- ===========================================================================
-- UNIQUE DISTRICT: SHINIGAMI RESEARCH INSTITUTE (НИИ Синигами)
-- Заменяет Кампус (DISTRICT_CAMPUS)
-- ===========================================================================

-- 1. Регистрируем тип района и его Trait (привязку к цивилизации)
INSERT INTO Types
        (Type,                                                  Kind)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',               'KIND_DISTRICT'),
        ('TRAIT_CIVILIZATION_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE', 'KIND_TRAIT');

-- 2. Создаем сам Trait и привязываем его к Gotei 13
INSERT INTO Traits
        (TraitType,                                             Name,                                                   Description)
VALUES  ('TRAIT_CIVILIZATION_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE', 'LOC_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE_NAME',       'LOC_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE_DESCRIPTION');

INSERT INTO CivilizationTraits
        (CivilizationType,          TraitType)
VALUES  ('CIVILIZATION_GOTEI13',     'TRAIT_CIVILIZATION_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE');

-- 3. Указываем, что НИИ заменяет стандартный Кампус
INSERT INTO DistrictReplaces
        (CivUniqueDistrictType,                     ReplacesDistrictType)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'DISTRICT_CAMPUS');

-- 4. Основные параметры района (строим в 2 раза быстрее обычного Кампуса: Cost = 27 вместо 54)
INSERT INTO Districts
        (DistrictType,                              Name,                                                   Description,                                                    PrereqTech,         PlunderType,        PlunderAmount,  AdvisorType,        Cost,   CostProgressionModel,               CostProgressionParam1,  Maintenance,    RequiresPlacement,  RequiresPopulation, Aqueduct,   NoAdjacentCity, InternalOnly,   ZOC,    CaptureRemovesBuildings,    CaptureRemovesCityDefenses, MilitaryDomain, CitizenSlots,   TraitType)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'LOC_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE_NAME',       'LOC_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE_DESCRIPTION',        'TECH_WRITING',     'PLUNDER_SCIENCE',  25,             'ADVISOR_TECHNOLOGY', 27,   'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', 40,             1,              1,                  1,                  0,          0,              0,              0,      0,                          0,                          'NO_DOMAIN',    1,              'TRAIT_CIVILIZATION_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE');

-- 5. Копируем стандартные бонусы соседства от Кампуса (горы, рифы, геотермальные источники и т.д.)
INSERT INTO District_Adjacencies
        (DistrictType,                              YieldChangeId)
SELECT  'DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',    YieldChangeId
FROM    District_Adjacencies
WHERE   DistrictType = 'DISTRICT_CAMPUS';

-- 6. Очки Великих Ученых (+1 за сам район)
INSERT INTO District_GreatPersonPoints
        (DistrictType,                              GreatPersonClassType,           PointsPerTurn)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'GREAT_PERSON_CLASS_SCIENTIST', 1);

-- 7. Выход от работающих специалистов в районе (+2 Науки за каждого жителя)
INSERT INTO District_CitizenYieldChanges
        (DistrictType,                              YieldType,          YieldChange)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'YIELD_SCIENCE',    2);

-- 8. Выход для торговых путей, идущих в этот город
INSERT INTO District_TradeRouteYields
        (DistrictType,                              YieldType,          YieldChangeAsOrigin,    YieldChangeAsDomesticDestination,   YieldChangeAsInternationalDestination)
VALUES  ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'YIELD_FOOD',       0,                      1,                                  0),
        ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',   'YIELD_SCIENCE',    0,                      0,                                  1);