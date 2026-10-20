-- ===========================================================================
-- LEADER: MAYURI KUROTSUCHI (BASE GAME)
-- ===========================================================================

-- 1. Регистрация типов лидера и трейта
INSERT INTO Types
        (Type,                                  Kind)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',            'KIND_LEADER'),
        ('TRAIT_LEADER_RESEARCH_AND_SACRIFICE', 'KIND_TRAIT');

-- 2. Определение лидера
INSERT INTO Leaders
        (LeaderType,                    Name,                                   InheritFrom,        SceneLayers)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'LOC_LEADER_MAYURI_KUROTSUCHI_NAME',    'LEADER_DEFAULT',   4);

-- 3. Цитата лидера на экране загрузки
INSERT INTO LeaderQuotes
        (LeaderType,                    Quote)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'LOC_LEADER_MAYURI_KUROTSUCHI_QUOTE');

-- 4. Привязка цивилизации к лидеру
INSERT INTO CivilizationLeaders
        (CivilizationType,      LeaderType,                 CapitalName)
VALUES  ('CIVILIZATION_GOTEI13', 'LEADER_MAYURI_KUROTSUCHI', 'LOC_CITY_NAME_SEIREITEI');

-- 5. Определение черты лидера
INSERT INTO Traits
        (TraitType,                             Name,                                           Description)
VALUES  ('TRAIT_LEADER_RESEARCH_AND_SACRIFICE', 'LOC_TRAIT_LEADER_RESEARCH_AND_SACRIFICE_NAME', 'LOC_TRAIT_LEADER_RESEARCH_AND_SACRIFICE_DESCRIPTION');

-- 6. Привязка черты к лидеру
INSERT INTO LeaderTraits
        (LeaderType,                    TraitType)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'TRAIT_LEADER_RESEARCH_AND_SACRIFICE');

-- 7. Экран загрузки (Dawn of Man) - отображение портрета лидера
INSERT INTO LoadingInfo
        (LeaderType,                    ForegroundImage,        BackgroundImage,            EraText,                                            LeaderText,                                         PlayDawnOfManAudio)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'mayuri_portrait.dds',  'LEADER_GORGO_BACKGROUND',  'LOC_TRAIT_LEADER_RESEARCH_AND_SACRIFICE_NAME',    'LOC_TRAIT_LEADER_RESEARCH_AND_SACRIFICE_DESCRIPTION', 0);

-- 8. Дипломатический экран
INSERT INTO DiplomacyInfo
        (Type,                          BackgroundImage)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'mayuri_portrait.dds');