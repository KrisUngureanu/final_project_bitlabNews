-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 22 2025 г., 09:56
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bitlab_news`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `comment`, `post_date`, `user_id`, `news_id`) VALUES
(2, 'new text', '2025-01-22 07:12:44', 2, 1),
(5, 'erw', '2025-01-22 07:49:23', 1, 1),
(6, 'iuthg', '2025-01-22 08:51:25', 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `count_comms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `post_date`, `category_id`, `title`, `content`, `count_comms`) VALUES
(1, '2025-01-22 08:35:32', 2, 'dsfsdfs', 'sdgsgdfgdfgdf', 2),
(2, '2025-01-22 08:51:25', 1, 'testtttt', 'Ð¡ÐµÐ³Ð¾Ð´Ð½ÑÑÐ½Ð¸Ð¹ Ð¼Ð¸Ñ Ð½ÐµÐ²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ Ð¿ÑÐµÐ´ÑÑÐ°Ð²Ð¸ÑÑ Ð±ÐµÐ· Ð¿ÑÐ¾Ð³ÑÐ°Ð¼Ð¼Ð¸ÑÐ¾Ð²Ð°Ð½Ð¸Ñ, Ð¸ ÑÐ·ÑÐº Python ÑÑÐ°Ð» Ð¾Ð´Ð½Ð¸Ð¼ Ð¸Ð· ÑÐ°Ð¼ÑÑ Ð¿Ð¾Ð¿ÑÐ»ÑÑÐ½ÑÑ Ð¸Ð½ÑÑÑÑÐ¼ÐµÐ½ÑÐ¾Ð² Ð´Ð»Ñ ÑÐµÑÐµÐ½Ð¸Ñ Ð·Ð°Ð´Ð°Ñ Ð² ÑÐ°Ð·Ð»Ð¸ÑÐ½ÑÑ Ð¾Ð±Ð»Ð°ÑÑÑÑ: Ð¾Ñ Ð²ÐµÐ±-ÑÐ°Ð·ÑÐ°Ð±Ð¾ÑÐºÐ¸ Ð´Ð¾ Ð°Ð½Ð°Ð»Ð¸Ð·Ð° Ð´Ð°Ð½Ð½ÑÑ Ð¸ Ð¸ÑÐºÑÑÑÑÐ²ÐµÐ½Ð½Ð¾Ð³Ð¾ Ð¸Ð½ÑÐµÐ»Ð»ÐµÐºÑÐ°. ÐÑÑÑ \"ÐÐ¾ÐºÐ¾Ð»ÐµÐ½Ð¸Ðµ Python: ÐºÑÑÑ Ð´Ð»Ñ Ð½Ð°ÑÐ¸Ð½Ð°ÑÑÐ¸Ñ\" â ÑÑÐ¾ Ð¸Ð´ÐµÐ°Ð»ÑÐ½Ð¾Ðµ ÑÐµÑÐµÐ½Ð¸Ðµ Ð´Ð»Ñ ÑÐµÑ, ÐºÑÐ¾ ÑÐ¾ÑÐµÑ ÑÐ´ÐµÐ»Ð°ÑÑ ÑÐ²Ð¾Ð¸ Ð¿ÐµÑÐ²ÑÐµ ÑÐ°Ð³Ð¸ Ð² Ð¿ÑÐ¾Ð³ÑÐ°Ð¼Ð¼Ð¸ÑÐ¾Ð²Ð°Ð½Ð¸Ð¸ Ð¸ Ð¾ÑÐ²Ð¾Ð¸ÑÑ Ð¾Ð´Ð¸Ð½ Ð¸Ð· ÑÐ°Ð¼ÑÑ Ð²Ð¾ÑÑÑÐµÐ±Ð¾Ð²Ð°Ð½Ð½ÑÑ ÑÐ·ÑÐºÐ¾Ð².', 1),
(3, '2025-01-22 08:31:29', 1, 'testtttt', 'Ð¡ÐµÐ³Ð¾Ð´Ð½ÑÑÐ½Ð¸Ð¹ Ð¼Ð¸Ñ Ð½ÐµÐ²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ Ð¿ÑÐµÐ´ÑÑÐ°Ð²Ð¸ÑÑ Ð±ÐµÐ· Ð¿ÑÐ¾Ð³ÑÐ°Ð¼Ð¼Ð¸ÑÐ¾Ð²Ð°Ð½Ð¸Ñ, Ð¸ ÑÐ·ÑÐº Python ÑÑÐ°Ð» Ð¾Ð´Ð½Ð¸Ð¼ Ð¸Ð· ÑÐ°Ð¼ÑÑ Ð¿Ð¾Ð¿ÑÐ»ÑÑÐ½ÑÑ Ð¸Ð½ÑÑÑÑÐ¼ÐµÐ½ÑÐ¾Ð² Ð´Ð»Ñ ÑÐµÑÐµÐ½Ð¸Ñ Ð·Ð°Ð´Ð°Ñ Ð² ÑÐ°Ð·Ð»Ð¸ÑÐ½ÑÑ Ð¾Ð±Ð»Ð°ÑÑÑÑ: Ð¾Ñ Ð²ÐµÐ±-ÑÐ°Ð·ÑÐ°Ð±Ð¾ÑÐºÐ¸ Ð´Ð¾ Ð°Ð½Ð°Ð»Ð¸Ð·Ð° Ð´Ð°Ð½Ð½ÑÑ Ð¸ Ð¸ÑÐºÑÑÑÑÐ²ÐµÐ½Ð½Ð¾Ð³Ð¾ Ð¸Ð½ÑÐµÐ»Ð»ÐµÐºÑÐ°. ÐÑÑÑ \"ÐÐ¾ÐºÐ¾Ð»ÐµÐ½Ð¸Ðµ Python: ÐºÑÑÑ Ð´Ð»Ñ Ð½Ð°ÑÐ¸Ð½Ð°ÑÑÐ¸Ñ\" â ÑÑÐ¾ Ð¸Ð´ÐµÐ°Ð»ÑÐ½Ð¾Ðµ ÑÐµÑÐµÐ½Ð¸Ðµ Ð´Ð»Ñ ÑÐµÑ, ÐºÑÐ¾ ÑÐ¾ÑÐµÑ ÑÐ´ÐµÐ»Ð°ÑÑ ÑÐ²Ð¾Ð¸ Ð¿ÐµÑÐ²ÑÐµ ÑÐ°Ð³Ð¸ Ð² Ð¿ÑÐ¾Ð³ÑÐ°Ð¼Ð¼Ð¸ÑÐ¾Ð²Ð°Ð½Ð¸Ð¸ Ð¸ Ð¾ÑÐ²Ð¾Ð¸ÑÑ Ð¾Ð´Ð¸Ð½ Ð¸Ð· ÑÐ°Ð¼ÑÑ Ð²Ð¾ÑÑÑÐµÐ±Ð¾Ð²Ð°Ð½Ð½ÑÑ ÑÐ·ÑÐºÐ¾Ð².', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `news_categories`
--

INSERT INTO `news_categories` (`id`, `name`) VALUES
(1, 'Политические'),
(2, 'Социальные');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full_name`, `role_id`) VALUES
(1, 'admin@mail.ru', '1234', 'Sys admin', 1),
(2, 'kristina@tamur.kz', '123', 'Kristina Unguryanu', 2),
(3, 'test@mail.ru', '123', 'Test Testovich', 1),
(4, 'test3@mail.ru', '123', 'testik', 2),
(5, 'test73@mail.ru', '123', 'lesdrfhlds', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
