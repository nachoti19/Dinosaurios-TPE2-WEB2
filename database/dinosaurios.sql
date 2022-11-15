-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2022 a las 00:50:31
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dinosaurios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dinos`
--

CREATE TABLE `dinos` (
  `id_dinosaurio` int(11) NOT NULL,
  `nombre_cientifico` varchar(45) NOT NULL,
  `altura` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `alimentacion` varchar(45) NOT NULL,
  `anios_vivos` int(11) NOT NULL,
  `id_habitat_fk` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `Imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dinos`
--

INSERT INTO `dinos` (`id_dinosaurio`, `nombre_cientifico`, `altura`, `peso`, `alimentacion`, `anios_vivos`, `id_habitat_fk`, `descripcion`, `Imagen`) VALUES
(41, 'Edmontosaurio', 130, 8000, 'herviboro', 73, 1, 'Edmontosaurus (\"lagarto de Edmonton\") es un género extinto conocido de dinosaurio ornitópodo hadrosáurido. Contiene dos especies conocidas: Edmontosaurus regalis y Edmontosaurus annectens. Se han encontrado fósiles de E. regalis en rocas del oeste de América del Norte que datan de fines del Campaniense hace 73 millones de años, mientras que las de E. annectens se encontraron en la misma región geográfica, pero en rocas que datan de finales del Maastrichtiense, hace 66 millones de años. Edmontosaurus fue uno de los últimos dinosaurios no aviares, y vivió junto a dinosaurios como Triceratops, Tyrannosaurus y Pachycephalosaurus poco antes de la extinción masiva del Cretácico-Paleógeno.', 'img/634cce349af403.09611850.jpg'),
(42, 'Triceratops', 300, 5000, 'herviboro', 65, 1, 'El Triceratops es un género con dos especies conocidas de dinosaurios ceratopsianos ceratópsidos, que vivieron a finales del período Cretácico, hace aproximadamente entre 68 y 66 millones de años, durante el Maastrichtiense, en lo que hoy es Norteamérica. Su nombre de lo castellaniza como el tricerátops. Es uno de los últimos géneros en aparecer antes del gran evento de extinción masiva del Cretácico-Terciario.​ Poseía una gran gola ósea que le cubria dorsal y lateral del cuello y tres cuernos, un cuerpo grande sobre cuatro fornidas patas, y varias similitudes con respecto al moderno rinoceronte y los bovinos. Triceratops es uno de los más reconocidos de todos los dinosaurios. También fue uno de los más grandes, de hasta 8 a 9 metros de largo y de 5 a 9 toneladas métricas de masa corporal. Aunque compartiera el territorio con el temible Tyrannosaurus y fuera cazado por él,​ no está claro si los dos lucharon de la manera representada a menudo en exhibiciones de museo o en imágenes populares.', 'img/634ccf1c333df0.08940646.jpg'),
(43, 'Hadrosaurio', 300, 3000, 'herviboro', 80, 1, 'Hadrosaurus foulkii (gr. \"lagarto robusto de Foulke\"​) es la única especie conocida del género extinto Hadrosaurus de dinosaurio ornitópodo hadrosáurido, que vivió a finales del período Cretácico, hace aproximadamente entre 80,5 a 78,5 millones de años, en el Campaniense, en lo que hoy es Norteamérica. En 1858, un esqueleto de un dinosaurio de este género fue el primer dinosaurio conocido por algo más que dientes aislados que se encontraron en Norteamérica. En 1868, se convirtió en el primer esqueleto montado de un dinosaurio. El Hadrosaurus foulkii es la única especie de este género y ha sido el dinosaurio oficial del estado de Nueva Jersey desde 1991.', 'img/634ccfa3a3b911.78604109.jpg'),
(44, 'Edmontonia', 200, 3000, 'herviboro', 83, 3, 'Edmontonia (\"de Edmonton\") es un género representado por dos o tres especies según el autor, de dinosaurios tireóforos nodosáuridos, que vivió a finales del período Cretácico, hace aproximadamente 83 y 65 millones de años, en el Campaniense y el Maastrichtiense, en lo que hoy es Norteamérica. Las especies son Edmontonia longiceps, la especie tipo, Edmontonia rugosidens y una tercera, a veces incluida en Glyptodontopelta mimus, Edmontonia australis.', 'img/634cda11a1cf29.66805370.jpg'),
(45, 'Stegoceras', 150, 40, 'herviboro', 78, 3, 'Stegoceras es un género de dinosaurios marginocéfalos paquicefalosáuridos, que vivieron a finales del período Cretácico, hace aproximadamente ente 78 a 74 millones de años, durante el Campaniense, en lo que hoy es Norteamérica. Tiene dos especies conocidas. Los primeros restos se encontraron en 1902 en Alberta, Canadá, y la descripción de la especie tipo Stegoceras validum se basó en ellos.​ Varias especies se han atribuido al género a lo largo de los años, pero se han trasladado a otros géneros o se han considerado sinónimos menores. Actualmente sólo cuenta con la especie tipo y Stegoceras novomexicanum, nombrado en 2011 a partir de fósiles encontrados en Nuevo México.', 'img/634cdb07584e76.29067395.jpg'),
(46, 'Spinosaurus', 500, 7000, 'carnivoro', 99, 8, 'Spinosaurus aegyptiacus es la única especie conocida del género extinto Spinosaurus (gr. «lagarto de espina») de dinosaurio terópodo espinosáurido, que vivió a mediados del período Cretácico, hace aproximadamente 99 a 93,5 millones de años, desde el Cenomaniense hasta el Turoniense, en lo que es ahora África.', 'img/634cdc3d87b0a0.69637699.png'),
(47, 'Lambeosaurio', 400, 3000, 'herviboro', 76, 8, 'Lambeosaurus (\"lagarto de Lambe\") es un género con 2 especies válidas y posiblemente otra más dudosa conocidas de dinosaurios ornitisquios hadrosáuridos, que vivieron a finales del período Cretácico, hace aproximadamente 76 y 75 millones de años, en el Campaniense, en lo que hoy es Norteamérica. Este herbívoro que caminaba en posición cuadrúpeda, pero que podía erguirse en sus dos patas traseras es conocido por su cresta distintiva, en forma de hacha, cresta hueca. Varias especies posibles han sido nombradas a partir de restos de Alberta, Canadá, Montana, EE. UU., y Baja California, México, pero solamente las dos canadienses se reconocen como válidas.', 'img/634cdd1d029ca6.50135724.jpg'),
(48, 'Corythosaurus', 200, 5000, 'herviboro', 77, 9, 'Corythosaurus (gr. \"lagarto con casco\") es un género representado por dos especies de dinosaurios ornitopodos hadrosáuridos, que vivieron a finales del período Cretácico, hace aproximadamente entre 77 a 75,7 millones de años, en el Campaniense, en lo que hoy es Norteamérica. Corythosaurus es clasificado como un hadrosáurido, en la subfamilias Lambeosaurinae. Estando relacionado con otros hadrosáuridos como Hypacrosaurus, Lambeosaurus y Olorotitan. Con excepción de Olorotitan todos comparten los cráneos y las crestas similares. Sin embargo, la investigación reciente ha sugerido que Olorotitan es un pariente cercano de Corythosaurus, aun sin compartir la forma de la cresta.', 'img/634cde22990fe6.36414967.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitats`
--

CREATE TABLE `habitats` (
  `id_habitat` int(11) NOT NULL,
  `continente` varchar(45) NOT NULL,
  `bioma` varchar(45) NOT NULL,
  `temperatura` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habitats`
--

INSERT INTO `habitats` (`id_habitat`, `continente`, `bioma`, `temperatura`) VALUES
(1, 'Norte America', 'Llanuras deserticas', 10),
(3, 'America', 'Montañas', 6),
(8, 'Norte de Africa', 'Pantanos', 12),
(9, 'America del sur', 'Bosques', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`) VALUES
(1, 'nacho@facultad.com', '$2y$10$hS5xQBhB6o5FD3qFyY5IsuEfdC.IKA8X0EPJyexxMhjZ/RW4gDhWS'),
(2, 'profesor@facultad.com', '$2y$10$IBnzyDNJemwL62GpGxN0TOPkWRPJeUU.ZGBLtvCTzvUpGlhtbXi32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dinos`
--
ALTER TABLE `dinos`
  ADD PRIMARY KEY (`id_dinosaurio`),
  ADD KEY `id_habitat_fk` (`id_habitat_fk`);

--
-- Indices de la tabla `habitats`
--
ALTER TABLE `habitats`
  ADD PRIMARY KEY (`id_habitat`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dinos`
--
ALTER TABLE `dinos`
  MODIFY `id_dinosaurio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `habitats`
--
ALTER TABLE `habitats`
  MODIFY `id_habitat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dinos`
--
ALTER TABLE `dinos`
  ADD CONSTRAINT `dinos_ibfk_1` FOREIGN KEY (`id_habitat_fk`) REFERENCES `habitats` (`id_habitat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
