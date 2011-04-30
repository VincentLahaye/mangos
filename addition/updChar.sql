CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `id` int(11) NOT NULL auto_increment,
  `text` longtext NOT NULL,
  `next` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random` (
  `guid` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE `saved_variables` ADD COLUMN `NextRandomBGResetTime` bigint(40) unsigned NOT NULL default '0' AFTER `NextWeeklyQuestResetTime`;

DROP TABLE IF EXISTS `auctionhousebot`;
CREATE TABLE `auctionhousebot` (
  `auctionhouse` int(11) NOT NULL default '0' COMMENT 'mapID of the auctionhouse.',
  `name` char(25) default NULL COMMENT 'Text name of the auctionhouse.',
  `minitems` int(11) default '0' COMMENT 'This is the minimum number of items you want to keep in the auction house. a 0 here will make it the same as the maximum.',
  `maxitems` int(11) default '0' COMMENT 'This is the number of items you want to keep in the auction house.',
  `mintime` int(11) default '8' COMMENT 'Sets the minimum number of hours for an auction.',
  `maxtime` int(11) default '24' COMMENT 'Sets the maximum number of hours for an auction.',
  `percentgreytradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Grey Trade Goods auction items',
  `percentwhitetradegoods` int(11) default '27' COMMENT 'Sets the percentage of the White Trade Goods auction items',
  `percentgreentradegoods` int(11) default '12' COMMENT 'Sets the percentage of the Green Trade Goods auction items',
  `percentbluetradegoods` int(11) default '10' COMMENT 'Sets the percentage of the Blue Trade Goods auction items',
  `percentpurpletradegoods` int(11) default '1' COMMENT 'Sets the percentage of the Purple Trade Goods auction items',
  `percentorangetradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Orange Trade Goods auction items',
  `percentyellowtradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Yellow Trade Goods auction items',
  `percentgreyitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Grey auction items',
  `percentwhiteitems` int(11) default '10' COMMENT 'Sets the percentage of the non trade White auction items',
  `percentgreenitems` int(11) default '30' COMMENT 'Sets the percentage of the non trade Green auction items',
  `percentblueitems` int(11) default '8' COMMENT 'Sets the percentage of the non trade Blue auction items',
  `percentpurpleitems` int(11) default '2' COMMENT 'Sets the percentage of the non trade Purple auction items',
  `percentorangeitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Orange auction items',
  `percentyellowitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Yellow auction items',
  `minpricegrey` int(11) default '100' COMMENT 'Minimum price of Grey items (percentage).',
  `maxpricegrey` int(11) default '150' COMMENT 'Maximum price of Grey items (percentage).',
  `minpricewhite` int(11) default '150' COMMENT 'Minimum price of White items (percentage).',
  `maxpricewhite` int(11) default '250' COMMENT 'Maximum price of White items (percentage).',
  `minpricegreen` int(11) default '800' COMMENT 'Minimum price of Green items (percentage).',
  `maxpricegreen` int(11) default '1400' COMMENT 'Maximum price of Green items (percentage).',
  `minpriceblue` int(11) default '1250' COMMENT 'Minimum price of Blue items (percentage).',
  `maxpriceblue` int(11) default '1750' COMMENT 'Maximum price of Blue items (percentage).',
  `minpricepurple` int(11) default '2250' COMMENT 'Minimum price of Purple items (percentage).',
  `maxpricepurple` int(11) default '4550' COMMENT 'Maximum price of Purple items (percentage).',
  `minpriceorange` int(11) default '3250' COMMENT 'Minimum price of Orange items (percentage).',
  `maxpriceorange` int(11) default '5550' COMMENT 'Maximum price of Orange items (percentage).',
  `minpriceyellow` int(11) default '5250' COMMENT 'Minimum price of Yellow items (percentage).',
  `maxpriceyellow` int(11) default '6550' COMMENT 'Maximum price of Yellow items (percentage).',
  `minbidpricegrey` int(11) default '70' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricegrey` int(11) default '100' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricewhite` int(11) default '70' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricewhite` int(11) default '100' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricegreen` int(11) default '80' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricegreen` int(11) default '100' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceblue` int(11) default '75' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 75',
  `maxbidpriceblue` int(11) default '100' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricepurple` int(11) default '80' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricepurple` int(11) default '100' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceorange` int(11) default '80' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceorange` int(11) default '100' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceyellow` int(11) default '80' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceyellow` int(11) default '100' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 100',
  `maxstackgrey` int(11) default '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackwhite` int(11) default '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackgreen` int(11) default '3' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackblue` int(11) default '2' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackpurple` int(11) default '1' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackorange` int(11) default '1' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackyellow` int(11) default '1' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `buyerpricegrey` int(11) default '1' COMMENT 'Multiplier to vendorprice when buying grey items from auctionhouse',
  `buyerpricewhite` int(11) default '1' COMMENT 'Multiplier to vendorprice when buying white items from auctionhouse',
  `buyerpricegreen` int(11) default '5' COMMENT 'Multiplier to vendorprice when buying green items from auctionhouse',
  `buyerpriceblue` int(11) default '12' COMMENT 'Multiplier to vendorprice when buying blue items from auctionhouse',
  `buyerpricepurple` int(11) default '15' COMMENT 'Multiplier to vendorprice when buying purple items from auctionhouse',
  `buyerpriceorange` int(11) default '20' COMMENT 'Multiplier to vendorprice when buying orange items from auctionhouse',
  `buyerpriceyellow` int(11) default '22' COMMENT 'Multiplier to vendorprice when buying yellow items from auctionhouse',
  `buyerbiddinginterval` int(11) default '1' COMMENT 'Interval how frequently AHB bids on each AH. Time in minutes',
  `buyerbidsperinterval` int(11) default '1' COMMENT 'number of bids to put in per bidding interval',
  PRIMARY KEY  (`auctionhouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `auctionhousebot`(`auctionhouse`,`name`,`minitems`,`maxitems`,`mintime`,`maxtime`,`percentgreytradegoods`,`percentwhitetradegoods`,`percentgreentradegoods`,`percentbluetradegoods`,`percentpurpletradegoods`,`percentorangetradegoods`,`percentyellowtradegoods`,`percentgreyitems`,`percentwhiteitems`,`percentgreenitems`,`percentblueitems`,`percentpurpleitems`,`percentorangeitems`,`percentyellowitems`,`minpricegrey`,`maxpricegrey`,`minpricewhite`,`maxpricewhite`,`minpricegreen`,`maxpricegreen`,`minpriceblue`,`maxpriceblue`,`minpricepurple`,`maxpricepurple`,`minpriceorange`,`maxpriceorange`,`minpriceyellow`,`maxpriceyellow`,`minbidpricegrey`,`maxbidpricegrey`,`minbidpricewhite`,`maxbidpricewhite`,`minbidpricegreen`,`maxbidpricegreen`,`minbidpriceblue`,`maxbidpriceblue`,`minbidpricepurple`,`maxbidpricepurple`,`minbidpriceorange`,`maxbidpriceorange`,`minbidpriceyellow`,`maxbidpriceyellow`,`maxstackgrey`,`maxstackwhite`,`maxstackgreen`,`maxstackblue`,`maxstackpurple`,`maxstackorange`,`maxstackyellow`,`buyerpricegrey`,`buyerpricewhite`,`buyerpricegreen`,`buyerpriceblue`,`buyerpricepurple`,`buyerpriceorange`,`buyerpriceyellow`,`buyerbiddinginterval`,`buyerbidsperinterval`) values
(2,'Alliance',0,0,8,24,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,1,5,12,15,20,22,1,1),
(6,'Horde',0,0,8,24,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,1,5,12,15,20,22,1,1),
(7,'Neutral',0,0,8,24,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,1,5,12,15,20,22,1,1);

ALTER TABLE `auctionhousebot`
  ADD COLUMN `percentgreytradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Grey Trade Goods auction items' AFTER `maxtime`,
  ADD COLUMN `percentorangetradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Orange Trade Goods auction items' AFTER `percentpurpletradegoods`,
  ADD COLUMN `percentyellowtradegoods` int(11) default '0' COMMENT 'Sets the percentage of the Yellow Trade Goods auction items' AFTER `percentorangetradegoods`,
  ADD COLUMN `percentgreyitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Grey auction items' AFTER `percentyellowtradegoods`,
  ADD COLUMN `percentorangeitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Orange auction items' AFTER `percentpurpleitems`,
  ADD COLUMN `percentyellowitems` int(11) default '0' COMMENT 'Sets the percentage of the non trade Yellow auction items' AFTER `percentorangeitems`,
  ADD COLUMN `minpricegrey` int(11) default '100' COMMENT 'Minimum price of Grey items (percentage).' AFTER `percentyellowitems`,
  ADD COLUMN `maxpricegrey` int(11) default '150' COMMENT 'Maximum price of Grey items (percentage).' AFTER `minpricegrey`,
  ADD COLUMN `minpriceorange` int(11) default '3250' COMMENT 'Minimum price of Orange items (percentage).' AFTER `maxpricepurple`,
  ADD COLUMN `maxpriceorange` int(11) default '5550' COMMENT 'Maximum price of Orange items (percentage).' AFTER `minpriceorange`,
  ADD COLUMN `minpriceyellow` int(11) default '5250' COMMENT 'Minimum price of Yellow items (percentage).' AFTER `maxpriceorange`,
  ADD COLUMN `maxpriceyellow` int(11) default '6550' COMMENT 'Maximum price of Yellow items (percentage).' AFTER `minpriceyellow`,
  ADD COLUMN `minbidpricegrey` int(11) default '70' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 70' AFTER `maxpriceyellow`,
  ADD COLUMN `maxbidpricegrey` int(11) default '100' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 100' AFTER `minbidpricegrey`,
  ADD COLUMN `minbidpriceorange` int(11) default '80' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 80' AFTER `maxbidpricepurple`,
  ADD COLUMN `maxbidpriceorange` int(11) default '100' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 100' AFTER `minbidpriceorange`,
  ADD COLUMN `minbidpriceyellow` int(11) default '80' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 80' AFTER `maxbidpriceorange`,
  ADD COLUMN `maxbidpriceyellow` int(11) default '100' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 100' AFTER `minbidpriceyellow`,
  ADD COLUMN `maxstackgrey` int(11) default '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.' AFTER `maxbidpriceyellow`,
  ADD COLUMN `maxstackorange` int(11) default '1' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.' AFTER `maxstackpurple`,
  ADD COLUMN `maxstackyellow` int(11) default '1' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.' AFTER `maxstackorange`,
  ADD COLUMN `buyerpriceorange` int(11) default '20' COMMENT 'Multiplier to vendorprice when buying orange items from auctionhouse' AFTER `buyerpricepurple`,
  ADD COLUMN `buyerpriceyellow` int(11) default '22' COMMENT 'Multiplier to vendorprice when buying yellow items from auctionhouse' AFTER `buyerpriceorange`;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

DELETE FROM `characters`.`item_instance` WHERE 
SUBSTRING_INDEX(SUBSTRING_INDEX(`characters`.`item_instance`.`data`,' ',4),' ',-1) IN 
(SELECT `mangos`.`item_template`.`entry`
FROM `mangos`.`item_template` 
WHERE `mangos`.`item_template`.`name` LIKE "% test%");

DELETE FROM `characters`.`auction` USING `characters`.`auction` LEFT JOIN `characters`.`item_instance` ON `characters`.`auction`.`itemguid` = `characters`.`item_instance`.`guid` WHERE `characters`.`item_instance`.`guid` IS NULL;
DELETE FROM `characters`.`auction` USING `characters`.`auction` LEFT JOIN `mangos`.`item_template` ON `auction`.`item_template` = `mangos`.`item_template`.`entry` WHERE `mangos`.`item_template`.`entry` IS NULL;

LOCK TABLES `item_instance` WRITE ;
START TRANSACTION;
DELETE
FROM `item_instance` 
WHERE `guid` NOT IN (SELECT `item` FROM `character_inventory`) 
AND `guid` NOT IN (SELECT `itemguid` FROM `auction`) 
AND `guid` NOT IN (SELECT `item_guid` FROM `guild_bank_item`) 
AND `guid` NOT IN (SELECT `item_guid` FROM `mail_items`) 
AND `guid` NOT IN (SELECT `item_guid` FROM `character_gifts`)
;
COMMIT;

UNLOCK TABLES;

DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int(16) unsigned NOT NULL DEFAULT '0',
  `allowedPlayers` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='BOP item trade cache';
-- Refer-a-friend system by MasOn
ALTER TABLE `characters` ADD COLUMN `grantableLevels`  tinyint(3) unsigned NOT NULL default '0' AFTER `actionBars`;/* wowarmory from Shadez support */

DROP TABLE IF EXISTS `armory_character_stats`;
CREATE TABLE `armory_character_stats` (
  `guid` int(11) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory table';

DROP TABLE IF EXISTS `armory_character_feed_log`;
CREATE TABLE `armory_character_feed_log` (
  `guid` int(11) NOT NULL,
  `type` smallint(1) NOT NULL,
  `data` int(11) NOT NULL,
  `date` int(11) default NULL,
  `counter` int(11) NOT NULL,
  `difficulty` smallint(6) default '-1',
  `item_guid` int(11) default '-1',
  PRIMARY KEY  (`guid`,`type`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='World of Warcraft Armory feed log';

DROP TABLE IF EXISTS `armory_game_chart`;
CREATE TABLE `armory_game_chart` (
  `gameid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `changeType` int(11) NOT NULL,
  `ratingChange` int(11) NOT NULL,
  `teamRating` int(11) NOT NULL,
  `damageDone` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `healingDone` int(11) NOT NULL,
  `damageTaken` int(11) NOT NULL,
  `healingTaken` int(11) NOT NULL,
  `killingBlows` int(11) NOT NULL,
  `mapId` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  PRIMARY KEY  (`gameid`,`teamid`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='WoWArmory Game Chart';
-- instance extend support
ALTER TABLE `character_instance` ADD COLUMN `extend` 
TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance extend (bool)'
AFTER `permanent`;-- Group flags and roles support
ALTER TABLE `group_member` ADD COLUMN `roles` 
TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Member roles bit mask'
AFTER `subgroup`;
ALTER TABLE `group_member` CHANGE `assistant` `memberFlags` 
TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Member flags bit mask';

ALTER TABLE `groups` DROP `mainTank`, DROP `mainAssistant`;
-- dungeon DBC encounters support
ALTER TABLE `instance` ADD COLUMN `encountersMask` 
INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Dungeon encounter bit mask'
AFTER `difficulty`;-- Anticheat tables from /dev/rsa
-- Config
DROP TABLE IF EXISTS `anticheat_config`;
CREATE TABLE IF NOT EXISTS `anticheat_config` (
  `checktype`          mediumint(8) unsigned NOT NULL COMMENT 'Type of check',
  `description`        varchar(255),
  `check_period`       int(11) unsigned NOT NULL default '0' COMMENT 'Time period of check, in ms, 0 - always',
  `alarmscount`        int(11) unsigned NOT NULL default '1'COMMENT 'Count of alarms before action',
  `disableoperation`   tinyint(3) unsigned NOT NULL default '0'COMMENT 'Anticheat disable operations in main core code after check fail',
  `messagenum`         int(11) NOT NULL default '0' COMMENT 'Number of system message',
  `intparam1`          mediumint(8) NOT NULL default '0' COMMENT 'Int parameter 1',
  `intparam2`          mediumint(8) NOT NULL default '0' COMMENT 'Int parameter 2',
  `floatparam1`        float NOT NULL default '0' COMMENT 'Float parameter 1',
  `floatparam2`        float NOT NULL default '0' COMMENT 'Float parameter 2',
  `action1`            mediumint(8) NOT NULL default '0' COMMENT 'Action 1',
  `actionparam1`       mediumint(8) NOT NULL default '0' COMMENT 'Action parameter 1',
  `action2`            mediumint(8) NOT NULL default '0' COMMENT 'Action 1',
  `actionparam2`       mediumint(8) NOT NULL default '0' COMMENT 'Action parameter 1',
  PRIMARY KEY  (`checktype`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Anticheat configuration';

-- DROP TABLE IF EXISTS `anticheat_log`;
CREATE TABLE IF NOT EXISTS `anticheat_log` (
  `playername`     varchar(32) NOT NULL,
  `checktype`      mediumint(8) unsigned NOT NULL,
  `alarm_time`     datetime NOT NULL,
  `reason`         varchar(255) NOT NULL DEFAULT 'Unknown',
  `guid`           int(11) unsigned NOT NULL,
  `action1`        mediumint(8) NOT NULL default '0',
  `action2`        mediumint(8) NOT NULL default '0',
   PRIMARY KEY (`checktype`, `alarm_time`, `guid`),
   KEY `idx_Player` (`guid`)
)  DEFAULT CHARSET=utf8 COMMENT='Anticheat log table';

-- Configuration for anticheat
-- Main checks
REPLACE INTO `anticheat_config` 
(`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`,`messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`) VALUES
(0, "Null check",         0, 1, 0, 11000, 0, 0,    0, 0, 1, 0, 0, 0),
(1, "Movement cheat",     0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
(2, "Spell cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
(3, "Quest cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
(4, "Transport cheat",    0, 3, 0, 11000, 0, 0, 60.0, 0, 2, 1, 0, 0),
(5, "Damage cheat",       0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
(6, "Item cheat",         0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0);

-- Subchecks
REPLACE INTO `anticheat_config` 
(`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`, `messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`) VALUES
(101, "Speed hack",              500, 5, 0, 11000,    10000, 0, 0.0012,    0, 2, 1, 6, 20000),
(102, "Fly hack",                500, 5, 0, 11000,    20000, 0,   10.0,    0, 2, 1, 0, 0),
(103, "Wall climb hack",         500, 2, 0, 11000,    10000, 0, 0.0015, 2.37, 2, 1, 0, 0),
(104, "Waterwalking hack",      1000, 3, 0, 11000,    20000, 0,      0,    0, 2, 1, 0, 0),
(105, "Teleport to plane hack",  500, 1, 0, 11000,        0, 0, 0.0001,  0.1, 2, 1, 0, 0),
(106, "AirJump hack" ,           500, 3, 0, 11000,    30000, 0,   10.0, 25.0, 2, 1, 0, 0),
(107, "Teleport hack" ,            0, 1, 0, 11000,        0, 0,   50.0,    0, 2, 1, 0, 0),
(108, "Fall hack" ,                0, 3, 0, 11000,    10000, 0,      0,    0, 2, 1, 0, 0),
(109, "Z Axis hack" ,              0, 1, 0, 11000,        0, 0,0.00001, 10.0, 2, 1, 0, 0),
--
(201, "Spell invalid",             0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
(202, "Spellcast in dead state",   0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
(203, "Spell not valid for player",0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
(204, "Spell not in player book",  0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
--
(501, "Spell damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
(502, "Melee damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
--
(601, "Item dupe hack",            0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0);
