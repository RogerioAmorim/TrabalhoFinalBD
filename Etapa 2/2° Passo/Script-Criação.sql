CREATE SCHEMA IF NOT EXISTS `museu` DEFAULT CHARACTER SET utf8 ;
USE `museu` ;

-- -----------------------------------------------------
-- Table `museu`.`Artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Artista` (
  `id_Artista` INT NOT NULL AUTO_INCREMENT,
  `data_nasc` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `data_falecimento` VARCHAR(10) NOT NULL,
  `pais` VARCHAR(20) NOT NULL,
  `estilo_principal` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_Artista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Acervo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Acervo` (
  `id_Acervo` INT NOT NULL AUTO_INCREMENT,
  `data_aquisicao` VARCHAR(10) NOT NULL,
  `custo` DOUBLE NOT NULL,
  `fonte_vendedora` VARCHAR(50) NOT NULL,
  `estado_exposto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Acervo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Exposicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Exposicao` (
  `id_Exposicao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_inicial` VARCHAR(10) NOT NULL,
  `data_final` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_Exposicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Objeto` (
  `id_Objeto` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(30) NOT NULL,
  `estilo` VARCHAR(20) NOT NULL,
  `ano_criacao` INT(4) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `id_Artista` INT NOT NULL,
  `id_Acervo` INT NOT NULL,
  `id_Exposicao` INT NOT NULL,
  PRIMARY KEY (`id_Objeto`),
  INDEX `fk_Objeto_Artista_idx` (`id_Artista` ASC),
  INDEX `fk_Objeto_Acervo1_idx` (`id_Acervo` ASC),
  INDEX `fk_Objeto_Exposicao1_idx` (`id_Exposicao` ASC),
  CONSTRAINT `fk_Objeto_Artista`
    FOREIGN KEY (`id_Artista`)
    REFERENCES `museu`.`Artista` (`id_Artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Objeto_Acervo1`
    FOREIGN KEY (`id_Acervo`)
    REFERENCES `museu`.`Acervo` (`id_Acervo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Objeto_Exposicao1`
    FOREIGN KEY (`id_Exposicao`)
    REFERENCES `museu`.`Exposicao` (`id_Exposicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Escultura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Escultura` (
  `id_Escultura` INT NOT NULL AUTO_INCREMENT,
  `altura` FLOAT NOT NULL,
  `largura` FLOAT NOT NULL,
  `peso` FLOAT NOT NULL,
  `material_principal` VARCHAR(50) NOT NULL,
  `id_Objeto` INT NOT NULL,
  PRIMARY KEY (`id_Escultura`),
  INDEX `fk_Escultura_Objeto1_idx` (`id_Objeto` ASC),
  CONSTRAINT `fk_Escultura_Objeto1`
    FOREIGN KEY (`id_Objeto`)
    REFERENCES `museu`.`Objeto` (`id_Objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Estatua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Estatua` (
  `id_Estatua` INT NOT NULL AUTO_INCREMENT,
  `nome_homenageado` VARCHAR(50) NOT NULL,
  `id_Escultura` INT NOT NULL,
  PRIMARY KEY (`id_Estatua`),
  INDEX `fk_Estatua_Escultura1_idx` (`id_Escultura` ASC),
  CONSTRAINT `fk_Estatua_Escultura1`
    FOREIGN KEY (`id_Escultura`)
    REFERENCES `museu`.`Escultura` (`id_Escultura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Pintura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Pintura` (
  `id_Pintura` INT NOT NULL AUTO_INCREMENT,
  `dimensoes` VARCHAR(30) NOT NULL,
  `tipo_moldura` VARCHAR(30) NOT NULL,
  `id_Objeto` INT NOT NULL,
  PRIMARY KEY (`id_Pintura`),
  INDEX `fk_Pintura_Objeto1_idx` (`id_Objeto` ASC),
  CONSTRAINT `fk_Pintura_Objeto1`
    FOREIGN KEY (`id_Objeto`)
    REFERENCES `museu`.`Objeto` (`id_Objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Outros_Tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Outros_Tipos` (
  `id_Outros_Tipos` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo` VARCHAR(100) NOT NULL,
  `id_Objeto` INT NOT NULL,
  PRIMARY KEY (`id_Outros_Tipos`),
  INDEX `fk_Outros_Tipos_Objeto1_idx` (`id_Objeto` ASC),
  CONSTRAINT `fk_Outros_Tipos_Objeto1`
    FOREIGN KEY (`id_Objeto`)
    REFERENCES `museu`.`Objeto` (`id_Objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Telefone` (
  `id_Telefone` INT NOT NULL AUTO_INCREMENT,
  `numero` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id_Telefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Colecao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Colecao` (
  `id_Colecao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `responsavel` VARCHAR(30) NOT NULL,
  `id_Telefone` INT NOT NULL,
  PRIMARY KEY (`id_Colecao`),
  INDEX `fk_Colecao_Telefone1_idx` (`id_Telefone` ASC),
  CONSTRAINT `fk_Colecao_Telefone1`
    FOREIGN KEY (`id_Telefone`)
    REFERENCES `museu`.`Telefone` (`id_Telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `museu`.`Emprestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museu`.`Emprestado` (
  `id_Emprestado` INT NOT NULL AUTO_INCREMENT,
  `data_emprestimo` VARCHAR(10) NOT NULL,
  `retorno_emprestimo` VARCHAR(45) NOT NULL,
  `id_Colecao` INT NOT NULL,
  `id_Objeto` INT NOT NULL,
  PRIMARY KEY (`id_Emprestado`),
  INDEX `fk_Emprestado_Colecao1_idx` (`id_Colecao` ASC),
  INDEX `fk_Emprestado_Objeto1_idx` (`id_Objeto` ASC),
  CONSTRAINT `fk_Emprestado_Colecao1`
    FOREIGN KEY (`id_Colecao`)
    REFERENCES `museu`.`Colecao` (`id_Colecao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Emprestado_Objeto1`
    FOREIGN KEY (`id_Objeto`)
    REFERENCES `museu`.`Objeto` (`id_Objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

