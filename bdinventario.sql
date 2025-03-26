-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2025 a las 02:18:16
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
-- Base de datos: `bdinventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(3) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(10) NOT NULL,
  `condicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`, `descripcion`, `estado`, `direccion`, `telefono`, `condicion`) VALUES
(18, 'Pulseras', 'fer', 'Pendiente', 'miami', 87729666, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleusuario`
--

CREATE TABLE `detalleusuario` (
  `iddetalleusuario` int(10) UNSIGNED NOT NULL,
  `idpermiso` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `idusuario` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `condicion` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `detalleusuario`
--

INSERT INTO `detalleusuario` (`iddetalleusuario`, `idpermiso`, `idusuario`, `condicion`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 5, 1, 1),
(5, 6, 1, 1),
(6, 7, 1, 1),
(7, 8, 1, 1),
(8, 9, 1, 1),
(9, 1, 2, 1),
(10, 2, 2, 1),
(11, 3, 2, 1),
(12, 4, 2, 1),
(13, 5, 2, 1),
(14, 6, 2, 1),
(15, 7, 2, 1),
(16, 8, 2, 1),
(17, 9, 2, 1),
(18, 10, 2, 1),
(19, 1, 3, 1),
(20, 2, 3, 1),
(21, 3, 3, 1),
(22, 4, 3, 1),
(23, 5, 3, 1),
(24, 6, 3, 1),
(25, 7, 3, 1),
(26, 8, 3, 1),
(27, 9, 3, 1),
(28, 10, 3, 1),
(29, 1, 4, 1),
(30, 2, 4, 1),
(31, 3, 4, 1),
(32, 4, 5, 1),
(33, 5, 5, 1),
(34, 6, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','procesando','enviado','entregado') DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermisos` int(10) UNSIGNED NOT NULL,
  `permisos` varchar(245) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermisos`, `permisos`) VALUES
(1, 'Categoria crear'),
(2, 'Categoria anular'),
(3, 'Categoria Editar'),
(4, 'Proveedor crear'),
(5, 'Proveedor anular'),
(6, 'Proveedor editar'),
(7, 'Usuario crear'),
(8, 'Usuario anular'),
(9, 'Usuario editar'),
(10, 'Crear cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedores`
--

CREATE TABLE `tbl_proveedores` (
  `idprov` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `condicion` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`idprov`, `nombre`, `direccion`, `telefono`, `Ciudad`, `contacto`, `condicion`) VALUES
(12, 'Pulsera', '', 'Lps 460', '1742556895.jpg', 'pulseras', 1),
(13, 'Pulsera', '', 'Lps 250', '1742556970.jpg', 'pulseras', 1),
(14, 'Set ', '', 'Lps 400', '1742556993.jpg', 'sets', 1),
(15, 'Aretes', '', 'Lps 450', '1742557394.jpg', 'aretes', 1),
(16, 'Conjunto ', '', 'Lps 450', '1742557143.jpg', 'sets', 1),
(17, 'Aretes', '', 'Lps 500', '1742557186.jpg', 'aretes', 1),
(18, 'Set', '', 'Lps 900', '1742557245.jpg', 'sets', 1),
(19, 'Pulseras', '', 'Lps 420', '1742557527.jpg', 'pulseras', 1),
(20, 'Pulseras', '', 'Lps 700', '1742557541.jpg', 'pulseras', 1),
(21, 'Aretes', '', 'Lps 600', '1742557565.jpg', 'aretes', 1),
(22, 'Aretes', '', 'Lps 240', '1742557592.jpg', 'aretes', 1),
(23, 'Collar de perlas', '', 'Lps 1,800', '1742557619.jpg', 'collares', 1),
(24, 'Cadena', '', 'Lps 300', '1742557666.jpg', 'collares', 1),
(25, 'Collar de perlas', '', 'Lps 1,250', '1742557905.jpg', 'collares', 1),
(26, 'Pulsera Acero Inoxidable ', '', 'Lps 350', '1742557738.jpg', 'pulseras', 1),
(27, 'Cadena Acero Inoxidable ', '', 'Lps 490', '', 'caballeros', 0),
(28, 'Pulsera', '', 'Lps 300', '1742557969.jpg', 'pulseras', 1),
(29, 'Aretes', '', 'Lps 1,000', '1742557993.jpg', 'aretes', 1),
(30, 'Anillo', '', 'Lps 380', '1742558017.jpg', 'anillos', 1),
(31, 'Pulsera', '', 'Lps 250', '1742558041.jpg', 'pulseras', 1),
(32, 'Pulseras', '', 'Lps 450', '1742558060.jpg', 'pulseras', 1),
(33, 'Pulsera', '', 'Lps 300', '1742558080.jpg', 'pulseras', 1),
(34, 'Pulseras ', '', 'Lps 300', '1742558131.jpg', 'pulseras', 1),
(35, 'Aretes', '', 'Lps 500', '1742558172.jpg', 'aretes', 1),
(36, 'Aretes', '', 'Lps 520', '1742558203.jpg', 'aretes', 1),
(37, 'Aretes', '', 'Lps 300', '1742606110.jpg', 'aretes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(10) UNSIGNED NOT NULL,
  `login` varchar(45) NOT NULL DEFAULT '',
  `clave` varchar(45) NOT NULL DEFAULT '',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `cargo` varchar(45) NOT NULL DEFAULT '',
  `imagen` varchar(45) NOT NULL DEFAULT '',
  `ultimo` datetime DEFAULT NULL,
  `condicion` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `login`, `clave`, `nombre`, `cargo`, `imagen`, `ultimo`, `condicion`) VALUES
(1, 'admin1', '123', 'admon', 'administrador', '1741054024.png', '2025-03-03 20:07:04', 0),
(2, 'Joelr', '321', 'Joel Reyes', 'comprador', '', NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalleusuario`
--
ALTER TABLE `detalleusuario`
  ADD PRIMARY KEY (`iddetalleusuario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermisos`);

--
-- Indices de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD PRIMARY KEY (`idprov`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `detalleusuario`
--
ALTER TABLE `detalleusuario`
  MODIFY `iddetalleusuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermisos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  MODIFY `idprov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `tbl_proveedores` (`idprov`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
