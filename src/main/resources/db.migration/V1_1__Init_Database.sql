SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for part_struct
-- ----------------------------
CREATE TABLE `questions`  (
                              `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `groupQuestionsId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `title` varchar(1024) NOT NULL DEFAULT 0,
                              `titleTranslate` varchar(1024) NOT NULL DEFAULT 0,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `FK__group_questions_questions` (`groupQuestionsId`) USING BTREE,
                              CONSTRAINT `FK__group_questions_questions` FOREIGN KEY (`groupQuestionsId`)
                                  REFERENCES `group_questions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- ----------------------------
-- Table structure for group_questions
-- ----------------------------
CREATE TABLE `group_questions`  (
                                    `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                                    `partStructId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                                    `numOfQuestions` int(2) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`id`) USING BTREE,
                                    INDEX `FK__part_struct_group_questions` (`partStructId`) USING BTREE,
                                    CONSTRAINT `FK__part_struct_group_questions` FOREIGN KEY (`partStructId`)
                                        REFERENCES `part_struct` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- ----------------------------
-- Table structure for media
-- ----------------------------
CREATE TABLE `media`  (
                              `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `groupQuestionsId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `url` varchar(1024) NOT NULL,
                              `type` enum('Image','Audio','Video','Document') NOT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `FK__group_questions_media` (`groupQuestionsId`) USING BTREE,
                              CONSTRAINT `FK__group_questions_media` FOREIGN KEY (`groupQuestionsId`)
                                  REFERENCES `group_questions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- ----------------------------
-- Table structure for questions
-- ----------------------------
CREATE TABLE `questions`  (
                              `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `groupQuestionsId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `title` varchar(1024) NOT NULL,
                              `titleTranslate` varchar(1024) NOT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `FK__group_questions_questions` (`groupQuestionsId`) USING BTREE,
                              CONSTRAINT `FK__group_questions_questions` FOREIGN KEY (`groupQuestionsId`)
                                  REFERENCES `group_questions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- ----------------------------
-- Table structure for answers
-- ----------------------------
CREATE TABLE `answers`  (
                              `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `questionId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                              `label` char(1) NOT NULL,
                              `answer` varchar(1024) NOT NULL,
                              `answerTranslate` varchar(1024) NOT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              INDEX `FK__questions_answers` (`questionId`) USING BTREE,
                              CONSTRAINT `FK__questions_answers` FOREIGN KEY (`questionId`)
                                  REFERENCES `questions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
-- ----------------------------
-- Table structure for answers
-- ----------------------------
CREATE TABLE `test_session`  (
                            `id` char(36) NOT NULL COLLATE 'utf8_general_ci',
                            `session` varchar(60) NOT NULL COLLATE 'utf8_general_ci',
                            `questionId` char(36) NOT NULL COLLATE 'utf8_general_ci',
                            `labelChosen` char(1) NOT NULL,
                            `result` TINYINT(1) NOT NULL DEFAULT '0',
                            PRIMARY KEY (`id`) USING BTREE,
                            INDEX `FK__questions_test_session` (`questionId`) USING BTREE,
                            CONSTRAINT `FK__questions_test_session` FOREIGN KEY (`questionId`)
                                REFERENCES `questions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- ----------------------------
SET FOREIGN_KEY_CHECKS = 1;
