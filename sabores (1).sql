-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2024 a las 04:48:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sabores`
--
CREATE DATABASE IF NOT EXISTS `sabores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sabores`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atención al cliente`
--

CREATE TABLE `atención al cliente` (
  `ID` int(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `atención al cliente`
--

INSERT INTO `atención al cliente` (`ID`, `Nombre`, `Telefono`) VALUES
(1, 'Atencion al cliente', 4146696913);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu de restaurante`
--

CREATE TABLE `menu de restaurante` (
  `ID_producto` int(100) NOT NULL,
  `ID_restaurante` int(100) NOT NULL,
  `Nombre_producto` varchar(99) NOT NULL,
  `Precio` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menu de restaurante`
--

INSERT INTO `menu de restaurante` (`ID_producto`, `ID_restaurante`, `Nombre_producto`, `Precio`) VALUES
(1, 1, 'Pizza Tradicional', '7$'),
(2, 1, 'Pizza Con Maiz', '8$'),
(3, 1, 'Pizza con Peperoni', '9$'),
(4, 1, 'Pizza con Borde de Queso', '8$'),
(5, 2, 'Caja Feliz + Bebida', '7$'),
(6, 2, 'Big Mac + Bebida + Papas Fritas', '9$'),
(7, 2, 'Hamburguesa de carne + Bebida + Papas Fritas', '7$'),
(8, 2, 'Hamburguesa de Pollo + Bebida + Papas Fritas', '8$'),
(9, 2, 'Barquilla', '2$'),
(10, 3, '2 Piezas de pollo + Bebida + 1 ensalada', '4$'),
(11, 3, '4 Piezas de pollo + 2 Bebidas + 2 ensaladas', '6$'),
(12, 3, '8 piezas de pollo + 3 Bebidas + 3 ensaladas', '10$'),
(13, 3, 'Balde de 16 Piezas + Arepitas + 5 Bebida + 400gr de papas fritas', '20$');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_pedido` int(100) NOT NULL,
  `ID_usuario` int(100) NOT NULL,
  `ID_restaurante` int(100) NOT NULL,
  `ID_producto` int(100) NOT NULL,
  `Cantidad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_pedido`, `ID_usuario`, `ID_restaurante`, `ID_producto`, `Cantidad`) VALUES
(1, 1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recervas`
--

CREATE TABLE `recervas` (
  `ID_recerva` int(100) NOT NULL,
  `ID_usuario` int(100) NOT NULL,
  `Hora` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recervas`
--

INSERT INTO `recervas` (`ID_recerva`, `ID_usuario`, `Hora`) VALUES
(1, 1, '2024-07-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `ID_restaurante` int(100) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Numero de Telefono` int(40) NOT NULL,
  `RIF` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`ID_restaurante`, `Nombre`, `Numero de Telefono`, `RIF`) VALUES
(1, 'Titos Pizza', 265123456, 1000000),
(2, 'McDonal', 265789456, 1111110),
(3, 'KFC', 265123789, 1010101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuario` int(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(99) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_usuario`, `Nombre`, `Apellido`, `Email`, `Password`) VALUES
(1, 'Kensux', 'Gheghios', 'kevingheghios2@gmail.com', '123456789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atención al cliente`
--
ALTER TABLE `atención al cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `menu de restaurante`
--
ALTER TABLE `menu de restaurante`
  ADD PRIMARY KEY (`ID_producto`),
  ADD KEY `ID_restaurante` (`ID_restaurante`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `ID_producto` (`ID_producto`),
  ADD KEY `ID_restaurante` (`ID_restaurante`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `recervas`
--
ALTER TABLE `recervas`
  ADD PRIMARY KEY (`ID_recerva`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`ID_restaurante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atención al cliente`
--
ALTER TABLE `atención al cliente`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu de restaurante`
--
ALTER TABLE `menu de restaurante`
  MODIFY `ID_producto` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_pedido` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recervas`
--
ALTER TABLE `recervas`
  MODIFY `ID_recerva` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `ID_restaurante` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuario` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `menu de restaurante`
--
ALTER TABLE `menu de restaurante`
  ADD CONSTRAINT `menu de restaurante_ibfk_1` FOREIGN KEY (`ID_restaurante`) REFERENCES `restaurantes` (`ID_restaurante`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `menu de restaurante` (`ID_producto`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`ID_restaurante`) REFERENCES `restaurantes` (`ID_restaurante`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`);

--
-- Filtros para la tabla `recervas`
--
ALTER TABLE `recervas`
  ADD CONSTRAINT `recervas_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
