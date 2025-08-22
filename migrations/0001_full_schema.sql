/* =========================================================
   MIGRATION 0001 — FULL SCHEMA + DATOS (dump original) + EXTRAS APP-WEBS
   ========================================================= */

/* =========================================================
   A) DUMP ORIGINAL (tal cual me pasaste: tus-webs.sql)
   ========================================================= */
--
-- Base de datos: `tus-webs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cif` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estado` enum('activo','inactivo') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `titulo` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `quienes_somos` text COLLATE utf8mb4_general_ci,
  `mapa` text COLLATE utf8mb4_general_ci,
  `faq` text COLLATE utf8mb4_general_ci,
  `contacto` text COLLATE utf8mb4_general_ci,
  `color_primario` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color_secundario` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landings`
--

CREATE TABLE `landings` (
  `id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `titulo` varchar(128) DEFAULT '',
  `descripcion` text,
  `hero_color_titulo` varchar(7) DEFAULT NULL,
  `hero_color_texto` varchar(7) DEFAULT NULL,
  `hero_color_fondo` varchar(7) DEFAULT NULL,
  `hero_imagen_fondo` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `whatsapp_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `cta_texto` varchar(128) DEFAULT NULL,
  `cta_url` varchar(255) DEFAULT NULL,
  `servicios` varchar(128) DEFAULT '',
  `servicios_color_titulo` varchar(7) DEFAULT NULL,
  `servicios_color_texto` varchar(7) DEFAULT NULL,
  `servicios_color_fondo` varchar(7) DEFAULT NULL,
  `servicios_imagen_fondo` varchar(255) DEFAULT NULL,
  `testimonios_titulo` varchar(128) DEFAULT NULL,
  `testimonios_descripcion` text,
  `testimonios_color_titulo` varchar(7) DEFAULT NULL,
  `testimonios_color_texto` varchar(7) DEFAULT NULL,
  `testimonios_color_fondo` varchar(7) DEFAULT NULL,
  `testimonios_imagen_fondo` varchar(255) DEFAULT NULL,
  `galeria_titulo` varchar(128) DEFAULT NULL,
  `galeria_descripcion` text,
  `galeria_color_titulo` varchar(7) DEFAULT NULL,
  `galeria_color_texto` varchar(7) DEFAULT NULL,
  `galeria_color_fondo` varchar(7) DEFAULT NULL,
  `galeria_imagen_fondo` varchar(255) DEFAULT NULL,
  `faq_titulo` varchar(128) DEFAULT NULL,
  `faq_descripcion` text,
  `faq_color_titulo` varchar(7) DEFAULT NULL,
  `faq_color_texto` varchar(7) DEFAULT NULL,
  `faq_color_fondo` varchar(7) DEFAULT NULL,
  `faq_imagen_fondo` varchar(255) DEFAULT NULL,
  `faq1_pregunta` varchar(255) DEFAULT NULL,
  `faq1_respuesta` text,
  `faq2_pregunta` varchar(255) DEFAULT NULL,
  `faq2_respuesta` text,
  `faq3_pregunta` varchar(255) DEFAULT NULL,
  `faq3_respuesta` text,
  `faq4_pregunta` varchar(255) DEFAULT NULL,
  `faq4_respuesta` text,
  `faq5_pregunta` varchar(255) DEFAULT NULL,
  `faq5_respuesta` text,
  `faq6_pregunta` varchar(255) DEFAULT NULL,
  `faq6_respuesta` text,
  `faq7_pregunta` varchar(255) DEFAULT NULL,
  `faq7_respuesta` text,
  `direccion_mapa` varchar(128) DEFAULT NULL,
  `mapa_titulo` varchar(128) DEFAULT NULL,
  `mapa_descripcion` text,
  `zona_color_titulo` varchar(7) DEFAULT NULL,
  `zona_color_texto` varchar(7) DEFAULT NULL,
  `zona_color_fondo` varchar(7) DEFAULT NULL,
  `zona_imagen_fondo` varchar(255) DEFAULT NULL,
  `formulario_contacto` text,
  `contacto_titulo` varchar(128) DEFAULT NULL,
  `contacto_descripcion` text,
  `contacto_color_titulo` varchar(7) DEFAULT NULL,
  `contacto_color_texto` varchar(7) DEFAULT NULL,
  `contacto_color_fondo` varchar(7) DEFAULT NULL,
  `contacto_imagen_fondo` varchar(255) DEFAULT NULL,
  `color_primario` varchar(7) DEFAULT '#007bff',
  `color_secundario` varchar(7) DEFAULT NULL,
  `color_titulo` varchar(7) DEFAULT '#222222',
  `color_texto` varchar(7) DEFAULT '#222222',
  `color_fondo` varchar(7) DEFAULT '#f5f8fa',
  `imagen_fondo_url` varchar(255) DEFAULT NULL,
  `fuente_personalizada` varchar(64) DEFAULT 'Roboto',
  `meta_titulo` varchar(128) DEFAULT NULL,
  `meta_descripcion` varchar(255) DEFAULT NULL,
  `analytics_id` varchar(32) DEFAULT NULL,
  `fecha_creado` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizado` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `css_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'moderno.css'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('admin','cliente') COLLATE utf8mb4_general_ci DEFAULT 'admin',
  `creado_en` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `usuario_id`, `nombre`, `cif`, `direccion`, `email`, `telefono`, `creado_en`, `activo`, `estado`) VALUES
(1, 1, 'Daniel Cuenca Moya', '48334490J', 'Calle Rotterdam 9', 'dani@dani.es', '613026600', '2025-07-30 13:24:59', 1, 'activo'),
(2, 1, 'Yaiza Sánchez Martínez', '48337884A', 'Avenida Rei Jaume I 27 3J', 'yaiza@yaiza.es', '613026600', '2025-07-30 14:59:07', 1, 'activo'),
(3, 1, 'Álvaro Cussac Velasco', 'B43711495', 'Ruzafa 1', 'alvaro@alvaro.es', '661456325', '2025-07-30 18:01:56', 1, 'activo'),
(4, 1, 'Marta Navarro', 'B43711495', 'Gardenias 3', 'marta@marta.es', '661456325', '2025-07-30 18:01:56', 1, 'activo');

--
-- Volcado de datos para la tabla `landings`
--

INSERT INTO `landings` (`id`, `cliente_id`, `titulo`, `descripcion`, `hero_color_titulo`, `hero_color_texto`, `hero_color_fondo`, `hero_imagen_fondo`, `logo_url`, `banner_url`, `video_url`, `facebook_url`, `instagram_url`, `whatsapp_url`, `linkedin_url`, `cta_texto`, `cta_url`, `servicios`, `servicios_color_titulo`, `servicios_color_texto`, `servicios_color_fondo`, `servicios_imagen_fondo`, `testimonios_titulo`, `testimonios_descripcion`, `testimonios_color_titulo`, `testimonios_color_texto`, `testimonios_color_fondo`, `testimonios_imagen_fondo`, `galeria_titulo`, `galeria_descripcion`, `galeria_color_titulo`, `galeria_color_texto`, `galeria_color_fondo`, `galeria_imagen_fondo`, `faq_titulo`, `faq_descripcion`, `faq_color_titulo`, `faq_color_texto`, `faq_color_fondo`, `faq_imagen_fondo`, `faq1_pregunta`, `faq1_respuesta`, `faq2_pregunta`, `faq2_respuesta`, `faq3_pregunta`, `faq3_respuesta`, `faq4_pregunta`, `faq4_respuesta`, `faq5_pregunta`, `faq5_respuesta`, `faq6_pregunta`, `faq6_respuesta`, `faq7_pregunta`, `faq7_respuesta`, `direccion_mapa`, `mapa_titulo`, `mapa_descripcion`, `zona_color_titulo`, `zona_color_texto`, `zona_color_fondo`, `zona_imagen_fondo`, `formulario_contacto`, `contacto_titulo`, `contacto_descripcion`, `contacto_color_titulo`, `contacto_color_texto`, `contacto_color_fondo`, `contacto_imagen_fondo`, `color_primario`, `color_secundario`, `color_titulo`, `color_texto`, `color_fondo`, `imagen_fondo_url`, `fuente_personalizada`, `meta_titulo`, `meta_descripcion`, `analytics_id`, `fecha_creado`, `fecha_actualizado`, `css_file`) VALUES
(1, 1, 'Landing ejemplo', 'Descripción...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Solicitar', '#', 'Servicio1,Servicio2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#007bff', NULL, '#222222', '#222222', '#f5f8fa', NULL, 'Roboto', NULL, NULL, NULL, '2025-07-30 13:24:59', '2025-07-30 13:24:59', 'moderno.css');

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `creado_en`) VALUES
(1, 'Nacho', 'nacho@nacho.es', '$2y$10$StaRiv9O46icMUXixkW20Ogn04EPA8rK3VP7Zvn6XeRt7bicLQmse', 'admin', '2025-07-30 13:23:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_usuario` (`usuario_id`);

--
-- Indices de la tabla `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `landings`
--
ALTER TABLE `landings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `landings`
--
ALTER TABLE `landings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `landings`
--
ALTER TABLE `landings`
  ADD CONSTRAINT `fk_landings_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD CONSTRAINT `fk_landing_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/* ============================== FIN DUMP ORIGINAL ============================== */

/* =========================================================
   B) EXTRAS APP-WEBS (seguras y idempotentes)
   ========================================================= */

-- 1) Tabla DOMINIOS (render por host)
CREATE TABLE IF NOT EXISTS `dominios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `landing_id` INT NOT NULL,
  `host` VARCHAR(191) NOT NULL UNIQUE,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  `creado_en` DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_dominios_landing` FOREIGN KEY (`landing_id`) REFERENCES `landings`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2) Slug en LANDINGS (para /w?s=slug)
ALTER TABLE `landings`
  ADD COLUMN IF NOT EXISTS `slug` VARCHAR(128) NULL UNIQUE AFTER `cliente_id`;

-- 3) Índices útiles
CREATE INDEX IF NOT EXISTS `idx_landings_cliente` ON `landings`(`cliente_id`);
CREATE INDEX IF NOT EXISTS `idx_landings_slug` ON `landings`(`slug`);

-- (Opcional) Copiar de landing_pages → landings si hiciera falta
-- INSERT INTO landings (cliente_id, slug, titulo, descripcion, fecha_creado, fecha_actualizado)
-- SELECT cliente_id, NULL, titulo, descripcion, NOW(), NOW() FROM landing_pages;

-- (Opcional) Eliminar tabla legacy
-- DROP TABLE IF EXISTS `landing_pages`;

/* =============================== FIN MIGRATION 0001 =============================== */
