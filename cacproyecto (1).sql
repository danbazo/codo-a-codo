-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2022 a las 16:43:44
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cacproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idlocalidad` int(11) NOT NULL,
  `nombrelocalidad` varchar(40) NOT NULL,
  `idprovlocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idlocalidad`, `nombrelocalidad`, `idprovlocalidad`) VALUES
(1, 'Moreno', 3),
(2, 'Guaymallén', 4),
(3, 'Cafayate', 2),
(4, 'Cruz Alta', 1),
(5, 'Vicente Lopez', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `lugarentrega` varchar(80) NOT NULL,
  `localidad` int(11) NOT NULL,
  `provincia` int(11) NOT NULL,
  `codpostal` varchar(9) NOT NULL,
  `formadepago` varchar(10) NOT NULL,
  `tarjtitular` varchar(40) NOT NULL,
  `tarjnumero` bigint(11) NOT NULL,
  `tarjvto` varchar(10) NOT NULL,
  `tarjclave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `nombre`, `apellido`, `usuario`, `mail`, `lugarentrega`, `localidad`, `provincia`, `codpostal`, `formadepago`, `tarjtitular`, `tarjnumero`, `tarjvto`, `tarjclave`) VALUES
(1, 'Pedro', 'Suarez', 'psuarez', 'dsf@dsf.com', 'Lavalle 3222', 1, 1, '1233', 'o', 'Pedro suarez', 2147483647, '0422', 1245),
(2, '', 'Suarez', 'psuarez', 'pedro@gmail.com', 'Lavalle 3222', 1, 1, '1234', 'o', 'Pedro suarez', 2147483647, '0422', 325),
(3, 'Pedro', 'Suarez', 'psuarez', 'pedro@gmail.com', 'Lavalle 3222', 1, 1, '1233', 'o', 'Pedro suarez', 2147483647, '0422', 123),
(4, 'Pedro', 'Suarez', 'psuarez', 'pedro@gmail.com', 'Lavalle 3222', 1, 1, '1234', 'o', 'sdf', 2147483647, 'sdf', 1245),
(5, 'Juan', 'Rodriguez', 'jrodriguez', 'jrodriguez@gmail.com', 'Av. Rivadavia 32556', 1, 2, '1233', 'o', 'Juan rodriguez', 2147483647, '0422', 124),
(6, 'María', 'Rosalex', 'mrosales', 'jrodriguez@gmail.com', 'Jujuy 323', 1, 2, '3433', 'o', 'María Rosales', 2147483647, '0422', 314),
(7, 'Pedro', 'Suarez', 'jrodriguez', 'dsf@vorterix.com', ' Av. Rivadavia 32556', 1, 1, '1233', 'tarjeta', 'Juan rodriguez', 21474836475, '0422', 124),
(8, 'Juana', 'Rodriguez', 'sdf', 'jrodriguez@gmail.com', 'Lavalle 3222', 1, 1, '1233', 'o', 'Juan rodriguez', 2147483647, '0422', 124),
(9, 'Juana', 'Rodriguez', 'sdf', 'jrodriguez@gmail.com', 'Lavalle 3222', 1, 1, '1233', 'o', 'Juan rodriguez', 2147483647, '0422', 124),
(10, 'Hermeto', 'Carmona', 'hcarmona', 'hcarmona@gmail.com', ' Av. La Plata 2233 ', 1, 1, '1882', 'tarjeta', 'ss', 33, '33', 555),
(22, 'Yuletsy', 'Gomez', 'yule', 'yule287@gmail.com', ' Av. Juan Bustista Alberdi 56789', 1, 3, '1424', 'tarjeta', 'Yule', 1234123412341234, '0545', 123),
(23, 'Yuletsy', 'Gomez Vargas', 'dhsdn', 'yule287@gmail.com', 'Av. Juan Bustista Alberdi 567', 2, 4, '1424', 'tarjeta', 'nfdnsfn', 5615612, '1255', 444),
(24, 'Daniel', 'Bazo', 'dhsdn', 'yule287@gmail.com', ' Av. Juan Bustista Alberdi 5678', 2, 4, '1424', 'tarjeta', 'nfdnsfn', 5615612, '1255', 444),
(25, 'Carlos', 'Sanchez', 'csanchez', 'csanchez@gmail.com', ' Mi casa 1234', 5, 3, '1234', 'tarjeta', 'Carlos Sanchez', 12345, '7894', 555),
(26, 'Diego', 'Marquez', 'dmarquz', 'dmarsjbck@vnsnv.com', 'Bolivar 1356', 2, 4, '1141', 'tarjeta', 'Diego MArquez', 1234123412341234, '5555', 777),
(27, 'Diego', 'Marquez', 'dmarquz', 'dmarsjbck@vnsnv.com', 'Bolivar 1356', 3, 2, '1141', 'tarjeta', 'Diego MArquez', 1234123412341234, '5555', 666);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`idprovincia`, `nombre`) VALUES
(1, 'Tucuman'),
(2, 'Salta'),
(3, 'Buenos Aires'),
(4, 'Mendoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombreyapellido` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `clave`, `nombreyapellido`) VALUES
(1, 'prueba@gmail.com', '909090', 0x4a6f73c3a92049676e6163696f),
(2, 'mail@hotmail.com', '808080', 0x4a75616e204361726c6f73),
(8, 'yule287@gmail.com', '1234', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idlocalidad`),
  ADD UNIQUE KEY `LocProvincia` (`idlocalidad`),
  ADD KEY `LocProv` (`idprovlocalidad`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idlocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `LocProv` FOREIGN KEY (`idprovlocalidad`) REFERENCES `provincias` (`idprovincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
