DROP DATABASE IF EXISTS chat;
create database chat;
USE chat;

-- tables
-- Table: user
CREATE TABLE IF NOT EXISTS `users`(
    `id` int(10)  NOT NULL,
    `login` varchar(100)  NOT NULL,
    `password` varchar(100) NOT NULL,
    `is_active` char(1)  NOT NULL,
    `created_at` timestamp  NOT NULL,
    `updated_at` timestamp  NOT NULL,
    PRIMARY KEY (`id`)
);

-- Table: message
CREATE TABLE IF NOT EXISTS `messages` (
    `id` int(10)  NOT NULL,
    `content` varchar(5000)  NOT NULL,
    `receiver_id` int  NOT NULL,
    `expeditor_id` int  NOT NULL,
    `created_at` timestamp  NOT NULL,
    
    PRIMARY KEY (`id`),
    FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`expeditor_id`) REFERENCES `users` (`id`)
);


-- Table: group
CREATE TABLE IF NOT EXISTS `groups` (
    `id` int(10)  NOT NULL,
    `name` varchar(50)  NOT NULL,
    `is_active` char(1)  NOT NULL,
    `created_at` timestamp  NOT NULL,
    PRIMARY KEY (`id`)
);


-- Table: user_group
CREATE TABLE IF NOT EXISTS `user_group` (
    `id` int(10)  NOT NULL,
    `user_id` int(10)  NOT NULL,
    `group_id` int(10)  NOT NULL,
    `is_active` char(1)  NOT NULL,
    `created_at` timestamp  NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
);

-- Table: user_message
CREATE TABLE IF NOT EXISTS `user_messages` (
    `id` int(10)  NOT NULL,
    `user_id` int (10) NOT NULL,
    `message_id` int (10) NOT NULL,
    `create_at` timestamp  NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`)
);


INSERT INTO `users` (login, password) VALUES ("bob", "bob")
-- End of file.

