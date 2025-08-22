--
-- Base de datos: `webs-app`
--
CREATE DATABASE IF NOT EXISTS `webs-app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webs-app`;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `usuarios`
--
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','cliente') DEFAULT 'admin',
  `creado_en` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `creado_en`) VALUES
(1, 'Nacho', 'nacho@nacho.es', '$2y$10$StaRiv9O46icMUXixkW20Ogn04EPA8rK3VP7Zvn6XeRt7bicLQmse', 'admin', '2025-07-30 13:23:02');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `clientes`
--
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cif` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp(),
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  KEY `fk_clientes_usuario` (`usuario_id`),
  CONSTRAINT `fk_clientes_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `clientes` (`id`, `usuario_id`, `nombre`, `cif`, `direccion`, `email`, `telefono`, `creado_en`, `activo`, `estado`) VALUES
(1, 1, 'Daniel Cuenca Moya', '48334490J', 'Calle Rotterdam 9', 'dani@dani.es', '613026600', '2025-07-30 13:24:59', 1, 'activo'),
(2, 1, 'Yaiza Sánchez Martínez', '48337884A', 'Avenida Rei Jaume I 27 3J', 'yaiza@yaiza.es', '613026600', '2025-07-30 14:59:07', 1, 'activo'),
(3, 1, 'Álvaro Cussac Velasco', 'B43711495', 'Ruzafa 1', 'alvaro@alvaro.es', '661456325', '2025-07-30 18:01:56', 1, 'activo');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `landings`
--
CREATE TABLE `landings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `slug` varchar(128) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `quien_somos` text DEFAULT NULL,
  `servicios` text DEFAULT NULL,
  `preguntas_frecuentes` text DEFAULT NULL,
  `direccion_mapa` text DEFAULT NULL,
  `formulario_contacto` text DEFAULT NULL,
  `fecha_creado` datetime DEFAULT current_timestamp(),
  `fecha_actualizado` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logo_url` varchar(255) DEFAULT NULL,
  `color_primario` varchar(7) DEFAULT '#007bff',
  `color_texto` varchar(7) DEFAULT '#000000',
  `fuente_personalizada` varchar(100) DEFAULT 'Roboto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_landings_slug` (`slug`),
  KEY `idx_landings_cliente` (`cliente_id`),
  CONSTRAINT `landings_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `landings` (`id`, `cliente_id`, `slug`, `titulo`, `descripcion`, `quien_somos`, `servicios`, `preguntas_frecuentes`, `direccion_mapa`, `formulario_contacto`, `fecha_creado`, `fecha_actualizado`, `logo_url`, `color_primario`, `color_texto`, `fuente_personalizada`) VALUES
(1, 2, 'gestiones-laborales', 'Gestiones Laborales', 'Asesoramiento laboral y fiscal a empresas y autónomos.', NULL, NULL, NULL, NULL, NULL, '2025-07-30 17:29:26', '2025-07-30 18:44:41', 'https://gestioneslaborales.es/wp-content/uploads/2024/05/GESTIONES-LABORALES-1.png', '#bf9ca1', '#000000', 'Roboto'),
(2, 3, 'tuswebs', 'TUSWEBS - Tu web lista en 48h', 'Diseñamos páginas web profesionales para tu negocio.', NULL, NULL, NULL, NULL, NULL, '2025-07-30 18:03:31', '2025-07-30 18:30:16', 'https://gestioneslaborales.es/wp-content/uploads/2024/05/GESTIONES-LABORALES-1.png', '#b99898', '#000000', 'Roboto');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `dominios`
--
CREATE TABLE `dominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `landing_id` int(11) NOT NULL,
  `host` varchar(191) NOT NULL UNIQUE,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `landing_id` (`landing_id`),
  CONSTRAINT `dominios_ibfk_1` FOREIGN KEY (`landing_id`) REFERENCES `landings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- AUTO_INCREMENT de las tablas volcadas
--
ALTER TABLE `clientes` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `landings` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `usuarios` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
