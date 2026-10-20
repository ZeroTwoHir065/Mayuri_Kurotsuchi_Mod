-- ===========================================================================
-- CIVILIZATION: GOTEI 13 (BASE GAME)
-- ===========================================================================

-- 1. Регистрация типов
INSERT INTO Types
        (Type,                              Kind)
VALUES  ('CIVILIZATION_GOTEI13',             'KIND_CIVILIZATION'),
        ('TRAIT_CIVILIZATION_GOTEI13',      'KIND_TRAIT');

-- 2. Определение цивилизации
INSERT INTO Civilizations
        (CivilizationType,      Name,                               Description,                            Adjective,                              StartingCivilizationLevelType,  RandomCityNameDepth,    Ethnicity)
VALUES  ('CIVILIZATION_GOTEI13', 'LOC_CIVILIZATION_GOTEI13_NAME',    'LOC_CIVILIZATION_GOTEI13_DESCRIPTION', 'LOC_CIVILIZATION_GOTEI13_ADJECTIVE',  'CIVILIZATION_LEVEL_FULL_CIV',  10,                     'ETHNICITY_ASIAN');

-- 3. Способность цивилизации
INSERT INTO Traits
        (TraitType,                     Name,                                   Description)
VALUES  ('TRAIT_CIVILIZATION_GOTEI13',   'LOC_TRAIT_CIVILIZATION_GOTEI13_NAME',  'LOC_TRAIT_CIVILIZATION_GOTEI13_DESCRIPTION');

INSERT INTO CivilizationTraits
        (CivilizationType,      TraitType)
VALUES  ('CIVILIZATION_GOTEI13', 'TRAIT_CIVILIZATION_GOTEI13');

-- 4. Стартовые имена городов
INSERT INTO CityNames
        (CivilizationType,      CityName)
VALUES  ('CIVILIZATION_GOTEI13', 'LOC_CITY_NAME_SEIREITEI'),
        ('CIVILIZATION_GOTEI13', 'LOC_CITY_NAME_SDR_LAB'),
        ('CIVILIZATION_GOTEI13', 'LOC_CITY_NAME_RUKON_1'),
        ('CIVILIZATION_GOTEI13', 'LOC_CITY_NAME_RUKON_2'),
        ('CIVILIZATION_GOTEI13', 'LOC_CITY_NAME_RUKON_3');