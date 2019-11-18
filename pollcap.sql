-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2019 a las 08:25:01
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pollcap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `id` bigint(20) NOT NULL,
  `deacuerdo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `desacuerdo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `indiferente` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`id`, `deacuerdo`, `desacuerdo`, `indiferente`) VALUES
(1, 'deacuerdo', NULL, NULL),
(2, NULL, 'desacuerdo', NULL),
(3, NULL, NULL, 'indiferente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id` bigint(20) NOT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` datetime(6) DEFAULT current_timestamp(6),
  `id_servicio_bienestar` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id`, `create_at`, `update_at`, `id_servicio_bienestar`, `id_usuario`) VALUES
(1, '2019-11-16', '2019-11-16 00:00:00.000000', 2, 1),
(2, '2019-11-16', '2019-11-16 00:00:00.000000', 4, 5),
(3, '2019-11-16', '2019-11-01 00:00:00.000000', 4, 5),
(4, '2019-11-16', '2019-11-02 00:00:00.000000', 2, 3),
(5, '2019-11-16', '2019-11-25 00:00:00.000000', 2, 4),
(6, '2019-11-01', '2019-11-17 00:00:00.000000', 1, 9),
(7, '2019-11-02', '2019-11-21 00:00:00.000000', 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` bigint(20) NOT NULL,
  `contenido` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` datetime(6) DEFAULT current_timestamp(6),
  `id_encuesta` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `contenido`, `create_at`, `update_at`, `id_encuesta`) VALUES
(6, 'El lugar de enseñanza es adecuado', '2019-11-16', NULL, 2),
(7, 'Los recursos utilizados son apropiados', '2019-11-16', NULL, 4),
(8, 'Existe orden lógico en el proceso de enseñanza', '2019-11-16', NULL, 1),
(9, 'Recomendaría el bienestar de natación', '2019-11-16', NULL, 1),
(10, 'El bienestar le ayuda en su vida personal, profesional o laboral', '2019-11-16', NULL, 2),
(11, 'El clima institucional es agradable', '2019-11-16', NULL, 1),
(12, 'Las técnicas presentadas por el docente ayudan en el proceso de aprendizaje', '2019-11-16', NULL, 1),
(13, 'Las reglas del bienestar son claras desde el principio y se hacen cumplir por el docente', '2019-11-18', NULL, 1),
(14, 'El tiempo de duración del bienestar es suficiente para cumplir los objetivos', '2019-11-16', NULL, 1),
(15, 'El bienestar cumplió con sus expectativas', '2019-11-16', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` bigint(20) NOT NULL,
  `create_at` date DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `create_at`, `nombre`, `update_at`) VALUES
(1, '2019-11-16', 'ingenieria de sistemas', NULL),
(2, '2019-11-16', 'ingenieria industrial', NULL),
(3, '2019-11-16', 'psicologia', NULL),
(4, '2019-11-16', 'medicina', NULL),
(5, '2019-11-16', 'mercadeo y publicidad', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` bigint(20) NOT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `id_contenido` bigint(20) DEFAULT NULL,
  `id_pregunta` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `create_at`, `descripcion`, `nombre`, `update_at`) VALUES
(1, '2019-11-16 00:00:00.000000', 'estudiante diligencia encuesta', 'estudiante', NULL),
(2, '2019-11-16 00:00:00.000000', 'coordinador mirar resultados', 'coordinador', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestres`
--

CREATE TABLE `semestres` (
  `id` bigint(20) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `semestres`
--

INSERT INTO `semestres` (`id`, `create_at`, `numero`, `update_at`) VALUES
(1, '2019-11-16 00:00:00.000000', '1', NULL),
(2, '2019-11-16 00:00:00.000000', '2', NULL),
(3, '2019-11-16 00:00:00.000000', '3', NULL),
(4, '2019-11-16 00:00:00.000000', '4', NULL),
(5, '2019-11-16 00:00:00.000000', '5', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_bienestar`
--

CREATE TABLE `servicio_bienestar` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `create_at` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `servicio_bienestar`
--

INSERT INTO `servicio_bienestar` (`id`, `codigo`, `create_at`, `descripcion`, `nombre`, `update_at`) VALUES
(1, '9290', '2019-11-16', 'nadar', 'natacion', NULL),
(2, '9117', '2019-11-16', 'volear', 'voleibol', NULL),
(3, '9119', '2019-11-16', 'basquear', 'baloncesto', NULL),
(4, '9116', '2019-11-16', 'futbear', 'futboll', NULL),
(5, '9088', '2019-11-16', 'cinear', 'cineclub', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `create_at` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_programa` bigint(20) DEFAULT NULL,
  `id_rol` bigint(20) DEFAULT NULL,
  `id_semestre` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `codigo`, `create_at`, `email`, `nombres`, `password`, `telefono`, `update_at`, `username`, `id_programa`, `id_rol`, `id_semestre`) VALUES
(1, '16132061', '2019-11-16', 'viviana@', 'viviana patiño', '12345', '3209418452', NULL, '16132061', 1, 1, 2),
(2, '16132015', '2019-11-16', 'yeim@', 'yeimy moreno', '1234', '320162152', NULL, '16132015', 1, 1, 5),
(3, '16132216', '2019-11-16', 'daya@', 'dayana medina', '1234', '3134521620', NULL, '16132216', 2, 1, 2),
(4, '16132243', '2019-11-16', 'luis@', 'luis jaimes', '1234', '318552401', NULL, '16132243', 4, 1, 5),
(5, '17165201', '2019-11-16', 'elkin@', 'elkin peñaranda', '1234', '3120154151', NULL, '17165201', 1, 2, 1),
(9, '1613224333', '2019-11-16', 'luisalbertoj2.tober@gmail.com', 'luis jaimes mercado', '123', '3188729934', '2019-11-16 21:01:54.000000', 'luisalbertoj', 1, 1, 1),
(11, '1.6132091E7', '2019-11-18', 'perez@mail.com', 'perez juan', '123.0', '3.1887229934E10', '2019-11-18 02:50:38.000000', 'perez', 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK27o1bnaldpgbjvm9mj7ovpgqy` (`id_servicio_bienestar`),
  ADD KEY `FKmxli23rsrjsonvcwcyuqtiy32` (`id_usuario`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa8ticw0h1kd0mux1qxx5y5uv4` (`id_encuesta`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `FKhb9egu3cgh3ovf03sk34h3ypy` (`id_contenido`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_43kr6s7bts1wqfv43f7jd87kp` (`nombre`);

--
-- Indices de la tabla `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_a6hkoesljln7ftpiplxmidchl` (`numero`);

--
-- Indices de la tabla `servicio_bienestar`
--
ALTER TABLE `servicio_bienestar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_kptxny7y8l4m7nqpe8qeja073` (`codigo`),
  ADD UNIQUE KEY `UK_6lvlxehomwo7ym25vr5yh704v` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_osc6lskg34pth4l3fpf86rnry` (`codigo`),
  ADD UNIQUE KEY `UK_kfsp0s1tflm1cwlj8idhqsad0` (`email`),
  ADD KEY `FKjnyt2lubys8kvvelrh57p3f1k` (`id_programa`),
  ADD KEY `FK5ubh1vhgk6g42j7twprjlvmpu` (`id_rol`),
  ADD KEY `FKieb4enb247giefrbmwbp9rhrb` (`id_semestre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contenido`
--
ALTER TABLE `contenido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `semestres`
--
ALTER TABLE `semestres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicio_bienestar`
--
ALTER TABLE `servicio_bienestar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD CONSTRAINT `FK27o1bnaldpgbjvm9mj7ovpgqy` FOREIGN KEY (`id_servicio_bienestar`) REFERENCES `servicio_bienestar` (`id`),
  ADD CONSTRAINT `FKmxli23rsrjsonvcwcyuqtiy32` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `FKa8ticw0h1kd0mux1qxx5y5uv4` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `FKhb9egu3cgh3ovf03sk34h3ypy` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id`),
  ADD CONSTRAINT `FKhpdeptdk3p3fu5l3i57h9bhn7` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK5ubh1vhgk6g42j7twprjlvmpu` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `FKieb4enb247giefrbmwbp9rhrb` FOREIGN KEY (`id_semestre`) REFERENCES `semestres` (`id`),
  ADD CONSTRAINT `FKjnyt2lubys8kvvelrh57p3f1k` FOREIGN KEY (`id_programa`) REFERENCES `programas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
