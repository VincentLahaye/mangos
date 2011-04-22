ALTER TABLE db_version CHANGE COLUMN required_10551_01_mangos_spell_proc_event required_10582_01_mangos_spell_proc_event bit;

DELETE FROM spell_proc_event WHERE entry IN (67356, 67363, 67365, 67379, 67381, 67384, 67386, 67389, 67392);
INSERT INTO spell_proc_event(entry, SchoolMask, SpellFamilyName,
    SpellFamilyMaskA0, SpellFamilyMaskA1, SpellFamilyMaskA2,
    SpellFamilyMaskB0, SpellFamilyMaskB1, SpellFamilyMaskB2,
    SpellFamilyMaskC0, SpellFamilyMaskC1, SpellFamilyMaskC2,
    procFlags, procEx, ppmRate, CustomChance, Cooldown) VALUES
(67356, 0x00,  7, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0.000000, 0.000000,  5),
(67363, 0x00, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(67365, 0x00, 10, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(67379, 0x00, 10, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(67381, 0x00, 15, 0x00000000, 0x00000000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(67384, 0x00, 15, 0x00000010, 0x00000000, 0x00000000, 0x08020000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(67386, 0x00, 11, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(67389, 0x00, 11, 0x00000100, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  8),
(67392, 0x00, 11, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0);

