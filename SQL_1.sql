ALTER TABLE `geodata`.`_countries` 
DROP COLUMN `title_cz`;
ALTER TABLE `geodata`.`_countries` 
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`;
ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `country_id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;
ALTER TABLE `geodata`.`_countries` 
CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL ;
ALTER TABLE `geodata`.`_regions` 
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`,
CHANGE COLUMN `region_id` `region_id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`region_id`);
;
ALTER TABLE `geodata`.`_regions` 
CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL ;
ALTER TABLE `geodata`.`_cities` 
DROP COLUMN `region_cz`,
DROP COLUMN `area_cz`,
DROP COLUMN `title_cz`,
DROP COLUMN `region_lv`,
DROP COLUMN `area_lv`,
DROP COLUMN `title_lv`,
DROP COLUMN `region_lt`,
DROP COLUMN `area_lt`,
DROP COLUMN `title_lt`,
DROP COLUMN `region_ja`,
DROP COLUMN `area_ja`,
DROP COLUMN `title_ja`,
DROP COLUMN `region_pl`,
DROP COLUMN `area_pl`,
DROP COLUMN `title_pl`,
DROP COLUMN `region_it`,
DROP COLUMN `area_it`,
DROP COLUMN `title_it`,
DROP COLUMN `region_fr`,
DROP COLUMN `area_fr`,
DROP COLUMN `title_fr`,
DROP COLUMN `region_de`,
DROP COLUMN `area_de`,
DROP COLUMN `title_de`,
DROP COLUMN `region_pt`,
DROP COLUMN `area_pt`,
DROP COLUMN `title_pt`,
DROP COLUMN `region_es`,
DROP COLUMN `area_es`,
DROP COLUMN `title_es`,
DROP COLUMN `region_en`,
DROP COLUMN `area_en`,
DROP COLUMN `region_be`,
DROP COLUMN `area_be`,
DROP COLUMN `title_be`,
DROP COLUMN `region_ua`,
DROP COLUMN `area_ua`,
DROP COLUMN `title_ua`,
DROP COLUMN `region_ru`,
DROP COLUMN `area_ru`,
CHANGE COLUMN `city_id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;
ALTER TABLE `geodata`.`_countries` 
ADD INDEX `title_ind` (`title_ru` ASC, `title_en` ASC) VISIBLE;
;
ALTER TABLE `geodata`.`_regions` 
ADD INDEX `fk_regions_countries_idx` (`country_id` ASC) VISIBLE;
;
ALTER TABLE `geodata`.`_regions` 
ADD CONSTRAINT `fk_regions_countries`
  FOREIGN KEY (`country_id`)
  REFERENCES `geodata`.`_countries` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ALTER TABLE `geodata`.`_regions` 
ADD INDEX `fk_regions_countries_idx` (`country_id` ASC) VISIBLE,
ADD INDEX `regions_ind` () VISIBLE;
ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `region_id` `region_id` INT NULL ,
CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NULL ,
CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NULL ;
ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `region_id` `region_id` INT NULL ,
CHANGE COLUMN `title_ru` `title_ru` VARCHAR(150) NOT NULL ;
ALTER TABLE `geodata`.`_cities` 
CHANGE COLUMN `title_en` `title_en` VARCHAR(150) NOT NULL ;
ALTER TABLE `geodata`.`_cities` 
ADD INDEX `title_ind` (`title_ru` ASC, `title_en` ASC) INVISIBLE;
;
ALTER TABLE `geodata`.`_countries` 
DROP COLUMN `title_ru`,
DROP INDEX `title_ind` ;
;
ALTER TABLE `geodata`.`_countries` 
ADD INDEX `title_countries_ind` (`title_en` ASC) VISIBLE;
;
ALTER TABLE `geodata`.`_countries` 
;
ALTER TABLE `geodata`.`_countries` ALTER INDEX `title_countries_ind` VISIBLE;
ALTER TABLE `geodata`.`_regions` 
DROP COLUMN `title_ru`,
DROP INDEX `regions_ind` ;
;
ALTER TABLE `geodata`.`_regions` 
ADD INDEX `title_regions_ind` USING BTREE (`title_en`) VISIBLE;
;



