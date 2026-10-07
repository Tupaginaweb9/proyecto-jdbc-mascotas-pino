-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2026 a las 09:37:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `id_categoria`, `nombre`) VALUES
(1, 1, 'Ropa'),
(2, 2, 'Collar'),
(3, 3, 'Accesorios'),
(4, 4, 'Cadena'),
(5, 5, 'Camas'),
(6, 6, 'Pecheras');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `producto` (
`id` int(11)
,`id_producto` int(11)
,`nombre` varchar(100)
,`id_categoria` int(11)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`imagen` varchar(255)
,`imagen_url` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_categoria` int(11) DEFAULT 1,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(255) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_producto`, `nombre`, `id_categoria`, `descripcion`, `precio`, `stock`, `imagen`, `imagen_url`) VALUES
(2, 2, 'Pechera para perro', 6, 'Pechera resistente para perros.', 45000.00, 15, 'https://via.placeholder.com/400x300?text=Pecheras', 'https://via.placeholder.com/400x300?text=Pecheras'),
(3, NULL, '1', 1, '1', 1.00, 1, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura para la vista `producto`
--
DROP TABLE IF EXISTS `producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `producto`  AS SELECT `productos`.`id` AS `id`, `productos`.`id_producto` AS `id_producto`, `productos`.`nombre` AS `nombre`, `productos`.`id_categoria` AS `id_categoria`, `productos`.`descripcion` AS `descripcion`, `productos`.`precio` AS `precio`, `productos`.`stock` AS `stock`, `productos`.`imagen` AS `imagen`, `productos`.`imagen_url` AS `imagen_url` FROM `productos` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
