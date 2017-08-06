-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Ago-2017 às 23:23
-- Versão do servidor: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_klima`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `id` bigint(20) NOT NULL,
  `anoAtual` varchar(255) DEFAULT NULL,
  `anoEntrada` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `situacaoAtual` varchar(255) DEFAULT NULL,
  `unidadeFederativa` varchar(255) DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL,
  `centro_id` bigint(20) DEFAULT NULL,
  `curso_id` bigint(20) DEFAULT NULL,
  `anoSaida` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`id`, `anoAtual`, `anoEntrada`, `bairro`, `cep`, `cidade`, `latitude`, `longitude`, `nome`, `numero`, `rua`, `situacaoAtual`, `unidadeFederativa`, `campus_id`, `centro_id`, `curso_id`, `anoSaida`) VALUES
(246, '1', '2014', 'centro', '85850000', 'foz do iguaçu', NULL, NULL, 'Kiayada S. Blake', '1451', 'rua santos dumont', 'Cursando', 'pr', 1, 1, 2, 2015),
(247, '2', '1994', 'centro', '85870650', 'foz do iguaçu', -25.4645627, -54.5715064, 'Gannon X. Rosales', '846', 'rua tarobá', 'Formado', 'pr', 1, 1, 4, 1998),
(248, '3', '1993', 'vila a', '85870900', 'foz do iguaçu', NULL, NULL, 'Amber B. Sheppard', '503', 'avenida anhembi', 'Cancelado Por Abandono', 'pr', 1, 1, 4, 1995),
(249, '5', '2009', 'campos do iguaçu', '17040011', 'foz do iguaçu', NULL, NULL, 'Baxter H. Cleveland', '202', 'alameda paraopeba', 'Formado', 'pr', 1, 1, 3, 2013),
(250, '1', '2009', 'jardim santa maria', '85875000', 'toledo', -25.4479527, -54.4561033, 'Astra P. Leonard', '4485', 'avenida parigot de souza', 'Cursando', 'pr', 1, 1, 4, 2010),
(251, '5', '2003', 'aptent taciti sociosqu', '85851970', 'Fontanigorda', NULL, NULL, 'Jarrod X. Sykes', '1077', 'P.O. Box 818, 4490 Laoreet St.', 'Cancelado', 'LIG', 1, 1, 4, 2000),
(252, '4', '1997', 'Duis dignissim', '85851000', 'Meppel', -25.5440182, -54.586392, 'Xavier N. Kaufman', '1143', 'P.O. Box 259, 7935 Nunc Street', 'Cancelado', 'Drenthe', 1, 1, 3, 2000),
(253, '3', '2006', 'odio tristique', '85863970', 'Topeka', NULL, NULL, 'Josiah K. Potts', '17', 'Ap #747-4460 Vitae St.', 'Cancelado', 'Kansas', 1, 1, 3, 2000),
(254, '5', '2016', 'augue scelerisque mollis.', '85852530', 'Vienna', NULL, NULL, 'Kerry C. Valencia', '161', 'Ap #354-4418 Quam Av.', 'Cancelado Por Abandono', 'Wie', 1, 1, 1, 2000),
(255, '3', '2007', 'et, magna. Praesent', '85850000', 'Benestare', NULL, NULL, 'Colleen A. Noble', '273', 'Ap #137-2920 Praesent Road', 'Cancelado Por Abandono', 'CAL', 1, 1, 3, 2000),
(256, '4', '1986', 'placerat, orci lacus', '85851000', 'Wals-Siezenheim', -25.5440182, -54.586392, 'Ulla X. Hays', '1180', 'P.O. Box 547, 5467 Ante Avenue', 'Cancelado Por Abandono', 'Salzburg', 1, 1, 1, 2000),
(257, '2', '1992', 'porta elit, a feugiat', '85851210', 'Norwich', NULL, NULL, 'Tana R. Livingston', '710', 'Ap #934-1477 A, Ave', 'Cancelado Por Abandono', 'NF', 1, 1, 2, 2000),
(258, '5', '2011', 'egestas,', '85851000', 'Valley East', -25.5440182, -54.586392, 'Brenna J. Faulkner', '855', '184-2316 Dolor Av.', 'Cursando', 'ON', 1, 1, 1, 2000),
(259, '1', '2011', 'lorem, sit amet', '85852000', 'Saint-Denis', -25.535647, -54.5760685, 'Keely Y. Coffey', '383', 'Ap #536-7270 Ut Avenue', 'Cancelado', '×le-de-France', 1, 1, 3, 2000),
(260, '3', '2004', 'Cras vulputate', '85850000', 'Kirkintilloch', NULL, NULL, 'Indira C. Richmond', '1211', 'P.O. Box 278, 8884 Leo. St.', ' Transferido', 'DN', 1, 1, 1, 2000),
(261, '5', '2011', 'porta elit, a', '85867700', 'Gonda', NULL, NULL, 'Inga I. Moon', '476', 'P.O. Box 340, 2396 Tincidunt Av.', 'Cursando', 'UP', 1, 1, 4, 2000),
(262, '5', '1995', 'purus mauris a nunc.', '85850000', 'Carmen', NULL, NULL, 'Thaddeus C. Estes', '1040', '3268 Sem Ave', 'Cancelado', 'Cartago', 1, 1, 2, 2000),
(263, '5', '1995', 'Sed eget lacus. Mauris', '85122000', 'Dandenong', NULL, NULL, 'Stephanie P. Durham', '1102', 'Ap #330-6606 Suspendisse Rd.', ' Transferido', 'Victoria', 1, 1, 2, 2000),
(264, '3', '1997', 'eleifend egestas. Sed pharetra,', '85851000', 'Ancaster Town', -25.5440182, -54.586392, 'Venus K. Willis', '21', 'Ap #666-7548 Semper St.', 'Cancelado', 'ON', 1, 1, 1, 2000),
(265, '1', '2003', 'lobortis', '85851000', 'Paranagu ', -25.5440182, -54.586392, 'Ivana D. Anderson', '279', '2640 Integer Road', ' Transferido', 'PR', 1, 1, 4, 2000),
(266, '2', '2012', 'Nunc mauris. Morbi', '85870070', 'Cessnock', -25.448914, -54.5741654, 'Magee Z. Stevens', '574', '8574 Eros Rd.', 'Cursando', 'NSW', 1, 1, 3, 2000),
(267, '2', '2006', 'primis', '85851000', 'Rockville', -25.5440182, -54.586392, 'Ora S. Garcia', '1206', 'P.O. Box 704, 4615 Augue Av.', 'Cancelado Por Abandono', 'Maryland', 1, 1, 2, 2000),
(268, '2', '1990', 'a, scelerisque sed, sapien.', '85850000', 'Buin', NULL, NULL, 'Zia X. Nielsen', '969', 'P.O. Box 195, 7240 Aenean St.', 'Formado', 'RM', 1, 1, 2, 2000),
(269, '1', '2016', 'Duis cursus, diam at', '85851000', 'Istanbul', -25.5440182, -54.586392, 'Cailin S. Roberson', '1022', 'P.O. Box 770, 2918 Elit. Avenue', 'Cancelado Por Abandono', 'Ist', 1, 1, 4, 2000),
(270, '5', '2003', 'pellentesque eget, dictum placerat,', '85852000', 'Juan Fern ndez', -25.535647, -54.5760685, 'Basil Q. Blake', '539', 'P.O. Box 337, 3842 Nam Rd.', 'Cursando', 'Valpara¡so', 1, 1, 3, 2000),
(271, '3', '2013', 'id nunc', '85851330', 'Petit-Hallet', NULL, NULL, 'Portia J. Sandoval', '1135', 'Ap #102-6326 Rhoncus. Street', 'Formado', 'Luik', 1, 1, 1, 2000),
(272, '2', '2017', 'in faucibus', '85870360', 'RibeirÆo das Neves', NULL, NULL, 'Joan F. Dyer', '590', 'Ap #164-5177 Mauris Ave', 'Cancelado', 'Minas Gerais', 1, 1, 1, 2000),
(273, '4', '2002', 'ac mattis semper, dui', '85851970', 'Lang', NULL, NULL, 'Kylynn B. Reynolds', '840', 'Ap #503-6615 Iaculis, Rd.', 'Cursando', 'Saskatchewan', 1, 1, 3, 2000),
(274, '3', '2001', 'risus quis', '85890500', 'Collines-de-l''Outaouais', NULL, NULL, 'Mari G. Emerson', '525', '540-8221 Sagittis Road', 'Cancelado', 'Quebec', 1, 1, 3, 2000),
(275, '5', '1997', 'egestas ligula. Nullam feugiat', '85864700', 'Hamburg', NULL, NULL, 'Margaret D. Freeman', '670', '989-7592 Orci, Road', 'Cancelado Por Abandono', 'HH', 1, 1, 3, 2000),
(276, '2', '2006', 'massa. Vestibulum accumsan neque', '85862500', 'San Nicol s', NULL, NULL, 'Cameron W. Le', '302', '440-5856 Proin Road', 'Formado', 'Cartago', 1, 1, 2, 2000),
(277, '2', '1994', 'ac urna. Ut tincidunt', '85850000', 'Stuttgart', NULL, NULL, 'Quynn P. Cannon', '1011', '3818 Leo Avenue', 'Cancelado', 'Baden', 1, 1, 3, 2000),
(278, '2', '1986', 'mattis.', '85851000', 'Goes', -25.5440182, -54.586392, 'Noel T. Barr', '1122', '308-1219 Pulvinar Street', 'Cursando', 'Zeeland', 1, 1, 1, 2000),
(279, '1', '2016', 'pede. Cum sociis', '85851000', 'Stamford', -25.5440182, -54.586392, 'Dylan T. Moran', '214', '1292 Class Rd.', 'Formado', 'Connecticut', 1, 1, 4, 2000),
(280, '2', '1988', 'Donec est mauris,', '85851970', 'Vetlanda', NULL, NULL, 'Carly U. Perkins', '889', '471-6212 A, Rd.', 'Cursando', 'F', 1, 1, 1, 2000),
(281, '1', '2018', 'sem mollis dui, in', '85851210', 'Morwell', NULL, NULL, 'Hashim W. Greer', '1187', 'P.O. Box 946, 9454 Nibh Street', 'Cursando', 'VIC', 1, 1, 4, 2000),
(282, '5', '2009', 'litora torquent per conubia', '85851970', 'Sankt Wendel', NULL, NULL, 'Isaac H. Higgins', '729', 'P.O. Box 266, 3511 Ipsum Avenue', 'Cancelado', 'SL', 1, 1, 1, 2000),
(283, '4', '2008', 'elit. Nulla facilisi. Sed', '85850120', 'Poitiers', NULL, NULL, 'Cameran H. Fisher', '739', '3782 Euismod Street', 'Cancelado', 'PO', 1, 1, 4, 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `campus`
--

INSERT INTO `campus` (`id`, `nome`) VALUES
(1, 'Foz do Iguaçu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `centro`
--

CREATE TABLE IF NOT EXISTS `centro` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `centro`
--

INSERT INTO `centro` (`id`, `nome`, `campus_id`) VALUES
(1, 'CECE', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `turno` varchar(255) DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL,
  `centro_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id`, `nome`, `turno`, `campus_id`, `centro_id`) VALUES
(1, 'Ciência da Computação', 'Integral', 1, 1),
(2, 'Matemática', 'Matutino', 1, 1),
(3, 'Engenharia Elétrica', 'Integral', 1, 1),
(4, 'Engenharia Mecânica', 'Integral', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `serie` int(11) NOT NULL,
  `curso_id` bigint(20) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`id`, `nome`, `serie`, `curso_id`, `codigo`) VALUES
(2, 'Cálculo', 1, 4, NULL),
(3, 'Cálculo com Geometria Analítica', 1, 4, NULL),
(4, 'Computação', 1, 4, NULL),
(5, 'Desenho Técnico I', 1, 4, NULL),
(6, 'Desenho Técnico II', 1, 4, NULL),
(7, 'Equaçóes Diferenciais', 1, 4, NULL),
(8, 'Física I', 1, 4, NULL),
(9, 'Física II', 1, 4, NULL),
(10, 'Geometria Analítica e Álgebra Linear', 1, 4, NULL),
(11, 'Geometria Descritiva e Desenho Técnico', 1, 4, NULL),
(12, 'Introdução à Engenharia Mecânica', 1, 4, NULL),
(13, 'Laboratório de Desenho Técnico II', 1, 4, NULL),
(14, 'Laboratório de Física I', 1, 4, NULL),
(15, 'Métodos Numéricos', 1, 4, NULL),
(16, 'Química Geral e Tecnológica', 1, 4, NULL),
(17, 'Química Geral e Tecnológica I', 1, 4, NULL),
(18, 'Química Geral e Tecnológica II', 1, 4, NULL),
(19, 'Álgebra Linear', 2, 4, NULL),
(20, 'Análise Complexa', 2, 4, NULL),
(21, 'Cálculo Vetorial', 2, 4, NULL),
(22, 'Circuitos Eletronicos Aplicados á Engenharia Mecânica', 2, 4, NULL),
(23, 'Equações Diferenciais', 2, 4, NULL),
(24, 'Equações Diferenciais Parciais', 2, 4, NULL),
(25, 'Física II', 2, 4, NULL),
(26, 'Física III', 2, 4, NULL),
(27, 'Física IV', 2, 4, NULL),
(28, 'Laboratório de Física II', 2, 4, NULL),
(29, 'Materiais de Construção Mecânica', 2, 4, NULL),
(30, 'Materiais de Construção Mecânica I', 2, 4, NULL),
(31, 'Mecânica - Estática e Dinâmica', 2, 4, NULL),
(32, 'Mecânica Geral', 2, 4, NULL),
(33, 'Materiais de Construção Mecânica II', 2, 4, NULL),
(34, 'Princípios Eletrotécnicos Gerais', 2, 4, NULL),
(35, 'Probabilidades e Estatística', 2, 4, NULL),
(36, 'Resistência dos Materiais', 2, 4, NULL),
(37, 'Termodinâmica', 2, 4, NULL),
(38, 'Termodinâmica I\r\n', 2, 4, NULL),
(39, 'Termodinâmica II', 2, 4, NULL),
(40, 'Cáculo Numérico', 3, 4, NULL),
(41, 'Ciência, Tecnologia e Sociedade na Engenharia', 3, 4, NULL),
(42, 'Mecânica dos Fluídos I', 3, 4, NULL),
(43, 'Mecânica dos Fluídos II', 3, 4, NULL),
(44, 'Mecânica dos Sólidos', 3, 4, NULL),
(45, 'Mecanismos e Elementos de Máquinas I', 3, 4, NULL),
(46, 'Mecanismos e Elementos de Máquinas II', 3, 4, NULL),
(47, 'Medidas Eletromecânicas I', 3, 4, NULL),
(48, 'Medidas Eletromecânicas II', 3, 4, NULL),
(49, 'Metrologia e Controle de Processos', 3, 4, NULL),
(50, 'Processos de Conformação', 3, 4, NULL),
(51, 'Processos de Fundição', 3, 4, NULL),
(52, 'Processos de Usinagem I', 3, 4, NULL),
(53, 'Processos de Usinagem II', 3, 4, NULL),
(54, 'Transferência de Calor I', 3, 4, NULL),
(55, 'Transferência de Calor II', 3, 4, NULL),
(56, 'Processos de Usinagem', 3, 4, NULL),
(57, 'Análise de Sistemas Dinâmicos e Vibrações', 3, 4, NULL),
(58, 'Circuitos Elétricos e Eletrotécnica para Engenharia Mecânica', 3, 4, NULL),
(59, 'Mecânica dos Fluidos', 3, 4, NULL),
(60, 'Transferência de Calor', 3, 4, NULL),
(61, 'Acionamentos Elétricos', 4, 4, NULL),
(62, 'Confiabilidade', 4, 4, NULL),
(63, 'Engenharia de Segurança', 4, 4, NULL),
(64, 'Experimentos em Sistemas Fluidos Mecânicos', 4, 4, NULL),
(65, 'Fadiga', 4, 4, NULL),
(66, 'Máquinas Térmicas I', 4, 4, NULL),
(67, 'Máquinas de Fluxo I', 4, 4, NULL),
(68, 'Máquinas de Fluxo II', 4, 4, NULL),
(69, 'Marketing Pessoal e Planos de Negócios em Engenharia', 4, 4, NULL),
(70, 'Processos de Soldagem', 4, 4, NULL),
(71, 'Vibrações', 4, 4, NULL),
(72, 'Medidas Eletromecânicas e Metrologia e Controle de Processos', 4, 4, NULL),
(73, 'Processos de Conformação e Fundição', 4, 4, NULL),
(74, 'Mecanismos e Elementos de Máquinas', 4, 4, NULL),
(75, 'Máquinas de Fluxo', 4, 4, NULL),
(76, 'Máquinas Térmicas', 4, 4, NULL),
(77, 'Optativa I', 4, 4, NULL),
(78, 'Optativa II', 4, 4, NULL),
(79, 'Engenharia de Superfícies', 5, 4, NULL),
(80, 'Engenharia: Geração de Idéias e Criatividade', 5, 4, NULL),
(81, 'Estágio', 5, 4, NULL),
(82, 'Experimentos em Sistemas Térmicos', 5, 4, NULL),
(83, 'Máquinas Térmicas II', 5, 4, NULL),
(84, 'Recursos Humanos em Engenharia', 5, 4, NULL),
(85, 'Trabalho de Conclusão de Curso', 5, 4, NULL),
(86, 'Ciência, Tecnologia e Sociedade na Engenharia', 5, 4, NULL),
(87, 'Confiabilidade', 5, 4, NULL),
(88, 'Engenharia de Segurança, Legislação e Ética Profissional', 5, 4, NULL),
(89, 'Engenharia Econômica', 5, 4, NULL),
(90, 'Fadiga', 5, 4, NULL),
(91, 'Marketing Pessoal e Plano de Negócios em Engenharia', 5, 4, NULL),
(92, 'Processos de Soldagem', 5, 4, NULL),
(93, 'Técnicas de Redação e Metodologia Científica', 5, 4, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `formulario`
--

CREATE TABLE IF NOT EXISTS `formulario` (
  `ano` int(11) NOT NULL,
  `numeroAprovacoes` int(11) NOT NULL,
  `numeroReprovacoes` int(11) NOT NULL,
  `disciplina_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `formulario`
--

INSERT INTO `formulario` (`ano`, `numeroAprovacoes`, `numeroReprovacoes`, `disciplina_id`) VALUES
(2008, 21, 33, 2),
(2008, 3, 5, 3),
(2008, 26, 26, 4),
(2008, 0, 2, 5),
(2008, 13, 2, 6),
(2008, 7, 2, 7),
(2008, 44, 33, 8),
(2008, 14, 2, 9),
(2008, 48, 14, 10),
(2008, 45, 6, 11),
(2008, 41, 1, 12),
(2008, 15, 2, 13),
(2008, 55, 14, 14),
(2008, 6, 3, 15),
(2008, 31, 34, 16),
(2008, 19, 33, 17),
(2008, 18, 12, 18),
(2008, 31, 21, 19),
(2008, 39, 29, 20),
(2008, 49, 10, 21),
(2008, 40, 5, 22),
(2008, 6, 0, 23),
(2008, 27, 18, 24),
(2008, 7, 0, 25),
(2008, 27, 6, 26),
(2008, 25, 19, 27),
(2008, 6, 0, 28),
(2008, 1, 0, 29),
(2008, 21, 29, 30),
(2008, 15, 0, 31),
(2008, 47, 12, 32),
(2008, 51, 15, 34),
(2008, 50, 10, 35),
(2008, 41, 23, 36),
(2008, 2, 0, 37),
(2008, 23, 27, 38),
(2008, 43, 37, 39),
(2008, 4, 0, 40),
(2008, 29, 1, 41),
(2008, 20, 14, 42),
(2008, 20, 9, 43),
(2008, 3, 4, 44),
(2008, 16, 19, 45),
(2008, 25, 10, 46),
(2008, 29, 4, 47),
(2008, 24, 4, 48),
(2008, 30, 0, 49),
(2008, 30, 4, 50),
(2008, 34, 2, 51),
(2008, 22, 8, 52),
(2008, 27, 1, 53),
(2008, 28, 1, 54),
(2008, 26, 2, 55),
(2008, 10, 0, 61),
(2008, 13, 1, 62),
(2008, 10, 0, 63),
(2008, 10, 0, 64),
(2008, 11, 2, 65),
(2008, 10, 1, 66),
(2008, 11, 0, 67),
(2008, 10, 3, 68),
(2008, 10, 0, 69),
(2008, 10, 0, 70),
(2008, 12, 1, 71),
(2008, 15, 1, 79),
(2008, 15, 0, 80),
(2008, 15, 2, 81),
(2008, 15, 0, 82),
(2008, 16, 0, 83),
(2008, 16, 0, 84),
(2008, 15, 2, 85),
(2009, 41, 27, 2),
(2009, 0, 3, 3),
(2009, 35, 24, 4),
(2009, 0, 2, 7),
(2009, 35, 31, 8),
(2009, 2, 0, 9),
(2009, 41, 15, 10),
(2009, 33, 17, 11),
(2009, 33, 6, 12),
(2009, 1, 0, 13),
(2009, 42, 11, 14),
(2009, 18, 52, 16),
(2009, 2, 8, 17),
(2009, 1, 9, 18),
(2009, 25, 2, 19),
(2009, 12, 14, 20),
(2009, 45, 13, 21),
(2009, 32, 20, 23),
(2009, 8, 8, 24),
(2009, 25, 14, 25),
(2009, 1, 4, 26),
(2009, 1, 19, 27),
(2009, 46, 10, 28),
(2009, 19, 0, 29),
(2009, 10, 5, 30),
(2009, 17, 25, 31),
(2009, 4, 5, 32),
(2009, 33, 0, 33),
(2009, 44, 20, 35),
(2009, 8, 16, 36),
(2009, 10, 43, 37),
(2009, 2, 17, 38),
(2009, 2, 33, 39),
(2009, 35, 0, 41),
(2009, 48, 1, 42),
(2009, 3, 3, 44),
(2009, 35, 18, 45),
(2009, 25, 22, 46),
(2009, 35, 1, 47),
(2009, 39, 2, 48),
(2009, 32, 5, 49),
(2009, 24, 15, 50),
(2009, 30, 9, 51),
(2009, 43, 0, 52),
(2009, 38, 0, 53),
(2009, 29, 7, 54),
(2009, 27, 12, 55),
(2009, 8, 0, 56),
(2009, 26, 0, 61),
(2009, 27, 0, 62),
(2009, 26, 0, 63),
(2009, 26, 0, 64),
(2009, 15, 13, 65),
(2009, 26, 1, 66),
(2009, 23, 3, 67),
(2009, 29, 0, 68),
(2009, 26, 0, 69),
(2009, 19, 7, 70),
(2009, 20, 7, 71),
(2009, 5, 0, 72),
(2009, 1, 0, 73),
(2009, 11, 0, 79),
(2009, 11, 0, 80),
(2009, 11, 1, 81),
(2009, 11, 0, 82),
(2009, 8, 2, 83),
(2009, 10, 0, 84),
(2009, 12, 0, 85),
(2010, 35, 28, 2),
(2010, 25, 37, 4),
(2010, 28, 37, 8),
(2010, 29, 24, 10),
(2010, 33, 17, 11),
(2010, 38, 2, 12),
(2010, 34, 14, 14),
(2010, 39, 57, 16),
(2010, 3, 0, 17),
(2010, 3, 0, 18),
(2010, 3, 2, 20),
(2010, 25, 20, 21),
(2010, 26, 33, 23),
(2010, 30, 35, 25),
(2010, 8, 1, 27),
(2010, 37, 17, 28),
(2010, 43, 35, 29),
(2010, 3, 1, 30),
(2010, 23, 44, 31),
(2010, 3, 0, 33),
(2010, 2, 0, 34),
(2010, 28, 27, 35),
(2010, 3, 0, 36),
(2010, 40, 46, 37),
(2010, 3, 6, 38),
(2010, 16, 4, 39),
(2010, 25, 3, 40),
(2010, 2, 0, 42),
(2010, 43, 3, 43),
(2010, 19, 32, 44),
(2010, 17, 0, 45),
(2010, 19, 2, 46),
(2010, 5, 4, 51),
(2010, 1, 0, 52),
(2010, 1, 0, 53),
(2010, 6, 1, 54),
(2010, 9, 2, 55),
(2010, 39, 7, 56),
(2010, 15, 9, 57),
(2010, 41, 6, 58),
(2010, 46, 9, 59),
(2010, 35, 16, 60),
(2010, 29, 0, 61),
(2010, 29, 0, 62),
(2010, 29, 0, 63),
(2010, 29, 0, 64),
(2010, 34, 8, 65),
(2010, 30, 0, 66),
(2010, 31, 1, 67),
(2010, 29, 0, 68),
(2010, 28, 0, 69),
(2010, 35, 1, 70),
(2010, 35, 1, 71),
(2010, 1, 0, 73),
(2010, 6, 0, 74),
(2010, 26, 0, 79),
(2010, 26, 0, 80),
(2010, 27, 0, 81),
(2010, 26, 0, 82),
(2010, 28, 0, 83),
(2010, 26, 0, 84),
(2010, 24, 2, 85),
(2011, 14, 25, 2),
(2011, 34, 38, 4),
(2011, 29, 43, 8),
(2011, 36, 17, 11),
(2011, 39, 5, 12),
(2011, 18, 7, 14),
(2011, 6, 38, 16),
(2011, 0, 1, 20),
(2011, 35, 14, 21),
(2011, 27, 30, 23),
(2011, 33, 35, 25),
(2011, 26, 24, 28),
(2011, 48, 23, 29),
(2011, 35, 34, 31),
(2011, 37, 19, 35),
(2011, 46, 34, 37),
(2011, 3, 0, 38),
(2011, 1, 0, 39),
(2011, 29, 3, 40),
(2011, 18, 26, 44),
(2011, 1, 0, 49),
(2011, 9, 0, 50),
(2011, 15, 5, 56),
(2011, 35, 8, 57),
(2011, 22, 10, 58),
(2011, 23, 5, 59),
(2011, 23, 22, 60),
(2011, 1, 0, 61),
(2011, 8, 0, 65),
(2011, 1, 0, 67),
(2011, 1, 0, 69),
(2011, 1, 0, 70),
(2011, 1, 0, 71),
(2011, 52, 1, 72),
(2011, 39, 12, 73),
(2011, 19, 27, 74),
(2011, 31, 21, 75),
(2011, 55, 1, 76),
(2011, 29, 0, 79),
(2011, 29, 0, 80),
(2011, 29, 0, 81),
(2011, 29, 0, 82),
(2011, 29, 0, 83),
(2011, 29, 0, 84),
(2011, 30, 1, 85),
(2012, 20, 54, 2),
(2012, 27, 43, 4),
(2012, 35, 39, 8),
(2012, 36, 18, 10),
(2012, 34, 22, 11),
(2012, 39, 2, 12),
(2012, 38, 18, 14),
(2012, 62, 50, 16),
(2012, 1, 0, 20),
(2012, 17, 24, 21),
(2012, 39, 20, 23),
(2012, 21, 39, 25),
(2012, 34, 19, 28),
(2012, 37, 19, 29),
(2012, 11, 63, 31),
(2012, 26, 27, 35),
(2012, 24, 42, 37),
(2012, 27, 3, 40),
(2012, 38, 28, 44),
(2012, 26, 23, 56),
(2012, 15, 15, 57),
(2012, 19, 8, 58),
(2012, 32, 8, 60),
(2012, 21, 9, 72),
(2012, 33, 2, 73),
(2012, 28, 19, 74),
(2012, 30, 16, 75),
(2012, 25, 9, 76),
(2012, 50, 1, 80),
(2012, 42, 4, 81),
(2012, 33, 14, 85),
(2012, 41, 0, 86),
(2012, 54, 0, 87),
(2012, 53, 1, 88),
(2012, 51, 0, 89),
(2012, 36, 19, 90),
(2012, 53, 0, 91),
(2012, 52, 1, 92),
(2012, 51, 0, 93),
(2013, 62, 21, 2),
(2013, 37, 29, 4),
(2013, 48, 24, 8),
(2013, 41, 18, 10),
(2013, 32, 18, 11),
(2013, 36, 3, 12),
(2013, 24, 23, 14),
(2013, 35, 39, 16),
(2013, 12, 22, 21),
(2013, 26, 11, 23),
(2013, 18, 49, 25),
(2013, 24, 27, 28),
(2013, 29, 23, 29),
(2013, 30, 52, 31),
(2013, 35, 21, 35),
(2013, 25, 41, 37),
(2013, 23, 5, 40),
(2013, 38, 20, 44),
(2013, 38, 15, 56),
(2013, 22, 27, 57),
(2013, 41, 25, 58),
(2013, 49, 18, 59),
(2013, 15, 34, 60),
(2013, 22, 8, 72),
(2013, 24, 11, 73),
(2013, 25, 27, 74),
(2013, 29, 16, 75),
(2013, 31, 1, 76),
(2013, 31, 0, 80),
(2013, 22, 10, 81),
(2013, 29, 10, 85),
(2013, 30, 0, 86),
(2013, 19, 3, 87),
(2013, 24, 0, 88),
(2013, 18, 8, 89),
(2013, 36, 4, 90),
(2013, 24, 0, 91),
(2013, 22, 2, 92),
(2013, 36, 0, 93);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nomeUsuario` varchar(255) NOT NULL,
  `primeiroNome` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  `segundoNome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_76mdv3lndjj1cmyohm02gkruw` (`campus_id`), ADD KEY `FK_9lt46q9dj9d6o3970k9m6tfp8` (`centro_id`), ADD KEY `FK_3s1xslcdrbmwoo40a1gbhnixk` (`curso_id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_8i15r9ty9i5k51mt73wry6wtb` (`campus_id`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_k0syv0pm1kk2df52i3a63jck5` (`campus_id`), ADD KEY `FK_9qjj4tjlto6amnl4628732ktp` (`centro_id`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_da9gikdh9y8mf853f732xebuq` (`curso_id`);

--
-- Indexes for table `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`ano`,`disciplina_id`), ADD KEY `FK_73qwr3he9dx5dv4tcrd6a95mr` (`disciplina_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UK_598mvcct5levbbtcaeu7bfy6j` (`nomeUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=284;
--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `centro`
--
ALTER TABLE `centro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
ADD CONSTRAINT `FK_3s1xslcdrbmwoo40a1gbhnixk` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
ADD CONSTRAINT `FK_76mdv3lndjj1cmyohm02gkruw` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`),
ADD CONSTRAINT `FK_9lt46q9dj9d6o3970k9m6tfp8` FOREIGN KEY (`centro_id`) REFERENCES `centro` (`id`);

--
-- Limitadores para a tabela `centro`
--
ALTER TABLE `centro`
ADD CONSTRAINT `FK_8i15r9ty9i5k51mt73wry6wtb` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
ADD CONSTRAINT `FK_9qjj4tjlto6amnl4628732ktp` FOREIGN KEY (`centro_id`) REFERENCES `centro` (`id`),
ADD CONSTRAINT `FK_k0syv0pm1kk2df52i3a63jck5` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
ADD CONSTRAINT `FK_da9gikdh9y8mf853f732xebuq` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);

--
-- Limitadores para a tabela `formulario`
--
ALTER TABLE `formulario`
ADD CONSTRAINT `FK_73qwr3he9dx5dv4tcrd6a95mr` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
