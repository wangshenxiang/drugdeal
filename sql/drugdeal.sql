
CREATE DATABASE IF NOT EXISTS `drugdealdb` DEFAULT CHARACTER SET utf8;
USE `drugdealdb`;

CREATE TABLE IF NOT EXISTS `drugdealdb`.`tab_drug` (
  `drug_id`      VARCHAR(30)    NOT NULL,
  `drug_name`    VARCHAR(30)    NOT NULL,
  `drug_suoxie`  VARCHAR(30)    NOT NULL,
  `drug_spec`    VARCHAR(30)    NOT NULL,
  `drug_price`   DECIMAL(12, 2) NOT NULL,
  `drug_product` VARCHAR(30)    NOT NULL,
  `drug_numbers` BIGINT(20)     NOT NULL,
  `memo`         TEXT           NOT NULL DEFAULT "",
  PRIMARY KEY (`drug_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'DRUG TABLE';
