# Mayuri Kurotsuchi Mod

## Project scope

- This is a Civilization VI mod for Mayuri Kurotsuchi and Gotei 13, organized as SQL database content and XML localization.
- `Mayuri_Kurotsuchi_Mod.modinfo` is the load manifest. Keep its action lists and `<Files>` list in sync when adding, removing, or moving content files.
- The manifest currently requires `Expansion2`. The player configuration SQL provides entries for Standard, Rise & Fall, and Gathering Storm rulesets; do not change either compatibility behavior without an explicit gameplay requirement.

## File ownership

- `Core/Civ_Mayuri_Config.sql`: FrontEnd player-selection rows and available unique items.
- `Core/Civ_Mayuri_Civilization.sql`: Gotei 13 civilization, trait, city names, and citizen culture.
- `Core/Civ_Mayuri_Leader.sql`: Mayuri leader, leader trait, and civilization assignment.
- `Core/Civ_Mayuri_Districts.sql`: Shinigami Research Institute district and its database relationships.
- `Text/Civ_Mayuri_Text.xml`: localization rows; the current entries use `ru_RU`.

## Change conventions

- Follow the existing SQL style and use Civilization VI database table/column names and enum IDs exactly.
- Keep each `LOC_*` reference used by SQL or the modinfo matched to a localization `Tag` in the XML. Use unique tags and database `Type` identifiers.
- When a new file is introduced, add it to the appropriate FrontEnd or InGame action and to `<Files>` in the modinfo. Keep localization loaded in the actions where its referenced content is needed.
- Keep changes focused on the owning file above; do not claim gameplay mechanics are implemented merely because they are described in localization text.

## Validation

- No automated test or build setup is present in this mod directory.
- After file or manifest changes, verify that every path in the modinfo exists and that the XML files are well-formed.
- For database changes, enable the mod in Civilization VI and inspect `Database.log` and `Modding.log` for load errors, then verify the affected content in game.