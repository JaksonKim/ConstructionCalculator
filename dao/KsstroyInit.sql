USE ksstroy;

DROP TABLE IF EXISTS `projects`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `user_project_rel`;
DROP TABLE IF EXISTS `zones`;
DROP TABLE IF EXISTS `groups`;
DROP TABLE IF EXISTS `worktypes`;
DROP TABLE IF EXISTS `worktype_groups`;
DROP TABLE IF EXISTS `material_type_group`;
DROP TABLE IF EXISTS `material_type`;
DROP TABLE IF EXISTS `materials`;
DROP TABLE IF EXISTS `worktype_material_rel`;
DROP TABLE IF EXISTS `works`;
DROP TABLE IF EXISTS `work_zone_rel`;
DROP TABLE IF EXISTS `adjustments`;
DROP TABLE IF EXISTS `covers`;
DROP TABLE IF EXISTS `work_groups`;


CREATE TABLE `projects` (
  `ID`           INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `PROJECT_NAME` VARCHAR(64)      NOT NULL,
  `DESCRIPTION`  VARCHAR(512),
  `ID_GROUP`     INT(10) UNSIGNED,
  `ID_WORK`      INT(10) UNSIGNED
);


INSERT INTO `projects` (`ID`, `PROJECT_NAME`, `DESCRIPTION`, `ID_GROUP`, `ID_WORK`)
VALUES (33, 'Проект1', 'Very cool', '1', 1);
INSERT INTO `projects` (`ID`, `PROJECT_NAME`, `DESCRIPTION`, `ID_GROUP`, `ID_WORK`)
VALUES (34, 'Проект2', 'Super cool', '1', 1);
INSERT INTO `projects` (`ID`, `PROJECT_NAME`, `DESCRIPTION`, `ID_GROUP`, `ID_WORK`)
VALUES (35, 'Проект3', 'Not cool', '1', 1);


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID`       INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `NAME`     VARCHAR(64)      NOT NULL,
  `PASSWORD` VARCHAR(64)      NOT NULL,
  `ROLE`     VARCHAR(32)      NOT NULL
);
INSERT INTO `users` (`ID`, `NAME`, `PASSWORD`, `ROLE`) VALUES (1, 'админ', 'nimda', 'admin');
INSERT INTO `users` (`ID`, `NAME`, `PASSWORD`, `ROLE`) VALUES (2, 'клиент1', 'парольпароль', 'роль');


DROP TABLE IF EXISTS `user_project_rel`;
CREATE TABLE `user_project_rel` (
  `project` INT(10),
  `user`    INT(10)
);
INSERT INTO `user_project_rel` (`project`, `user`) VALUES (33, 1);
INSERT INTO `user_project_rel` (`project`, `user`) VALUES (34, 1);
INSERT INTO `user_project_rel` (`project`, `user`) VALUES (34, 2);


CREATE TABLE `zones` (
  `id`                   BIGINT(10)      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`                 VARCHAR(50)     NOT NULL,
  `width`                DOUBLE UNSIGNED NOT NULL,
  `height`               DOUBLE UNSIGNED NOT NULL,
  `parent_group_id`      INT(10) UNSIGNED,
  `surplus_for_zones_id` INT(10) UNSIGNED, #have value only if the zone is surplus
  `addit_for_zones_id`   INT(10) UNSIGNED #have value only if the zone is additional
);
INSERT INTO `zones` VALUES (1, 'пол1', 10.0, 10.0, 4, NULL, NULL);
INSERT INTO `zones` VALUES (2, 'станаА', 6.0, 3.0, 5, NULL, NULL);
INSERT INTO `zones` VALUES (3, 'потолок', 10.0, 10.0, 5, NULL, NULL);
INSERT INTO `zones` VALUES (4, 'стенаБ', 7.0, 3.5, 6, NULL, NULL);
INSERT INTO `zones` VALUES (5, 'откосы1', 5.0, 5.0, NULL, NULL, 1);
INSERT INTO `zones` VALUES (6, 'откосы2', 3.0, 2.0, NULL, NULL, 2);
INSERT INTO `zones` VALUES (7, 'памятник кому то', 2.0, 2.0, NULL, NULL, 3);
INSERT INTO `zones` VALUES (8, 'подоконник', 10.0, 4.0, NULL, NULL, 4);
INSERT INTO `zones` VALUES (9, 'дверь1', 2.0, 1.0, NULL, 1, NULL);
INSERT INTO `zones` VALUES (10, 'дверь2', 3.0, 2.0, NULL, 2, NULL);
INSERT INTO `zones` VALUES (11, 'окно1', 3.0, 1.25, NULL, 3, NULL);
INSERT INTO `zones` VALUES (12, 'окно2', 2.0, 1.35, NULL, 4, NULL);


CREATE TABLE `groups` (
  `group_id`  BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`      VARCHAR(50),
  `parent_id` BIGINT(20)
);
INSERT INTO `groups` VALUES (1, 'КВАРТИРА', NULL);
INSERT INTO `groups` VALUES (2, 'ПЕНТХАУС', NULL);
INSERT INTO `groups` VALUES (3, 'ДАЧА', NULL);
INSERT INTO `groups` VALUES (4, 'КУХНЯ', 1);
INSERT INTO `groups` VALUES (5, 'СПАЛЬНЯ', 1);
INSERT INTO `groups` VALUES (6, 'ТУАЛЕТ', 1);
INSERT INTO `groups` VALUES (7, 'ВАННАЯ', 2);
INSERT INTO `groups` VALUES (8, 'ПРИХОЖАЯ', 2);


DROP TABLE IF EXISTS `worktypes`;
CREATE TABLE `worktypes` (
  `worktype_id`     BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`            VARCHAR(50),
  `description`     VARCHAR(512),
  `unit_price`      DOUBLE,
  `parent_group_id` INT(10) UNSIGNED
);
INSERT INTO `worktypes` VALUES (1, 'пробивка отверстий между стен', 'worktype_1_descr.', 3.45, 4);
INSERT INTO `worktypes` VALUES (2, 'завод вводного провода', 'worktype_2_descr.', 3.45, 4);
INSERT INTO `worktypes` VALUES (3, 'пробивка отверстий в стене', 'worktype_3_descr.', 3.45, 4);

INSERT INTO `worktypes` VALUES (4, 'укладка отражателей и сетки', 'worktype_4_descr.', 3.45, 3);
INSERT INTO `worktypes` VALUES (5, 'прокладка труб', 'worktype_5_descr.', 3.45, 3);
INSERT INTO `worktypes` VALUES (6, 'заливка полов', 'worktype_6_descr.', 3.45, 3);

INSERT INTO `worktypes` VALUES (7, 'пробивка отверстий между стен', 'worktype_7_descr.', 3.45, 2);
INSERT INTO `worktypes` VALUES (8, 'завод гильзы в стену', 'worktype_8_descr.', 3.45, 2);
INSERT INTO `worktypes` VALUES (9, 'штробление стен', 'worktype_9_descr.', 3.45, 2);


CREATE TABLE `worktype_groups` (
  `group_id`  BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`      VARCHAR(50),
  `parent_id` BIGINT(20)
);

INSERT INTO `worktype_groups` VALUES (1, 'root_group', NULL);
INSERT INTO `worktype_groups` VALUES (2, 'ОТОПЛЕНИЕ', 1);
INSERT INTO `worktype_groups` VALUES (3, 'СИСТЕМА ТЕПЛЫЙ ПОЛ', 1);
INSERT INTO `worktype_groups` VALUES (4, 'ЭЛЕКТРИКА', 1);


CREATE TABLE `material_type_group` (
  `id`          INT(11)     NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(50) NOT NULL,
  `description` VARCHAR(512)         DEFAULT NULL,
  `parent_id`   BIGINT(20),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
);
INSERT INTO `material_type_group` VALUES (1, 'root_group', 'группа хранящая все материалы', NULL);
INSERT INTO `material_type_group` VALUES (2, 'ОБЩИЕ МАТЕРИАЛЫ', 'все материалы котороые не вошли в другие группы', 1);
INSERT INTO `material_type_group` VALUES (3, 'ОБОРУДОВАНИЕ', 'сантехника, двери, подоконники, фурнитура', 1);
INSERT INTO `material_type_group` VALUES (4, 'ФИНИШНЫЕ ПОКРЫТИЯ', 'облицовочные материалы', 1);


CREATE TABLE `material_type` (
  `id`             INT(11)     NOT NULL AUTO_INCREMENT,
  `name`           VARCHAR(50) NOT NULL,
  `description`    VARCHAR(512)         DEFAULT NULL,
  `price_per_unit` DOUBLE      NOT NULL,
  `unit_name`      VARCHAR(50) NOT NULL,
  `parent_id`      BIGINT(20),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
);
INSERT INTO `material_type` VALUES (1, 'шпаклевка финиш', 'material_type_1_descr.', '45', 'unit_name_1', '2');
INSERT INTO `material_type` VALUES (2, 'шпаклевка старт', 'material_type_2_descr.', '76', 'unit_name_2', '2');
INSERT INTO `material_type` VALUES (3, 'грунтовка', 'material_type_3_descr.', '30', 'unit_name_3', '2');
INSERT INTO `material_type` VALUES (4, 'ванна', 'material_type_4_descr.', '3200', 'unit_name_4', '3');
INSERT INTO `material_type` VALUES (5, 'унитаз', 'material_type_5_descr.', '1500', 'unit_name_5', '3');
INSERT INTO `material_type` VALUES (6, 'умывальник', 'material_type_6_descr.', '800', 'unit_name_6', '3');
INSERT INTO `material_type` VALUES (7, 'плитка на стену', 'material_type_7_descr.', '200', 'unit_name_7', '4');
INSERT INTO `material_type` VALUES (8, 'плитка на пол', 'material_type_8_descr.', '300', 'unit_name_8', '4');
INSERT INTO `material_type` VALUES (9, 'кварцевый грунт', 'material_type_9_descr.', '147', 'unit_name_9', '4');


DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
  `id`                     INT(8) NOT NULL AUTO_INCREMENT,
  `units_per_square_meter` DOUBLE,
  `material_type_id`       INT(8),
  PRIMARY KEY (`id`)
);
INSERT INTO `materials` VALUES (1, '2', '1');
INSERT INTO `materials` VALUES (2, '6', '2');
INSERT INTO `materials` VALUES (3, '7', '3');
INSERT INTO `materials` VALUES (4, '45', '4');
INSERT INTO `materials` VALUES (5, '15', '5');


CREATE TABLE `worktype_material_rel` (
  `worktype_id` INT(10),
  `material_id` INT(10)
);


INSERT INTO `worktype_material_rel` (`worktype_id`, `material_id`) VALUES (1, 1);
INSERT INTO `worktype_material_rel` (`worktype_id`, `material_id`) VALUES (1, 2);
INSERT INTO `worktype_material_rel` (`worktype_id`, `material_id`) VALUES (2, 1);
INSERT INTO `worktype_material_rel` (`worktype_id`, `material_id`) VALUES (2, 2);


CREATE TABLE `works` (
  `work_id`         BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  /*`name`            VARCHAR(50),*/
  `work_type_id`    BIGINT(11),
  `planed_cost`     DOUBLE,
  `parent_group_id` BIGINT(11),
  `zone_id`     	 BIGINT(11)
);

INSERT INTO `works` VALUES (1, 7, 1, 4, 1);
INSERT INTO `works` VALUES (2, 8, 1, 4, 2);
INSERT INTO `works` VALUES (3, 9, 1, 4, 2);

INSERT INTO `works` VALUES (4, 4, 1, 3, 4);
INSERT INTO `works` VALUES (5, 5, 1, 3, 4);
INSERT INTO `works` VALUES (6, 6, 1, 3, 5);

INSERT INTO `works` VALUES (7, 1, 1, 2, 5);
INSERT INTO `works` VALUES (8, 2, 1, 2, 6);
INSERT INTO `works` VALUES (9, 3, 1, 2,1);


DROP TABLE IF EXISTS `work_zone_rel`;
CREATE TABLE `work_zone_rel` (
  `id`      BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `work_id` BIGINT(11),
  `zone_id` BIGINT(11)
);

INSERT INTO `work_zone_rel` VALUES (1, 1, 1);
INSERT INTO `work_zone_rel` VALUES (2, 2, 1);
INSERT INTO `work_zone_rel` VALUES (3, 3, 2);
INSERT INTO `work_zone_rel` VALUES (4, 4, 4);
INSERT INTO `work_zone_rel` VALUES (5, 5, 5);
INSERT INTO `work_zone_rel` VALUES (6, 6, 3);
INSERT INTO `work_zone_rel` VALUES (7, 7, 2);
INSERT INTO `work_zone_rel` VALUES (8, 8, 2);
INSERT INTO `work_zone_rel` VALUES (9, 9, 1);


CREATE TABLE `adjustments` (
  `id`          BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `value`       DOUBLE,
  `is_absolute` TINYINT,
  `work_id`     BIGINT(11)
);

INSERT INTO `adjustments` VALUES (1, 23, 1, 1);
INSERT INTO `adjustments` VALUES (2, 23, 1, 2);
INSERT INTO `adjustments` VALUES (3, 23, 1, 3);
INSERT INTO `adjustments` VALUES (4, 23, 1, 4);
INSERT INTO `adjustments` VALUES (5, 23, 1, 5);
INSERT INTO `adjustments` VALUES (6, 23, 1, 6);


CREATE TABLE `covers` (
  `id`          BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `value`       DOUBLE,
  `date`        VARCHAR(20),
  `description` VARCHAR(20),
  `work_id`     BIGINT(11)
);

INSERT INTO `covers` VALUES (1, 12, '12', 'cover1', 1);
INSERT INTO `covers` VALUES (2, 12, '12', 'cover2', 2);
INSERT INTO `covers` VALUES (3, 12, '12', 'cover3', 3);
INSERT INTO `covers` VALUES (4, 12, '12', 'cover4', 4);
INSERT INTO `covers` VALUES (5, 12, '12', 'cover5', 5);
INSERT INTO `covers` VALUES (6, 12, '12', 'cover6', 6);


CREATE TABLE `work_groups` (
  `id`        BIGINT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`      VARCHAR(20),
  `parent_id` BIGINT(11)
);
INSERT INTO `work_groups` VALUES (1, 'root_group', NULL);
INSERT INTO `work_groups` VALUES (2, 'ОТОПЛЕНИЕ', 1);
INSERT INTO `work_groups` VALUES (3, 'СИСТЕМА ТЕПЛЫЙ ПОЛ', 1);
INSERT INTO `work_groups` VALUES (4, 'ЭЛЕКТРИКА', 1);