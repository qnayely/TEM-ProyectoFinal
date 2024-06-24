-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 05:32:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_conocimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `nombre_actividad` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id_est` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `id_grado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_est`, `nombres`, `apellidos`, `edad`, `id_grado`) VALUES
(15, 'Ricardo', 'Paredes Tapia', 9, 5),
(16, 'Rodri', 'Perez', 10, 4),
(17, 'Patricio', 'Esponja', 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id_grado` int(11) NOT NULL,
  `detalle_grado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id_grado`, `detalle_grado`) VALUES
(1, 'primero'),
(2, 'segundo'),
(3, 'tercero'),
(4, 'cuarto'),
(5, 'quinto'),
(6, 'sexto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_materias`
--

CREATE TABLE `grados_materias` (
  `id_grados_materias` int(11) NOT NULL,
  `id_grado` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `año_publicacion` int(11) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `paginas` int(11) NOT NULL,
  `id_materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `detalle_materia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `detalle_materia`) VALUES
(1, 'Matemáticas'),
(2, 'Lenguaje'),
(3, 'Ciencias Sociales'),
(4, 'Artes Plasticas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `id_tema` int(11) NOT NULL,
  `detalle_tema` varchar(255) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`id_tema`, `detalle_tema`, `id_materia`, `id_grado`) VALUES
(1, 'Números y conteo', 1, 1),
(2, 'Sumas y restas básicas', 1, 1),
(3, 'Formas y figuras geométricas', 1, 1),
(4, 'Patrones y secuencias', 1, 1),
(5, 'Medidas de longitud y tiempo', 1, 1),
(6, 'Adición y sustracción', 1, 2),
(7, 'Multiplicación básica', 1, 2),
(8, 'Números pares e impares', 1, 2),
(9, 'Introducción a las fracciones', 1, 2),
(10, 'Conceptos de dinero (monedas y billetes)', 1, 2),
(11, 'Multiplicación y división', 1, 3),
(12, 'Fracciones equivalentes', 1, 3),
(13, 'Geometría: perímetro y área', 1, 3),
(14, 'Gráficos y tablas', 1, 3),
(15, 'Resolución de problemas', 1, 3),
(16, 'Números decimales', 1, 4),
(17, 'Operaciones con fracciones', 1, 4),
(18, 'Números primos y compuestos', 1, 4),
(19, 'Medidas de volumen y masa', 1, 4),
(20, 'Probabilidad y estadística básica', 1, 4),
(21, 'Multiplicación y división de fracciones', 1, 5),
(22, 'Operaciones con números decimales', 1, 5),
(23, 'Geometría: ángulos y figuras complejas', 1, 5),
(24, 'Razones y proporciones', 1, 5),
(25, 'Gráficos avanzados', 1, 5),
(26, 'Álgebra básica', 1, 6),
(27, 'Ecuaciones y desigualdades', 1, 6),
(28, 'Geometría tridimensional', 1, 6),
(29, 'Análisis de datos', 1, 6),
(30, 'Funciones y relaciones', 1, 6),
(31, 'Reconocimiento de letras y sonidos', 2, 1),
(32, 'Formación de palabras y oraciones', 2, 1),
(33, 'Comprensión de lectura básica', 2, 1),
(34, 'Escritura de oraciones simples', 2, 1),
(35, 'Vocabulario cotidiano', 2, 1),
(36, 'Lectura de cuentos y fábulas', 2, 2),
(37, 'Descripción de personajes y lugares', 2, 2),
(38, 'Redacción de párrafos cortos', 2, 2),
(39, 'Uso de signos de puntuación', 2, 2),
(40, 'Ampliación de vocabulario', 2, 2),
(41, 'Comprensión de textos informativos', 2, 3),
(42, 'Estructura de historias (inicio, nudo, desenlace)', 2, 3),
(43, 'Escritura de cuentos cortos', 2, 3),
(44, 'Sinónimos y antónimos', 2, 3),
(45, 'Expresión oral (presentaciones)', 2, 3),
(46, 'Lectura crítica y análisis de textos', 2, 4),
(47, 'Escritura de textos descriptivos', 2, 4),
(48, 'Uso correcto de tiempos verbales', 2, 4),
(49, 'Introducción a la poesía', 2, 4),
(50, 'Redacción de cartas y correos electrónicos', 2, 4),
(51, 'Lectura de novelas juveniles', 2, 5),
(52, 'Escritura de ensayos breves', 2, 5),
(53, 'Análisis de personajes y tramas', 2, 5),
(54, 'Recursos literarios (metáforas, símiles)', 2, 5),
(55, 'Debate y argumentación oral', 2, 5),
(56, 'Comprensión y análisis de textos complejos', 2, 6),
(57, 'Escritura de informes y proyectos', 2, 6),
(58, 'Análisis de diferentes géneros literarios', 2, 6),
(59, 'Redacción de artículos y reseñas', 2, 6),
(60, 'Oratoria y discurso público', 2, 6),
(61, 'Comunidad y vecindario', 3, 1),
(62, 'Miembros de la familia', 3, 1),
(63, 'Identificación de lugares en el mapa', 3, 1),
(64, 'Profesiones y roles', 3, 1),
(65, 'Cultura y tradiciones locales', 3, 1),
(66, 'Historia local y nacional', 3, 2),
(67, 'Importancia de las reglas y leyes', 3, 2),
(68, 'Tipos de viviendas y comunidades', 3, 2),
(69, 'Símbolos nacionales', 3, 2),
(70, 'Celebraciones y festividades', 3, 2),
(71, 'Mapas y globos terráqueos', 3, 3),
(72, 'Importancia de la agricultura', 3, 3),
(73, 'Transporte y comunicación', 3, 3),
(74, 'Gobierno y líderes comunitarios', 3, 3),
(75, 'Historia de los pueblos indígenas', 3, 3),
(76, 'Exploración y colonización', 3, 4),
(77, 'Regiones geográficas', 3, 4),
(78, 'Economía básica (comercio, recursos)', 3, 4),
(79, 'Derechos y responsabilidades', 3, 4),
(80, 'Culturas del mundo', 3, 4),
(81, 'Revoluciones y cambios sociales', 3, 5),
(82, 'Historia antigua y civilizaciones', 3, 5),
(83, 'Sistemas de gobierno', 3, 5),
(84, 'Globalización y tecnología', 3, 5),
(85, 'Problemas sociales actuales', 3, 5),
(86, 'Historia moderna y contemporánea', 3, 6),
(87, 'Geopolítica y relaciones internacionales', 3, 6),
(88, 'Economía global', 3, 6),
(89, 'Derechos humanos', 3, 6),
(90, 'Ecología y sostenibilidad', 3, 6),
(91, 'Colores primarios y secundarios', 4, 1),
(92, 'Dibujo de formas básicas', 4, 1),
(93, 'Uso de diferentes materiales (crayones, acuarelas)', 4, 1),
(94, 'Creación de collage', 4, 1),
(95, 'Modelado con plastilina', 4, 1),
(96, 'Mezcla de colores', 4, 2),
(97, 'Técnicas básicas de pintura', 4, 2),
(98, 'Escultura con arcilla', 4, 2),
(99, 'Creación de murales', 4, 2),
(100, 'Introducción a la fotografía', 4, 2),
(101, 'Dibujo de paisajes y retratos', 4, 3),
(102, 'Técnicas avanzadas de collage', 4, 3),
(103, 'Uso de textiles y tejidos', 4, 3),
(104, 'Pintura acrílica y óleo', 4, 3),
(105, 'Estudio de artistas famosos', 4, 3),
(106, 'Diseño gráfico básico', 4, 4),
(107, 'Técnicas de grabado', 4, 4),
(108, 'Creación de máscaras y disfraces', 4, 4),
(109, 'Introducción al arte digital', 4, 4),
(110, 'Historia del arte', 4, 4),
(111, 'Técnicas de acuarela avanzadas', 4, 5),
(112, 'Escultura con materiales reciclados', 4, 5),
(113, 'Fotografía artística', 4, 5),
(114, 'Creación de cómics', 4, 5),
(115, 'Arte y cultura contemporánea', 4, 5),
(116, 'Proyectos de arte colaborativos', 4, 6),
(117, 'Instalaciones artísticas', 4, 6),
(118, 'Diseño de productos', 4, 6),
(119, 'Animación básica', 4, 6),
(120, 'Arte como medio de expresión social', 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_est` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `password`, `id_est`) VALUES
(1, 'admin@gmail.com', '12345', NULL),
(13, 'rick@gmail.com', '12345', 15),
(14, 'ar@gmail.com', '1234', 16),
(15, 'patr@gmail.com', '12345', 17);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_est` (`id_est`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id_est`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `grados_materias`
--
ALTER TABLE `grados_materias`
  ADD PRIMARY KEY (`id_grados_materias`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_est` (`id_est`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id_est` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grados_materias`
--
ALTER TABLE `grados_materias`
  MODIFY `id_grados_materias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `actividades_ibfk_2` FOREIGN KEY (`id_est`) REFERENCES `estudiantes` (`id_est`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`);

--
-- Filtros para la tabla `grados_materias`
--
ALTER TABLE `grados_materias`
  ADD CONSTRAINT `grados_materias_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`),
  ADD CONSTRAINT `grados_materias_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);

--
-- Filtros para la tabla `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `temas_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_est`) REFERENCES `estudiantes` (`id_est`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
