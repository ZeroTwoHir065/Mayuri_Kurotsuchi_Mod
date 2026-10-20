-- ===========================================================================
-- ICON DEFINITIONS: MAYURI KUROTSUCHI & GOTEI 13
-- ===========================================================================

-- 1. Атласы иконок

-- Лидер (Маюри)
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                   IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_MAYURI_LEADER',     256,        'mayuri_256.dds',           1,              1),
        ('ICON_ATLAS_MAYURI_LEADER',     80,         'mayuri_80.dds',            1,              1),
        ('ICON_ATLAS_MAYURI_LEADER',     50,         'mayuri_50.dds',            1,              1),
        ('ICON_ATLAS_MAYURI_LEADER',     38,         'mayuri_38.dds',            1,              1),
        ('ICON_ATLAS_MAYURI_LEADER',     32,         'mayuri_32.dds',            1,              1);

-- Цивилизация (Gotei 13)
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                   IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_GOTEI13',           256,        'gotei13_256.dds',          1,              1),
        ('ICON_ATLAS_GOTEI13',           80,         'gotei13_80.dds',           1,              1),
        ('ICON_ATLAS_GOTEI13',           50,         'gotei13_50.dds',           1,              1),
        ('ICON_ATLAS_GOTEI13',           38,         'gotei13_38.dds',           1,              1),
        ('ICON_ATLAS_GOTEI13',           32,         'gotei13_32.dds',           1,              1);

-- Район НИИ Синигами
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                   IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_DISTRICT_SRI',      256,        'district_sri_256.dds',     1,              1),
        ('ICON_ATLAS_DISTRICT_SRI',      80,         'district_sri_80.dds',      1,              1),
        ('ICON_ATLAS_DISTRICT_SRI',      50,         'district_sri_50.dds',      1,              1),
        ('ICON_ATLAS_DISTRICT_SRI',      38,         'district_sri_38.dds',      1,              1),
        ('ICON_ATLAS_DISTRICT_SRI',      32,         'district_sri_32.dds',      1,              1);

-- Оперативник 12-го отряда
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                       IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_UNIT_OPERATIVE',    256,        'unit_operative_256.dds',       1,              1),
        ('ICON_ATLAS_UNIT_OPERATIVE',    80,         'unit_operative_80.dds',        1,              1),
        ('ICON_ATLAS_UNIT_OPERATIVE',    50,         'unit_operative_50.dds',        1,              1),
        ('ICON_ATLAS_UNIT_OPERATIVE',    38,         'unit_operative_38.dds',        1,              1),
        ('ICON_ATLAS_UNIT_OPERATIVE',    32,         'unit_operative_32.dds',        1,              1);

-- Лейтенант 12-го отряда
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                       IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_UNIT_LIEUTENANT',   256,        'unit_lieutenant_256.dds',      1,              1),
        ('ICON_ATLAS_UNIT_LIEUTENANT',   80,         'unit_lieutenant_80.dds',       1,              1),
        ('ICON_ATLAS_UNIT_LIEUTENANT',   50,         'unit_lieutenant_50.dds',       1,              1),
        ('ICON_ATLAS_UNIT_LIEUTENANT',   38,         'unit_lieutenant_38.dds',       1,              1),
        ('ICON_ATLAS_UNIT_LIEUTENANT',   32,         'unit_lieutenant_32.dds',       1,              1);

-- Линейный пехотинец 12-го отряда
INSERT INTO IconTextureAtlases
        (Name,                              IconSize,   Filename,                           IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_UNIT_LINE_INFANTRY',    256,        'unit_line_infantry_256.dds',        1,              1),
        ('ICON_ATLAS_UNIT_LINE_INFANTRY',    80,         'unit_line_infantry_80.dds',         1,              1),
        ('ICON_ATLAS_UNIT_LINE_INFANTRY',    50,         'unit_line_infantry_50.dds',         1,              1),
        ('ICON_ATLAS_UNIT_LINE_INFANTRY',    38,         'unit_line_infantry_38.dds',         1,              1),
        ('ICON_ATLAS_UNIT_LINE_INFANTRY',    32,         'unit_line_infantry_32.dds',         1,              1);

-- Подопытный (общий для I и II)
INSERT INTO IconTextureAtlases
        (Name,                          IconSize,   Filename,                   IconsPerRow,    IconsPerColumn)
VALUES  ('ICON_ATLAS_UNIT_SUBJECT',      256,        'unit_subject_256.dds',     1,              1),
        ('ICON_ATLAS_UNIT_SUBJECT',      80,         'unit_subject_80.dds',      1,              1),
        ('ICON_ATLAS_UNIT_SUBJECT',      50,         'unit_subject_50.dds',      1,              1),
        ('ICON_ATLAS_UNIT_SUBJECT',      38,         'unit_subject_38.dds',      1,              1),
        ('ICON_ATLAS_UNIT_SUBJECT',      32,         'unit_subject_32.dds',      1,              1);

-- 2. Привязка элементов к атласам

INSERT INTO IconDefinitions
        (Name,                                              Atlas,                              [Index])
VALUES
        -- Лидер
        ('ICON_LEADER_MAYURI_KUROTSUCHI',                   'ICON_ATLAS_MAYURI_LEADER',         0),
        ('LEADER_MAYURI_KUROTSUCHI',                        'ICON_ATLAS_MAYURI_LEADER',         0),
        -- Цивилизация
        ('ICON_CIVILIZATION_GOTEI13',                       'ICON_ATLAS_GOTEI13',               0),
        ('CIVILIZATION_GOTEI13',                            'ICON_ATLAS_GOTEI13',               0),
        -- Трейты (эмблема цивилизации)
        ('TRAIT_LEADER_RESEARCH_AND_SACRIFICE',             'ICON_ATLAS_MAYURI_LEADER',         0),
        ('TRAIT_CIVILIZATION_GOTEI13',                      'ICON_ATLAS_GOTEI13',               0),
        -- Район
        ('ICON_DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',      'ICON_ATLAS_DISTRICT_SRI',          0),
        ('DISTRICT_SHINIGAMI_RESEARCH_INSTITUTE',           'ICON_ATLAS_DISTRICT_SRI',          0),
        -- Оперативник
        ('ICON_UNIT_SDRI_OPERATIVE',                        'ICON_ATLAS_UNIT_OPERATIVE',        0),
        ('UNIT_SDRI_OPERATIVE',                             'ICON_ATLAS_UNIT_OPERATIVE',        0),
        -- Лейтенант
        ('ICON_UNIT_SDRI_LIEUTENANT',                       'ICON_ATLAS_UNIT_LIEUTENANT',       0),
        ('UNIT_SDRI_LIEUTENANT',                            'ICON_ATLAS_UNIT_LIEUTENANT',       0),
        -- Линейный пехотинец
        ('ICON_UNIT_SDRI_LINE_INFANTRY',                    'ICON_ATLAS_UNIT_LINE_INFANTRY',    0),
        ('UNIT_SDRI_LINE_INFANTRY',                         'ICON_ATLAS_UNIT_LINE_INFANTRY',    0),
        -- Подопытные
        ('ICON_UNIT_SDRI_SUBJECT',                          'ICON_ATLAS_UNIT_SUBJECT',          0),
        ('ICON_UNIT_SDRI_SUBJECT_2',                        'ICON_ATLAS_UNIT_SUBJECT',          0),
        -- Способность
        ('ICON_ABILITY_MAYURI_CAPTURE_EXPERIMENT',          'ICON_ATLAS_MAYURI_LEADER',         0);
