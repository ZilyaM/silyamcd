-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 08 2022 г., 21:57
-- Версия сервера: 8.0.31-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `social_network`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `body` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`) VALUES
(1, 1, 3, 'Очень интересно!', '2022-11-11 15:29:42'),
(2, 4, 1, 'Продам гараж', '2022-11-11 15:29:42'),
(3, 7, 1, 'Ерунда', '2022-11-11 15:30:11'),
(4, 7, 2, 'И?', '2022-11-11 15:30:11');

-- --------------------------------------------------------

--
-- Структура таблицы `journal`
--

CREATE TABLE `journal` (
  `id` int NOT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `journal`
--

INSERT INTO `journal` (`id`, `user_from`, `user_to`, `amount`) VALUES
(1, 1, 2, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `photo_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `photo_id`, `created_at`) VALUES
(1, 1, 2, NULL, '2022-11-11 15:30:51'),
(2, 2, 3, NULL, '2022-11-11 15:30:51'),
(3, 7, 1, NULL, '2022-11-11 15:31:06'),
(4, 9, 1, NULL, '2022-11-11 15:31:06');

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `author_id`, `created_at`) VALUES
(1, 'Hello', 'Привет, это мой первый пост в социальной сети', 1, '2022-11-11 12:59:42'),
(2, 'Столица', 'London is the capital of Great Britain', 1, '2022-11-11 12:59:42'),
(3, 'nbib87vff', 'vkjbwkrjbvkw', 8, '2022-11-11 13:00:04');

-- --------------------------------------------------------

--
-- Структура таблицы `posts_photos`
--

CREATE TABLE `posts_photos` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `photo_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts_tags`
--

CREATE TABLE `posts_tags` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`, `created_at`) VALUES
(1, 1, 1, '2022-11-11 15:32:11'),
(2, 1, 2, '2022-11-11 15:32:11');

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `tag` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`) VALUES
(1, 'Веб', '2022-11-11 15:31:57'),
(2, 'Разработка', '2022-11-11 15:31:57');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `photo_id` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `balance` float NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `photo_id`, `birthday`, `country`, `city`, `gender`, `balance`, `created_at`) VALUES
(1, 'hello@example.com', '123456', 'Ivan', 'Ivanov', NULL, '1999-11-11', 'Россия', 'Москва', 'male', 90, '2022-11-09 10:09:12'),
(2, 'vasya@yandex.ru', '123456', 'Василий', 'Теркин', NULL, NULL, 'РФ', 'Калининград', 'male', 110, '2022-11-09 10:10:10'),
(3, 'user123@test.test', '654321', 'Маша', 'Иванова', NULL, '1990-01-31', 'Россия', 'Москва', 'female', 100, '2022-11-09 10:11:06'),
(4, 'peter@yandex.ru', '91385791385', 'Петр', 'Петрович', NULL, NULL, NULL, 'Москва', NULL, 100, '2022-11-09 10:11:37'),
(5, 'pasha@trefilov.su', '123435', 'Pavel', 'Trefilov', NULL, NULL, 'Russia', NULL, 'male', 100, '2022-11-09 10:13:30'),
(6, 'wcweckwej@yandex.ru', '123123123', 'Kate', 'Kate', NULL, '1995-05-05', 'Россия', 'Москва', 'female', 100, '2022-11-09 10:13:30'),
(7, 'unknown@test.example', '123123123', 'Who', 'Am I', NULL, NULL, NULL, 'Москва', NULL, 100, '2022-11-09 10:13:55'),
(8, 'jnkjnk@sevsdvsv.ry', '25234253', 'Test', 'Testerovich', NULL, NULL, 'Belarus', 'Grodno', 'male', 100, '2022-11-09 10:15:25'),
(9, 'svvsevevsv@svsvsv.ru', '123456', 'Bob', 'Marley', NULL, '1900-01-01', 'USA', 'LA', NULL, 100, '2022-11-09 10:15:25'),
(10, 'qwe@qweq.qweqwe', '1424124', 'No', 'Name', NULL, NULL, 'Россия', NULL, NULL, 100, '2022-11-09 10:16:20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_ibfk_1` (`post_id`),
  ADD KEY `comments_ibfk_2` (`user_id`);

--
-- Индексы таблицы `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);
ALTER TABLE `posts` ADD FULLTEXT KEY `title` (`title`,`body`);

--
-- Индексы таблицы `posts_photos`
--
ALTER TABLE `posts_photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Индексы таблицы `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `photo_id` (`photo_id`),
  ADD KEY `users_gender_city` (`gender`,`city`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `posts_photos`
--
ALTER TABLE `posts_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `posts_photos`
--
ALTER TABLE `posts_photos`
  ADD CONSTRAINT `posts_photos_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
