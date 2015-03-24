SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `users_anag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_anag` ;

CREATE  TABLE IF NOT EXISTS `users_anag` (
  `idusers_anag` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `surname` VARCHAR(100) NOT NULL ,
  `birthdate` DATETIME NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idusers_anag`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_status_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_status_type` ;

CREATE  TABLE IF NOT EXISTS `users_status_type` (
  `idusers_status_type` INT NOT NULL ,
  `desc` VARCHAR(45) NOT NULL ,
  `longdesc` VARCHAR(1000) NULL ,
  `status_img_url` VARCHAR(1000) NULL ,
  `status_priority` INT NULL ,
  PRIMARY KEY (`idusers_status_type`) ,
  UNIQUE INDEX `desc_UNIQUE` (`desc` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_status` ;

CREATE  TABLE IF NOT EXISTS `users_status` (
  `users_status_id` INT NOT NULL ,
  `date_status_start` DATETIME NOT NULL ,
  `date_status_end` DATETIME NULL ,
  `users_status_type_id` INT NOT NULL ,
  PRIMARY KEY (`users_status_id`) ,
  INDEX `fk_users_status_ff` (`users_status_type_id` ASC) ,
  CONSTRAINT `fk_users_status_ff`
    FOREIGN KEY (`users_status_type_id` )
    REFERENCES `users_status_type` (`idusers_status_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_web`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users_web` ;

CREATE  TABLE IF NOT EXISTS `users_web` (
  `idusers_web` INT NOT NULL AUTO_INCREMENT ,
  `users_id` VARCHAR(45) NOT NULL ,
  `users_pwd` VARCHAR(45) NOT NULL ,
  `users_creation_date` DATETIME NOT NULL ,
  `users_id_date_pwd_change` DATETIME NULL ,
  `idusers_anag` INT NOT NULL ,
  `users_status_id` INT NOT NULL ,
  PRIMARY KEY (`idusers_web`) ,
  UNIQUE INDEX `idusers_web_UNIQUE` (`idusers_web` ASC) ,
  UNIQUE INDEX `users_id_UNIQUE` (`users_id` ASC) ,
  INDEX `fk_users_web_users_anag` (`idusers_anag` ASC) ,
  INDEX `fk_users_web_users_status1` (`users_status_id` ASC) ,
  CONSTRAINT `fk_users_web_users_anag`
    FOREIGN KEY (`idusers_anag` )
    REFERENCES `users_anag` (`idusers_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_web_users_status1`
    FOREIGN KEY (`users_status_id` )
    REFERENCES `users_status` (`users_status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_status_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_status_type` ;

CREATE  TABLE IF NOT EXISTS `characters_status_type` (
  `idcharacters_status_type` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NOT NULL ,
  `longdesc` VARCHAR(1000) NULL ,
  `characters_status_img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idcharacters_status_type`) ,
  UNIQUE INDEX `desc_UNIQUE` (`desc` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_status` ;

CREATE  TABLE IF NOT EXISTS `characters_status` (
  `idcharacters_status` INT NOT NULL AUTO_INCREMENT ,
  `date_status_start` DATETIME NOT NULL ,
  `date_status_end` DATETIME NULL ,
  `dcharacters_status_type` INT NOT NULL ,
  PRIMARY KEY (`idcharacters_status`) ,
  INDEX `fk_characters_status_characters_status_type1` (`dcharacters_status_type` ASC) ,
  CONSTRAINT `fk_characters_status_characters_status_type1`
    FOREIGN KEY (`dcharacters_status_type` )
    REFERENCES `characters_status_type` (`idcharacters_status_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_sex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_sex` ;

CREATE  TABLE IF NOT EXISTS `character_sex` (
  `idsex` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NOT NULL ,
  `longdesc` VARCHAR(45) NULL ,
  `sex_img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idsex`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nation` ;

CREATE  TABLE IF NOT EXISTS `nation` (
  `idnation` INT NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(45) NOT NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idnation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_race`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_race` ;

CREATE  TABLE IF NOT EXISTS `characters_race` (
  `idcharacters_race` INT NOT NULL AUTO_INCREMENT ,
  `race_description` VARCHAR(45) NULL ,
  `race_longdesc` VARCHAR(4500) NULL ,
  `race_img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idcharacters_race`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `allignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allignment` ;

CREATE  TABLE IF NOT EXISTS `allignment` (
  `idallignment` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `allignment_img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idallignment`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_anag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_anag` ;

CREATE  TABLE IF NOT EXISTS `characters_anag` (
  `idcharacters_anag` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `surname` VARCHAR(45) NOT NULL ,
  `nickname` VARCHAR(45) NULL ,
  `age` INT NOT NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `img_url` VARCHAR(1000) NULL ,
  `idsex` INT NOT NULL ,
  `idnation` INT NOT NULL ,
  `idrace` INT NOT NULL ,
  `idallignment` INT NOT NULL ,
  PRIMARY KEY (`idcharacters_anag`) ,
  INDEX `fk_characters_anag_character_sex1` (`idsex` ASC) ,
  INDEX `fk_characters_anag_state1` (`idnation` ASC) ,
  INDEX `fk_characters_anag_characters_race1` (`idrace` ASC) ,
  INDEX `fk_characters_anag_allignment1` (`idallignment` ASC) ,
  CONSTRAINT `fk_characters_anag_character_sex1`
    FOREIGN KEY (`idsex` )
    REFERENCES `character_sex` (`idsex` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_state1`
    FOREIGN KEY (`idnation` )
    REFERENCES `nation` (`idnation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_characters_race1`
    FOREIGN KEY (`idrace` )
    REFERENCES `characters_race` (`idcharacters_race` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_allignment1`
    FOREIGN KEY (`idallignment` )
    REFERENCES `allignment` (`idallignment` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character` ;

CREATE  TABLE IF NOT EXISTS `character` (
  `idcharacter` INT NOT NULL AUTO_INCREMENT ,
  `idcharacters_status` INT NOT NULL ,
  `idcharacters_anag` INT NOT NULL ,
  `idusers_web` INT NOT NULL ,
  `character_creation_time` DATETIME NOT NULL ,
  `character_deletion_time` DATETIME NULL ,
  PRIMARY KEY (`idcharacter`) ,
  INDEX `fk_character_characters_status1` (`idcharacters_status` ASC) ,
  INDEX `fk_character_characters_anag1` (`idcharacters_anag` ASC) ,
  INDEX `fk_character_users_web1` (`idusers_web` ASC) ,
  CONSTRAINT `fk_character_characters_status1`
    FOREIGN KEY (`idcharacters_status` )
    REFERENCES `characters_status` (`idcharacters_status` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_characters_anag1`
    FOREIGN KEY (`idcharacters_anag` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_users_web1`
    FOREIGN KEY (`idusers_web` )
    REFERENCES `users_web` (`idusers_web` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_stats_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_stats_type` ;

CREATE  TABLE IF NOT EXISTS `characters_stats_type` (
  `idcharacters_stats_type` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NOT NULL ,
  `longdesc` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idcharacters_stats_type`) ,
  UNIQUE INDEX `desc_UNIQUE` (`desc` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_has_stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_has_stats` ;

CREATE  TABLE IF NOT EXISTS `character_has_stats` (
  `stats_type_id` INT NOT NULL ,
  `stat_value` INT NULL ,
  `anag_id` INT NOT NULL ,
  PRIMARY KEY (`stats_type_id`, `anag_id`) ,
  INDEX `fk_characters_anag_has_characters_stats_type_characters_stats1` (`stats_type_id` ASC) ,
  INDEX `fk_character_has_stats_characters_anag1` (`anag_id` ASC) ,
  CONSTRAINT `fk_characters_anag_has_characters_stats_type_characters_stats1`
    FOREIGN KEY (`stats_type_id` )
    REFERENCES `characters_stats_type` (`idcharacters_stats_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_stats_characters_anag1`
    FOREIGN KEY (`anag_id` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `racial_stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `racial_stats` ;

CREATE  TABLE IF NOT EXISTS `racial_stats` (
  `idracial_stats` INT NOT NULL AUTO_INCREMENT ,
  `racial_stat_desc` VARCHAR(45) NULL ,
  `racial_stat_longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idracial_stats`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_race_has_stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_race_has_stats` ;

CREATE  TABLE IF NOT EXISTS `characters_race_has_stats` (
  `characters_race_id` INT NOT NULL ,
  `racial_stats_id` INT NOT NULL ,
  `stat_value` INT NULL ,
  PRIMARY KEY (`characters_race_id`, `racial_stats_id`) ,
  INDEX `fk_characters_race_has_racial_stats_racial_stats1` (`racial_stats_id` ASC) ,
  INDEX `fk_characters_race_has_racial_stats_characters_race1` (`characters_race_id` ASC) ,
  CONSTRAINT `fk_characters_race_has_racial_stats_characters_race1`
    FOREIGN KEY (`characters_race_id` )
    REFERENCES `characters_race` (`idcharacters_race` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_race_has_racial_stats_racial_stats1`
    FOREIGN KEY (`racial_stats_id` )
    REFERENCES `racial_stats` (`idracial_stats` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `language` ;

CREATE  TABLE IF NOT EXISTS `language` (
  `idlanguage` INT NOT NULL AUTO_INCREMENT ,
  `lang_desc` VARCHAR(45) NOT NULL ,
  `lang_longdesc` VARCHAR(45) NULL ,
  `lang_img_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idlanguage`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_speaks_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_speaks_language` ;

CREATE  TABLE IF NOT EXISTS `character_speaks_language` (
  `language_id` INT NOT NULL ,
  `date_learned` DATETIME NULL ,
  `characters_anag_id` INT NOT NULL ,
  PRIMARY KEY (`language_id`, `characters_anag_id`) ,
  INDEX `fk_character_has_language_language1` (`language_id` ASC) ,
  INDEX `fk_character_speaks_language_characters_anag1` (`characters_anag_id` ASC) ,
  CONSTRAINT `fk_character_has_language_language1`
    FOREIGN KEY (`language_id` )
    REFERENCES `language` (`idlanguage` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_speaks_language_characters_anag1`
    FOREIGN KEY (`characters_anag_id` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `race_has_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race_has_reputation` ;

CREATE  TABLE IF NOT EXISTS `race_has_reputation` (
  `idrace` INT NOT NULL ,
  `id_other_race` INT NOT NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `date_of_change_reputation` DATETIME NULL ,
  `reputation_value` VARCHAR(45) NULL ,
  PRIMARY KEY (`idrace`, `id_other_race`) ,
  INDEX `fk_characters_race_has_characters_race_characters_race4` (`id_other_race` ASC) ,
  INDEX `fk_characters_race_has_characters_race_characters_race3` (`idrace` ASC) ,
  CONSTRAINT `fk_characters_race_has_characters_race_characters_race3`
    FOREIGN KEY (`idrace` )
    REFERENCES `characters_race` (`idcharacters_race` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_race_has_characters_race_characters_race4`
    FOREIGN KEY (`id_other_race` )
    REFERENCES `characters_race` (`idcharacters_race` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nation_has_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nation_has_reputation` ;

CREATE  TABLE IF NOT EXISTS `nation_has_reputation` (
  `nation_id` INT NOT NULL ,
  `other_nation_id` INT NOT NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `date_of_change_reputation` DATETIME NULL ,
  `reputation_value` INT NULL ,
  PRIMARY KEY (`nation_id`, `other_nation_id`) ,
  INDEX `fk_state_has_state_state4` (`other_nation_id` ASC) ,
  INDEX `fk_state_has_state_state3` (`nation_id` ASC) ,
  CONSTRAINT `fk_state_has_state_state3`
    FOREIGN KEY (`nation_id` )
    REFERENCES `nation` (`idnation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_has_state_state4`
    FOREIGN KEY (`other_nation_id` )
    REFERENCES `nation` (`idnation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nation_has_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nation_has_language` ;

CREATE  TABLE IF NOT EXISTS `nation_has_language` (
  `nation_id` INT NOT NULL ,
  `language_id` INT NOT NULL ,
  PRIMARY KEY (`nation_id`, `language_id`) ,
  INDEX `fk_state_has_language_language1` (`language_id` ASC) ,
  INDEX `fk_state_has_language_state1` (`nation_id` ASC) ,
  CONSTRAINT `fk_state_has_language_state1`
    FOREIGN KEY (`nation_id` )
    REFERENCES `nation` (`idnation` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_has_language_language1`
    FOREIGN KEY (`language_id` )
    REFERENCES `language` (`idlanguage` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `guild`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guild` ;

CREATE  TABLE IF NOT EXISTS `guild` (
  `idguild` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `guild_img_url` VARCHAR(45) NULL ,
  `guild_icon_url` VARCHAR(45) NULL ,
  PRIMARY KEY (`idguild`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profession`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profession` ;

CREATE  TABLE IF NOT EXISTS `profession` (
  `idprofession` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `profession_img_url` VARCHAR(1000) NULL ,
  `profession_icon_url` VARCHAR(1000) NULL ,
  `idguild` INT NOT NULL ,
  PRIMARY KEY (`idprofession`) ,
  INDEX `fk_profession_guild1` (`idguild` ASC) ,
  CONSTRAINT `fk_profession_guild1`
    FOREIGN KEY (`idguild` )
    REFERENCES `guild` (`idguild` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profession_skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profession_skill` ;

CREATE  TABLE IF NOT EXISTS `profession_skill` (
  `idprofessionskill` INT NOT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `profession_skill_img_url` VARCHAR(1000) NULL ,
  `profession_skill_icon_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idprofessionskill`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profession_has_skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profession_has_skill` ;

CREATE  TABLE IF NOT EXISTS `profession_has_skill` (
  `profession_id` INT NOT NULL ,
  `profession_skill_id` INT NOT NULL ,
  PRIMARY KEY (`profession_id`, `profession_skill_id`) ,
  INDEX `fk_profession_has_profession_skill_profession_skill1` (`profession_skill_id` ASC) ,
  INDEX `fk_profession_has_profession_skill_profession1` (`profession_id` ASC) ,
  CONSTRAINT `fk_profession_has_profession_skill_profession1`
    FOREIGN KEY (`profession_id` )
    REFERENCES `profession` (`idprofession` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profession_has_profession_skill_profession_skill1`
    FOREIGN KEY (`profession_skill_id` )
    REFERENCES `profession_skill` (`idprofessionskill` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_has_profession`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_has_profession` ;

CREATE  TABLE IF NOT EXISTS `character_has_profession` (
  `characters_anag_id` INT NOT NULL ,
  `profession_id` INT NOT NULL ,
  `date_join` DATETIME NULL ,
  `profession_reputation_value` VARCHAR(45) NULL ,
  PRIMARY KEY (`characters_anag_id`, `profession_id`) ,
  INDEX `fk_characters_anag_has_profession_profession1` (`profession_id` ASC) ,
  INDEX `fk_characters_anag_has_profession_characters_anag1` (`characters_anag_id` ASC) ,
  CONSTRAINT `fk_characters_anag_has_profession_characters_anag1`
    FOREIGN KEY (`characters_anag_id` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_has_profession_profession1`
    FOREIGN KEY (`profession_id` )
    REFERENCES `profession` (`idprofession` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `guild_has_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guild_has_reputation` ;

CREATE  TABLE IF NOT EXISTS `guild_has_reputation` (
  `idguild` INT NOT NULL ,
  `id_other_guild` INT NOT NULL ,
  `guild_reputation_value` INT NULL ,
  `date_of_change_reputation` DATETIME NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idguild`, `id_other_guild`) ,
  INDEX `fk_guild_has_guild_guild2` (`id_other_guild` ASC) ,
  INDEX `fk_guild_has_guild_guild1` (`idguild` ASC) ,
  CONSTRAINT `fk_guild_has_guild_guild1`
    FOREIGN KEY (`idguild` )
    REFERENCES `guild` (`idguild` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_guild_has_guild_guild2`
    FOREIGN KEY (`id_other_guild` )
    REFERENCES `guild` (`idguild` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `race_clan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race_clan` ;

CREATE  TABLE IF NOT EXISTS `race_clan` (
  `idrace_clan` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `race_clan_img_url` VARCHAR(1000) NULL ,
  `race_clan_icon_url` VARCHAR(1000) NULL ,
  `idcharacters_race` INT NOT NULL ,
  PRIMARY KEY (`idrace_clan`) ,
  INDEX `fk_race_clan_characters_race1` (`idcharacters_race` ASC) ,
  CONSTRAINT `fk_race_clan_characters_race1`
    FOREIGN KEY (`idcharacters_race` )
    REFERENCES `characters_race` (`idcharacters_race` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `race_clan_has_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race_clan_has_reputation` ;

CREATE  TABLE IF NOT EXISTS `race_clan_has_reputation` (
  `idrace_clan` INT NOT NULL ,
  `other_idrace_clan` INT NOT NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `date_of_change_reputation` DATETIME NULL ,
  `reputation_value` INT NULL ,
  PRIMARY KEY (`idrace_clan`, `other_idrace_clan`) ,
  INDEX `fk_race_clan_has_reputation_race_clan2` (`other_idrace_clan` ASC) ,
  CONSTRAINT `fk_race_clan_has_reputation_race_clan1`
    FOREIGN KEY (`idrace_clan` )
    REFERENCES `race_clan` (`idrace_clan` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_race_clan_has_reputation_race_clan2`
    FOREIGN KEY (`other_idrace_clan` )
    REFERENCES `race_clan` (`idrace_clan` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_has_race_clan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_has_race_clan` ;

CREATE  TABLE IF NOT EXISTS `character_has_race_clan` (
  `idcharacters_anag` INT NOT NULL ,
  `idrace_clan` INT NOT NULL ,
  `date_join` DATETIME NULL ,
  `reputation_value` INT NULL ,
  `date_of_change_reputation` DATETIME NULL ,
  PRIMARY KEY (`idcharacters_anag`, `idrace_clan`) ,
  INDEX `fk_characters_anag_has_race_clan_race_clan1` (`idrace_clan` ASC) ,
  INDEX `fk_characters_anag_has_race_clan_characters_anag1` (`idcharacters_anag` ASC) ,
  CONSTRAINT `fk_characters_anag_has_race_clan_characters_anag1`
    FOREIGN KEY (`idcharacters_anag` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_has_race_clan_race_clan1`
    FOREIGN KEY (`idrace_clan` )
    REFERENCES `race_clan` (`idrace_clan` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_has_profession_skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_has_profession_skill` ;

CREATE  TABLE IF NOT EXISTS `characters_has_profession_skill` (
  `idcharacters_anag` INT NOT NULL ,
  `idprofessionskill` INT NOT NULL ,
  `date_learned` DATETIME NULL ,
  `profession_skill_value` INT NULL ,
  PRIMARY KEY (`idcharacters_anag`, `idprofessionskill`) ,
  INDEX `fk_characters_anag_has_profession_skill_profession_skill1` (`idprofessionskill` ASC) ,
  INDEX `fk_characters_anag_has_profession_skill_characters_anag1` (`idcharacters_anag` ASC) ,
  CONSTRAINT `fk_characters_anag_has_profession_skill_characters_anag1`
    FOREIGN KEY (`idcharacters_anag` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_has_profession_skill_profession_skill1`
    FOREIGN KEY (`idprofessionskill` )
    REFERENCES `profession_skill` (`idprofessionskill` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_xp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `character_xp` ;

CREATE  TABLE IF NOT EXISTS `character_xp` (
  `idcharacter` INT NOT NULL ,
  `value` INT NULL ,
  `date_last_change` DATETIME NULL ,
  PRIMARY KEY (`idcharacter`) ,
  INDEX `fk_character_xp_character1` (`idcharacter` ASC) ,
  CONSTRAINT `fk_character_xp_character1`
    FOREIGN KEY (`idcharacter` )
    REFERENCES `character` (`idcharacter` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `object_group_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `object_group_type` ;

CREATE  TABLE IF NOT EXISTS `object_group_type` (
  `idobject_group_type` INT NOT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `group_type_img_url` VARCHAR(1000) NULL ,
  `group_type_icon_url` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idobject_group_type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `object_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `object_type` ;

CREATE  TABLE IF NOT EXISTS `object_type` (
  `idobject_type` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  `object_type_img_url` VARCHAR(1000) NULL ,
  `object_type_icon_url` VARCHAR(1000) NULL ,
  `object_type_damage_points` INT NULL ,
  `idobject_group_type` INT NOT NULL ,
  PRIMARY KEY (`idobject_type`, `idobject_group_type`) ,
  INDEX `fk_object_type_object_group_type1` (`idobject_group_type` ASC) ,
  CONSTRAINT `fk_object_type_object_group_type1`
    FOREIGN KEY (`idobject_group_type` )
    REFERENCES `object_group_type` (`idobject_group_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `characters_has_object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `characters_has_object` ;

CREATE  TABLE IF NOT EXISTS `characters_has_object` (
  `idcharacters_anag` INT NOT NULL ,
  `idobject_type` INT NOT NULL ,
  `quantity` INT NULL ,
  `damage_points` INT NULL ,
  PRIMARY KEY (`idcharacters_anag`, `idobject_type`) ,
  INDEX `fk_characters_anag_has_object_type_object_type1` (`idobject_type` ASC) ,
  INDEX `fk_characters_anag_has_object_type_characters_anag1` (`idcharacters_anag` ASC) ,
  CONSTRAINT `fk_characters_anag_has_object_type_characters_anag1`
    FOREIGN KEY (`idcharacters_anag` )
    REFERENCES `characters_anag` (`idcharacters_anag` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_anag_has_object_type_object_type1`
    FOREIGN KEY (`idobject_type` )
    REFERENCES `object_type` (`idobject_type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk_race_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lk_race_reputation` ;

CREATE  TABLE IF NOT EXISTS `lk_race_reputation` (
  `idrace_reputation_lookup` INT NOT NULL AUTO_INCREMENT ,
  `threshold_score` INT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(1000) NULL ,
  PRIMARY KEY (`idrace_reputation_lookup`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk_race_clan_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lk_race_clan_reputation` ;

CREATE  TABLE IF NOT EXISTS `lk_race_clan_reputation` (
  `idlk_race_clan_reputation` INT NOT NULL AUTO_INCREMENT ,
  `threshold_score` INT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idlk_race_clan_reputation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk_guild_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lk_guild_reputation` ;

CREATE  TABLE IF NOT EXISTS `lk_guild_reputation` (
  `idlk_guild_reputation` INT NOT NULL AUTO_INCREMENT ,
  `threshold_score` INT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idlk_guild_reputation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk_profession_reputation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lk_profession_reputation` ;

CREATE  TABLE IF NOT EXISTS `lk_profession_reputation` (
  `idlk_profession_reputation` INT NOT NULL AUTO_INCREMENT ,
  `threshold_score` INT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idlk_profession_reputation`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk_object_damage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lk_object_damage` ;

CREATE  TABLE IF NOT EXISTS `lk_object_damage` (
  `idlk_object_damage` INT NOT NULL AUTO_INCREMENT ,
  `threshold_score` INT NULL ,
  `desc` VARCHAR(45) NULL ,
  `longdesc` VARCHAR(4500) NULL ,
  PRIMARY KEY (`idlk_object_damage`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
