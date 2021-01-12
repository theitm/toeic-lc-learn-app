ALTER TABLE `test_session`
#     ADD COLUMN `fullName` VARCHAR(45) NULL AFTER `result`,
    ADD COLUMN `index` INT NOT NULL AFTER `fullName`;
ALTER TABLE `questions`
    ADD COLUMN `explain` VARCHAR(1024) NULL;
