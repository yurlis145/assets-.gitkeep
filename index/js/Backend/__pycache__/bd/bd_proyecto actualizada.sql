-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2025 a las 00:26:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `iddetalle` int(11) NOT NULL,
  `idcompra` int(11) DEFAULT NULL,
  `idproducto` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `precio`, `categoria`) VALUES
('10001', 'Alpha Balance', 25000.00, 'Limpieza'),
('10002', 'Berry Balance', 26000.00, 'Limpieza'),
('10003', 'Flora Llu', 24000.00, 'Limpieza'),
('10004', 'Liquid Fiber', 27000.00, 'Limpieza'),
('11001', 'BioPro', 40000.00, 'Nutre y Regenera'),
('11002', 'Protein Active Vainilla y Canela', 42000.00, 'Nutre y Regenera'),
('11003', 'Protein Active Chocolate con Avellanas', 42000.00, 'Nutre y Regenera'),
('12001', 'Nutraday', 28000.00, 'Revitaliza'),
('12002', 'Vita Xtra T+', 30000.00, 'Revitaliza'),
('13001', 'Vera+', 26000.00, 'Línea Inmunológica'),
('13002', 'Ganomas Cappuccino', 29000.00, 'Línea Inmunológica'),
('14001', 'BioPro+ Fit', 41000.00, 'Línea Control de Peso y Medidas'),
('14002', 'Café & Café Fit', 32000.00, 'Línea Control de Peso y Medidas'),
('14003', 'Chocolate Fit', 33000.00, 'Línea Control de Peso y Medidas'),
('14004', 'Nocarb-T', 31000.00, 'Línea Control de Peso y Medidas'),
('15001', 'HGH', 35000.00, 'Línea Anti-age'),
('15002', 'Golden Flx', 34000.00, 'Línea Anti-age'),
('15003', 'Passion', 36000.00, 'Línea Anti-age'),
('15004', 'Robal', 33000.00, 'Línea Anti-age'),
('16001', 'ON', 29000.00, 'Línea Urgor Mental'),
('16002', 'OFF', 29000.00, 'Línea Urgor Mental'),
('20001', 'BioPro+ Sport Pro Edition', 45000.00, 'Línea Sport'),
('20002', 'Post Sport', 43000.00, 'Línea Sport'),
('20003', 'PreSport', 44000.00, 'Línea Sport'),
('20004', 'Protein Active Sport Vainilla & Canela', 46000.00, 'Línea Sport');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `tipo` enum('Administrador','Usuario') DEFAULT 'Usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `correo`, `contrasena`, `barrio`, `direccion`, `codigo_postal`, `tipo`) VALUES
('1001234567', 'Ana Pérez', 'ana.perez@example.com', 'ana123', 'El Prado', 'Calle 72 #45-10, Barranquilla', '080001', 'Usuario'),
('1002345678', 'Luis Gómez', 'luis.gomez@example.com', 'luis123', 'Villa Campestre', 'Cra 53 #102-20, Barranquilla', '080020', 'Usuario'),
('1003456789', 'Camila Ríos', 'camila.rios@example.com', 'camila123', 'Centro', 'Calle 30 #41-15, Soledad', '083001', 'Administrador'),
('1004567890', 'Jorge Martínez', 'jorge.martinez@example.com', 'jorge123', 'Los Robles', 'Carrera 23 #18-25, Soledad', '083010', 'Usuario'),
('1005678901', 'María Díaz', 'maria.diaz@example.com', 'maria123', 'Alameda del Río', 'Av Circunvalar #110-30, Barranquilla', '080030', 'Usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `idcompra` (`idcompra`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `detallecompra_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`),
  ADD CONSTRAINT `detallecompra_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
