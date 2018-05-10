-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2018 a las 00:48:50
-- Versión del servidor: 5.6.38
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`id`, `nombre`, `precio`) VALUES
(1, 'Orden de burritos', '22.00'),
(2, 'Molletes', '40.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementosPedido`
--

CREATE TABLE `elementosPedido` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idComida` int(11) NOT NULL,
  `nombreComida` varchar(255) NOT NULL,
  `precioComida` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elementosPedido`
--

INSERT INTO `elementosPedido` (`id`, `idPedido`, `idComida`, `nombreComida`, `precioComida`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 'Orden de burritos', 22, 1, 22),
(2, 1, 2, 'Molletes', 40, 2, 80),
(3, 2, 1, 'Orden de burritos', 22, 4, 88),
(4, 2, 2, 'Molletes', 40, 3, 120),
(5, 3, 1, 'Orden de burritos', 22, 2, 44),
(6, 3, 2, 'Molletes', 40, 4, 160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosPedido`
--

CREATE TABLE `estadosPedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadosPedido`
--

INSERT INTO `estadosPedido` (`id`, `descripcion`) VALUES
(1, 'Recibido'),
(2, 'En preparación'),
(3, 'Listo para entregar'),
(4, 'Entregado'),
(5, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEstadoPedido` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idUsuario`, `idEstadoPedido`, `fecha`, `total`) VALUES
(1, 3, 1, '2018-05-09 15:52:15', 102),
(2, 3, 1, '2018-05-09 15:53:36', 208),
(3, 7, 1, '2018-05-09 16:19:15', 204);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoUsuario`
--

CREATE TABLE `tipoUsuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipoUsuario`
--

INSERT INTO `tipoUsuario` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Cocinero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `idTipoUsuario`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Emiliano', 'emiliano@correo.com', '$2y$10$kxEHxdfcAxboShoKaMfsCuRq0pK/Wrc9WdQ4buPlL4et1KAD.iBDu', 'tmmghhCo6HdicXGCX1FsvkwAqtWma5NnCf3wfOJl1x83ZMZXZCPddqwrIUeg', '2018-03-01 06:36:30', '2018-05-10 06:18:50'),
(2, 1, NULL, 'nuevo@correo.com', '$2y$10$YU.Sa/wc7krfkfbrxA2uw.jn7WQDs4oZ0BSjWGhsJs/ut54wg/ANa', 'vJjPDAGw3UIvIAb7iojxLGbA7r2864MS12VEFotZK6UjVCtegf8KIFTuffKN', '2018-04-19 07:07:23', '2018-05-10 06:18:03'),
(3, 2, NULL, 'cliente@correo.com', '$2y$10$ZLF1Bt6/Wy.iGS4r2/EwQe0FF2LBTbT.oJX6RYq1gmrgqC0U4s56a', '3U4UBR6P63vvneHNM3TQgfeDi7MxRF3HByWm9bcULcimk7pP6kJza0mxr1Sk', '2018-04-19 07:15:10', '2018-05-10 06:25:05'),
(4, 2, NULL, 'usuario@correo.com', '$2y$10$MfhFvPRe76xiPOCLx9Hbh.jwaOU2rWBWhsoThD1YJLl9dYL/NVy3S', NULL, '2018-04-19 07:46:48', '2018-04-19 07:46:48'),
(5, 3, NULL, 'jorge@correo.com', '$2y$10$08HkBMvaE22/6r6DZGr35eGc1J5EtvKgJl0IaSI39KKQrthZcbETi', 'rYaJCqJ4it2XntnmzvV0HOrOVGX53jlQjj2VDnbUV39v9PfKD85QgFBEtOsb', '2018-05-10 05:57:03', '2018-05-10 06:22:59'),
(6, 3, NULL, 'juan@correo.com', '$2y$10$rCGPW.m73204F3zP63sjq.kYzMszmPIMfZzY.5v4w3n0jebceyj22', NULL, '2018-05-10 05:57:23', '2018-05-10 05:57:23'),
(7, 2, NULL, 'cliente2@correo.com', '$2y$10$aHRuDLEE07s.nE6mqMsRNOoW8wT9gXqLH9CyyugcT6CoH5a4chMDK', 'g3AQeIZGVM5CeK4Y8YcgArzsqfzd9cYCDHsiD4dKo5SUiaNdqBlqXjfxfhgF', '2018-05-10 06:18:47', '2018-05-10 06:19:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `elementosPedido`
--
ALTER TABLE `elementosPedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idComida` (`idComida`);

--
-- Indices de la tabla `estadosPedido`
--
ALTER TABLE `estadosPedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEstadoPedido` (`idEstadoPedido`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `tipoUsuario`
--
ALTER TABLE `tipoUsuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `elementosPedido`
--
ALTER TABLE `elementosPedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadosPedido`
--
ALTER TABLE `estadosPedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoUsuario`
--
ALTER TABLE `tipoUsuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `elementosPedido`
--
ALTER TABLE `elementosPedido`
  ADD CONSTRAINT `elementospedido_ibfk_1` FOREIGN KEY (`idComida`) REFERENCES `comidas` (`id`),
  ADD CONSTRAINT `elementospedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idEstadoPedido`) REFERENCES `estadosPedido` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipoUsuario` (`id`);
