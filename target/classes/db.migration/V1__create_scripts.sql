CREATE TABLE `library`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `fullname` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));

CREATE TABLE `library`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `genre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`book_id`));

CREATE TABLE `library`.`users_book` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`, `book_id`),
  INDEX `books_fk_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `user_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `library`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `books_fk`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
