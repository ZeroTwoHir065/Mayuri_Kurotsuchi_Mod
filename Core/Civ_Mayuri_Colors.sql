-- ===========================================================================
-- COLOR DEFINITIONS: GOTEI 13 & MAYURI KUROTSUCHI (SHINIGAMI THEME)
-- Черно-белый стиль проводников душ (черное сихакусё и белое хаори капитана)
-- ===========================================================================

INSERT OR REPLACE INTO Colors
        (Type,                      Red,    Green,  Blue,   Alpha)
VALUES  ('COLOR_GOTEI13_BLACK',     0.07,   0.07,   0.09,   1.0),
        ('COLOR_GOTEI13_WHITE',     0.96,   0.96,   0.98,   1.0);

INSERT OR REPLACE INTO PlayerColors
        (Type,                          Usage,      PrimaryColor,           SecondaryColor,         TextColor)
VALUES  ('LEADER_MAYURI_KUROTSUCHI',    'Unique',   'COLOR_GOTEI13_BLACK',  'COLOR_GOTEI13_WHITE',  'COLOR_GOTEI13_WHITE');
