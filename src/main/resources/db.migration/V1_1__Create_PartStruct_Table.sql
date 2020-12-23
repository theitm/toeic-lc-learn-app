SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for part_struct
-- ----------------------------
DROP TABLE IF EXISTS `part_struct`;
CREATE TABLE `part_struct`  (
  `id` char(36) NOT NULL,
  `part` int(1) NOT NULL,
  `numOfQuestOldType` int(2) NOT NULL DEFAULT 0,
  `numOfQuestNewType` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `part_UNIQUE`(`part`) USING BTREE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
SET FOREIGN_KEY_CHECKS = 1;
