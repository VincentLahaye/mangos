ALTER TABLE db_version CHANGE COLUMN required_8992_02_mangos_spell_chain required_8993_01_mangos_spell_proc_event bit;

DELETE FROM `spell_proc_event` WHERE `entry` IN (53817);
INSERT INTO `spell_proc_event` VALUES
(53817, 0x00000000, 11, 0x000001C3, 0x00008000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,0);
