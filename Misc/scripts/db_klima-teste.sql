CREATE DATABASE IF NOT EXISTS db_klima;
USE db_klima;
-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 24/07/2017 às 15:04
-- Versão do servidor: 10.1.25-MariaDB
-- Versão do PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_klima`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluno`
--

CREATE TABLE `Aluno` (
  `id` bigint(20) NOT NULL,
  `anoAtual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anoEntrada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `situacaoAtual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidadeFederativa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL,
  `centro_id` bigint(20) DEFAULT NULL,
  `curso_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Aluno`
--

INSERT INTO `Aluno` (`id`, `anoAtual`, `anoEntrada`, `bairro`, `cep`, `cidade`, `latitude`, `longitude`, `nome`, `numero`, `rua`, `situacaoAtual`, `unidadeFederativa`, `campus_id`, `centro_id`, `curso_id`) VALUES
(435, '1', '2014', 'centro', '74198', 'foz do iguaçu', 45.933966, 6.189949899999999, 'Kiayada S. Blake', '1451', 'rua santos dumont', 'Cursando', 'pr', 1, 1, 2),
(436, '2', '1994', 'centro', '5329', 'foz do iguaçu', 56.1734985, 26.8544998, 'Gannon X. Rosales', '846', 'rua tarobá', 'Formado', 'pr', 1, 1, 4),
(437, '3', '1993', 'vila a', '42152', 'foz do iguaçu', 37.1007415, -85.8151094, 'Amber B. Sheppard', '503', 'avenida anhembi', 'Cancelado Por Abandono', 'pr', 1, 1, 4),
(438, '5', '2009', 'campos do iguaçu', '5423', 'foz do iguaçu', 46.9702058, -123.7209896, 'Baxter H. Cleveland', '202', 'alameda paraopeba', 'Formado', 'pr', 1, 1, 3),
(439, '1', '2009', 'jardim santa maria', '29-180', 'toledo', 37.5462598, 126.8488114, 'Astra P. Leonard', '4485', 'avenida parigot de souza', 'Cursando', 'pr', 1, 1, 4),
(440, '5', '2003', 'aptent taciti sociosqu', '94-877', 'Fontanigorda', 21.4008533, -158.0016396, 'Jarrod X. Sykes', '1077', 'P.O. Box 818, 4490 Laoreet St.', 'Cancelado', 'LIG', 1, 1, 4),
(441, '4', '2003', 'imperdiet dictum', 'E58 4QW', '?ereflikohisar', NULL, NULL, 'Wade Z. Wheeler', '52', '955-7707 Euismod Rd.', 'Cursando', 'Ank', 1, 1, 4),
(442, '4', '1997', 'Duis dignissim', '84081', 'Meppel', 40.5984908, -112.0357137, 'Xavier N. Kaufman', '1143', 'P.O. Box 259, 7935 Nunc Street', 'Cancelado', 'Drenthe', 1, 1, 3),
(443, '3', '2006', 'odio tristique', '680927', 'Topeka', NULL, NULL, 'Josiah K. Potts', '17', 'Ap #747-4460 Vitae St.', 'Cancelado', 'Kansas', 1, 1, 3),
(444, '5', '2016', 'augue scelerisque mollis.', '36765-371', 'Vienna', 32.25624080000001, -87.4041604, 'Kerry C. Valencia', '161', 'Ap #354-4418 Quam Av.', 'Cancelado Por Abandono', 'Wie', 1, 1, 1),
(445, '3', '2007', 'et, magna. Praesent', '20770', 'Benestare', 39.0019157, -76.8836261, 'Colleen A. Noble', '273', 'Ap #137-2920 Praesent Road', 'Cancelado Por Abandono', 'CAL', 1, 1, 3),
(446, '4', '1986', 'placerat, orci lacus', '8649', 'Wals-Siezenheim', 42.5242055, -76.9387599, 'Ulla X. Hays', '1180', 'P.O. Box 547, 5467 Ante Avenue', 'Cancelado Por Abandono', 'Salzburg', 1, 1, 1),
(447, '2', '1992', 'porta elit, a feugiat', '08164-444', 'Norwich', NULL, NULL, 'Tana R. Livingston', '710', 'Ap #934-1477 A, Ave', 'Cancelado Por Abandono', 'NF', 1, 1, 2),
(448, '5', '2011', 'egestas,', '5124FQ', 'Valley East', NULL, NULL, 'Brenna J. Faulkner', '855', '184-2316 Dolor Av.', 'Cursando', 'ON', 1, 1, 1),
(449, '1', '2011', 'lorem, sit amet', '7919', 'Saint-Denis', 43.1193103, 26.4717644, 'Keely Y. Coffey', '383', 'Ap #536-7270 Ut Avenue', 'Cancelado', '×le-de-France', 1, 1, 3),
(450, '3', '2004', 'Cras vulputate', '35049', 'Kirkintilloch', 33.9613939, -86.59053709999999, 'Indira C. Richmond', '1211', 'P.O. Box 278, 8884 Leo. St.', 'Transferido', 'DN', 1, 1, 1),
(451, '5', '2011', 'porta elit, a', '14648-633', 'Gonda', NULL, NULL, 'Inga I. Moon', '476', 'P.O. Box 340, 2396 Tincidunt Av.', 'Cursando', 'UP', 1, 1, 4),
(452, '5', '1995', 'purus mauris a nunc.', '5015', 'Carmen', 29.7238242, -95.3780769, 'Thaddeus C. Estes', '1040', '3268 Sem Ave', 'Cancelado', 'Cartago', 1, 1, 2),
(453, '5', '1995', 'Sed eget lacus. Mauris', '4938KQ', 'Dandenong', NULL, NULL, 'Stephanie P. Durham', '1102', 'Ap #330-6606 Suspendisse Rd.', 'Transferido', 'Victoria', 1, 1, 2),
(454, '3', '1997', 'eleifend egestas. Sed pharetra,', '23612', 'Ancaster Town', 37.07, -76.5, 'Venus K. Willis', '21', 'Ap #666-7548 Semper St.', 'Cancelado', 'ON', 1, 1, 1),
(455, '1', '2003', 'lobortis', '744842', 'Paranagu ', -20.4386947, -54.6251148, 'Ivana D. Anderson', '279', '2640 Integer Road', 'Transferido', 'PR', 1, 1, 4),
(456, '2', '2012', 'Nunc mauris. Morbi', '43104', 'Cessnock', 44.91978899999999, 3.486726, 'Magee Z. Stevens', '574', '8574 Eros Rd.', 'Cursando', 'NSW', 1, 1, 3),
(457, '2', '2006', 'primis', '64013', 'Rockville', 39.0171314, -94.277807, 'Ora S. Garcia', '1206', 'P.O. Box 704, 4615 Augue Av.', 'Cancelado Por Abandono', 'Maryland', 1, 1, 2),
(458, '2', '1990', 'a, scelerisque sed, sapien.', '79669', 'Buin', 47.714247, 7.8619799, 'Zia X. Nielsen', '969', 'P.O. Box 195, 7240 Aenean St.', 'Formado', 'RM', 1, 1, 2),
(459, '1', '2016', 'Duis cursus, diam at', '859387', 'Istanbul', -25.5066063, -54.5305428, 'Cailin S. Roberson', '1022', 'P.O. Box 770, 2918 Elit. Avenue', 'Cancelado Por Abandono', 'Ist', 1, 1, 4),
(460, '5', '2003', 'pellentesque eget, dictum placerat,', '98147', 'Juan Fern ndez', 38.1707931, 15.5283871, 'Basil Q. Blake', '539', 'P.O. Box 337, 3842 Nam Rd.', 'Cursando', 'Valpara¡so', 1, 1, 3),
(461, '3', '2013', 'id nunc', '25211', 'Petit-Hallet', 38.4662376, -80.8574198, 'Portia J. Sandoval', '1135', 'Ap #102-6326 Rhoncus. Street', 'Formado', 'Luik', 1, 1, 1),
(462, '2', '2017', 'in faucibus', 'H6R 3R5', 'RibeirÆo das Neves', NULL, NULL, 'Joan F. Dyer', '590', 'Ap #164-5177 Mauris Ave', 'Cancelado', 'Minas Gerais', 1, 1, 1),
(463, '4', '2002', 'ac mattis semper, dui', '22064', 'Lang', 48.226166, -3.179338, 'Kylynn B. Reynolds', '840', 'Ap #503-6615 Iaculis, Rd.', 'Cursando', 'Saskatchewan', 1, 1, 3),
(464, '3', '2001', 'risus quis', 'G6E 3Y6', 'Collines-de-l\'Outaouais', NULL, NULL, 'Mari G. Emerson', '525', '540-8221 Sagittis Road', 'Cancelado', 'Quebec', 1, 1, 3),
(465, '5', '1998', 'neque', '4425', 'kersberga', 47.2988182, -122.5738109, 'Maryam A. Taylor', '697', '7013 Arcu. St.', 'Transferido', 'Stockholms ln', 1, 1, 2),
(466, '5', '1997', 'egestas ligula. Nullam feugiat', 'SW0 8RT', 'Hamburg', NULL, NULL, 'Margaret D. Freeman', '670', '989-7592 Orci, Road', 'Cancelado Por Abandono', 'HH', 1, 1, 3),
(467, '2', '2006', 'massa. Vestibulum accumsan neque', '14353', 'San Nicol s', 49.07400800000001, -0.568577, 'Cameron W. Le', '302', '440-5856 Proin Road', 'Formado', 'Cartago', 1, 1, 2),
(468, '2', '1994', 'ac urna. Ut tincidunt', '35733', 'Stuttgart', 38.4316883, 27.5789333, 'Quynn P. Cannon', '1011', '3818 Leo Avenue', 'Cancelado', 'Baden', 1, 1, 3),
(469, '2', '1986', 'mattis.', '7328', 'Goes', 52.202985, 5.9878998, 'Noel T. Barr', '1122', '308-1219 Pulvinar Street', 'Cursando', 'Zeeland', 1, 1, 1),
(470, '1', '2016', 'pede. Cum sociis', '62932', 'Stamford', 37.912096, -89.18964299999999, 'Dylan T. Moran', '214', '1292 Class Rd.', 'Formado', 'Connecticut', 1, 1, 4),
(471, '2', '1988', 'Donec est mauris,', '2214', 'Vetlanda', 40.9745445, -81.413888, 'Carly U. Perkins', '889', '471-6212 A, Rd.', 'Cursando', 'F', 1, 1, 1),
(472, '1', '2018', 'sem mollis dui, in', '57742', 'Morwell', 48.654217, 7.149020999999999, 'Hashim W. Greer', '1187', 'P.O. Box 946, 9454 Nibh Street', 'Cursando', 'VIC', 1, 1, 4),
(473, '5', '2009', 'litora torquent per conubia', '87-147', 'Sankt Wendel', 37.5070927, 126.6998872, 'Isaac H. Higgins', '729', 'P.O. Box 266, 3511 Ipsum Avenue', 'Cancelado', 'SL', 1, 1, 1),
(474, '4', '2008', 'elit. Nulla facilisi. Sed', '143303', 'Poitiers', 31.3504271, 74.69858909999999, 'Cameran H. Fisher', '739', '3782 Euismod Street', 'Cancelado', 'PO', 1, 1, 4),
(475, '3', '2011', 'eget massa. Suspendisse', 'J0S 1J4', 'Croydon', NULL, NULL, 'Marshall M. Woods', '782', 'P.O. Box 997, 1915 Eleifend. Rd.', 'Formado', 'SR', 1, 1, 2),
(476, '5', '2007', 'aliquet', '9611', 'Hamburg', 34.3979796, -92.4876424, 'Zeph X. Dudley', '409', '362-8755 Est, Road', 'Transferido', 'HH', 1, 1, 4),
(477, '4', '1996', 'ultricies ornare,', '91662', 'Przemy?l', 48.514059, 2.123585, 'Caesar Y. Berg', '959', 'Ap #291-9077 Tincidunt Av.', 'Cancelado Por Abandono', 'Podkarpackie', 1, 1, 2),
(478, '4', '2001', 'ac arcu.', '925379', 'El Monte', NULL, NULL, 'Alexandra R. Andrews', '915', 'P.O. Box 329, 942 Ultricies Avenue', 'Formado', 'Metropolitana de Santiago', 1, 1, 4),
(479, '5', '1992', 'ut nisi a odio', '545523', 'Perpignan', 1.354713, 103.876947, 'India P. Valentine', '106', 'P.O. Box 612, 8465 Sit Rd.', 'Formado', 'LA', 1, 1, 4),
(480, '5', '1987', 'enim.', '18-376', 'Exeter', 40.41124720000001, -80.0749476, 'Grady K. Powers', '985', 'Ap #701-5109 Non Road', 'Formado', 'DE', 1, 1, 4),
(481, '2', '1990', 'egestas. Fusce', '4230', 'Creil', 37.8370901, -91.6057922, 'Indigo E. Curtis', '281', 'P.O. Box 932, 3778 Class Road', 'Cursando', 'PI', 1, 1, 4),
(482, '1', '2015', 'tellus lorem eu metus.', '585103', 'Bremen', 17.3429962, 76.7567368, 'Miriam D. Franks', '328', '7035 Vestibulum Rd.', 'Formado', 'Bremen', 1, 1, 4),
(483, '4', '1995', 'eu tempor erat', '50107', 'Boise', 42.0193516, -94.2538452, 'Jolie O. Church', '846', '383-2770 Eu, Rd.', 'Cancelado Por Abandono', 'ID', 1, 1, 4),
(484, '3', '2002', 'Aliquam', '13751', 'Lim¢n (Puerto Lim¢n)', 42.4464976, -74.903339, 'Aurora A. Evans', '139', 'P.O. Box 586, 1582 Eu, St.', 'Cancelado', 'Lim¢n', 1, 1, 1),
(485, '1', '1998', 'nisl', '431481', 'Vienna', 54.07599039999999, 44.84053900000001, 'Xandra L. Copeland', '410', '289-4400 Malesuada Rd.', 'Cancelado', 'Vienna', 1, 1, 4),
(486, '4', '1991', 'in sodales elit', '50171', 'Mcon', 41.61400099999999, -92.49999179999999, 'Kylynn N. Valencia', '253', 'P.O. Box 406, 6489 Tristique Av.', 'Cancelado', 'Bourgogne', 1, 1, 1),
(487, '2', '1997', 'luctus', '22-421', 'Tumba', 44.9156929, -116.0948607, 'Nichole Q. Dunn', '367', 'Ap #941-1725 At, Avenue', 'Cursando', 'AB', 1, 1, 1),
(488, '3', '1999', 'sed,', '20679', 'Hofors', NULL, NULL, 'Tobias D. Hoffman', '710', '858-1665 Felis Av.', 'Cursando', 'X', 1, 1, 4),
(489, '5', '1994', 'Mauris molestie pharetra', '67746', 'Warszawa', 49.6680254, 7.5050926, 'Wynter M. Fisher', '945', '275-3596 Justo. St.', 'Formado', 'Mazowieckie', 1, 1, 3),
(490, '2', '1991', 'est. Mauris', '33412', 'Krak¢w', 26.8008354, -80.2432839, 'Patricia X. Pearson', '799', '2803 Dictum Rd.', 'Formado', 'MP', 1, 1, 1),
(491, '1', '1990', 'risus. Donec', '29059-313', 'Las Condes', 34.180753, -80.394384, 'Zachery S. Crawford', '270', 'P.O. Box 635, 7571 Nullam St.', 'Cancelado', 'RM', 1, 1, 1),
(492, '3', '2017', 'molestie arcu. Sed eu', '52619-258', 'Baracaldo', 40.4401248, -91.4165788, 'Daquan D. Collins', '710', '588-3935 Natoque Street', 'Cancelado', 'PV', 1, 1, 2),
(493, '1', '2011', 'at', '10219', 'San Felipe', 48.289645, 4.787636, 'Yvette C. Barnes', '598', 'P.O. Box 681, 182 Turpis Avenue', 'Cursando', 'San Jos', 1, 1, 3),
(494, '5', '2012', 'sem molestie sodales. Mauris', '1037XR', 'Vaughan', NULL, NULL, 'Latifah O. Palmer', '545', 'P.O. Box 968, 499 Tempor, St.', 'Transferido', 'ON', 1, 1, 1),
(495, '4', '2009', 'dui,', '9692', 'Buckingham', 43.6087997, 28.4298856, 'Victoria V. Delacruz', '210', '4754 Lacinia Avenue', 'Transferido', 'Buckinghamshire', 1, 1, 3),
(496, '2', '2016', 'diam dictum sapien.', 'K1 4IQ', 'Warri', NULL, NULL, 'Cora A. Donaldson', '34', 'Ap #138-8771 Felis Rd.', 'Transferido', 'Delta', 1, 1, 4),
(497, '4', '2012', 'sollicitudin adipiscing ligula.', '324254', 'Dublin', 45.1256442, 19.5501596, 'Velma R. Ferguson', '147', 'Ap #168-3682 Eget Ave', 'Cancelado Por Abandono', 'L', 1, 1, 1),
(498, '1', '2008', 'adipiscing', '998399', 'Namur', NULL, NULL, 'Ella S. Coleman', '765', 'Ap #918-3821 Eu Ave', 'Cancelado Por Abandono', 'Quebec', 1, 1, 1),
(499, '4', '1992', 'penatibus et magnis', '67607', 'Ede', NULL, NULL, 'Reese T. Rojas', '588', 'Ap #949-8757 Non, Rd.', 'Cancelado', 'Gl', 1, 1, 2),
(500, '3', '1993', 'Donec est mauris,', '9176', 'Gatineau', 36.6217096, -81.1456496, 'Lisandra F. Stephenson', '25', 'Ap #394-3995 Vulputate, Ave', 'Cursando', 'QC', 1, 1, 1),
(501, '5', '2001', 'dictum', '87607', 'Bremerhaven', 24.8444381, -98.1512676, 'Delilah F. Potts', '957', '705-6914 Consectetuer Street', 'Cursando', 'Bremen', 1, 1, 3),
(502, '5', '2005', 'purus, accumsan interdum libero', '61690', 'Raurkela Civil Township', 34.411167, -94.781156, 'Meredith T. Pittman', '313', 'Ap #574-1640 Pellentesque Ave', 'Cancelado Por Abandono', 'Odisha', 1, 1, 3),
(503, '1', '1997', 'Curabitur egestas', '71802', 'Galway', 33.67, -93.58999999999999, 'Chandler G. Pearson', '269', '624-6914 Bibendum. Street', 'Cursando', 'Connacht', 1, 1, 1),
(504, '3', '1998', 'non enim. Mauris quis', '18126', 'Dubbo', 46.925337, 2.406943, 'Avye W. Beach', '213', 'Ap #725-2599 Ultricies Rd.', 'Cancelado Por Abandono', 'New South Wales', 1, 1, 3),
(505, '4', '1999', 'Integer tincidunt aliquam', '677127', 'Bendigo', 35.8518292, 129.2117866, 'Caesar X. Herrera', '9', 'Ap #423-4988 Blandit Ave', 'Cursando', 'Victoria', 1, 1, 2),
(506, '5', '1999', 'hymenaeos.', '751456', 'Mjlby', NULL, NULL, 'Zachery F. Richard', '972', 'P.O. Box 728, 7352 Dictum Rd.', 'Cancelado', 'E', 1, 1, 3),
(507, '4', '1987', 'lacinia at,', '14778', 'Owen Sound', 42.0786337, -78.47585710000001, 'Rachel J. Dalton', '538', 'Ap #179-1782 Erat Rd.', 'Cursando', 'ON', 1, 1, 3),
(508, '2', '1989', 'ante ipsum', '9802', 'Pagazzano', 35.396933, -110.131216, 'Igor S. Booker', '781', 'P.O. Box 497, 6949 Risus. Ave', 'Transferido', 'LOM', 1, 1, 2),
(509, '1', '2008', 'ac orci. Ut', '36920', 'Juneau', 42.3955355, -8.7088909, 'Robert D. Hess', '353', 'P.O. Box 725, 5883 Diam. St.', 'Transferido', 'AK', 1, 1, 3),
(510, '4', '1999', 'Mauris quis turpis', '43132', 'San Isidro de El General', 45.1230534, 3.53222, 'Slade Q. Ramirez', '748', 'Ap #526-8790 Hymenaeos. St.', 'Formado', 'SJ', 1, 1, 3),
(511, '5', '2017', 'et', '7044', 'Rocca Santo Stefano', 36.250799, -92.5747768, 'Rina Z. Golden', '618', 'P.O. Box 460, 3063 Quisque Rd.', 'Transferido', 'Lazio', 1, 1, 3),
(512, '4', '2001', 'sed', 'F80 5EH', '?ereflikohisar', NULL, NULL, 'Baxter C. Lang', '1107', 'P.O. Box 731, 4131 Gravida Road', 'Cursando', 'Ankara', 1, 1, 1),
(513, '2', '2000', 'magna. Sed eu eros.', '97208', 'Galway', 45.5287071, -122.678709, 'Wallace M. Mccullough', '341', 'Ap #396-563 Ultricies Avenue', 'Transferido', 'C', 1, 1, 3),
(514, '5', '2013', 'nec,', 'O7 7SX', 'Bida', NULL, NULL, 'Aaron O. Mathews', '86', 'Ap #996-2741 Fusce Street', 'Cancelado', 'NI', 1, 1, 3),
(515, '3', '2003', 'urna, nec luctus', '49739', 'Courbevoie', 44.6599999, -84.7099999, 'Fredericka V. Talley', '548', '5828 Malesuada Ave', 'Cursando', 'IL', 1, 1, 4),
(516, '4', '1986', 'Ut tincidunt orci', 'H8A 2M1', 'Chelmsford', NULL, NULL, 'Hedda C. Mcmahon', '1188', '271-2144 Cursus St.', 'Transferido', 'ES', 1, 1, 2),
(517, '4', '2008', 'imperdiet', '7283', 'Galway', 41.4978092, -81.6935725, 'Octavius Q. Pugh', '478', 'P.O. Box 131, 9907 Imperdiet Rd.', 'Transferido', 'Connacht', 1, 1, 3),
(518, '3', '2005', 'neque non quam. Pellentesque', '82855', 'Saint-Mdard-en-Jalles', 16.9496724, 42.6562619, 'Elvis Q. Cardenas', '916', '6152 Mollis St.', 'Formado', 'Aquitaine', 1, 1, 4),
(519, '2', '2009', 'sapien,', '11901', 'Southaven', 40.9413697, -72.6505957, 'Wing D. Rios', '874', 'P.O. Box 201, 904 Mauris Av.', 'Transferido', 'Mississippi', 1, 1, 3),
(520, '1', '1995', 'est, vitae sodales nisi', '28393', 'Pukekohe', 34.9650355, -78.1792434, 'Diana F. Chang', '1070', 'Ap #675-8662 Donec Road', 'Transferido', 'North Island', 1, 1, 3),
(521, '4', '1994', 'cursus', '54362', 'Paulista', 49.38389799999999, 5.752398899999999, 'Larissa H. Duran', '594', 'Ap #864-3444 Placerat Rd.', 'Formado', 'Pernambuco', 1, 1, 1),
(522, '5', '1988', 'mollis vitae,', '74824', 'Blumenau', 35.8823421, -96.8672668, 'Kuame D. Collier', '167', 'Ap #930-5232 Nunc. St.', 'Transferido', 'Santa Catarina', 1, 1, 4),
(523, '1', '1999', 'ipsum sodales', '24086', 'Haddington', 37.2730939, -80.63824129999999, 'Jael N. Witt', '692', '3184 Eleifend, Av.', 'Cancelado Por Abandono', 'East Lothian', 1, 1, 4),
(524, '3', '1993', 'cursus.', 'NO6I 5OH', 'San Francisco', NULL, NULL, 'Fallon D. Vega', '1106', '407 Aliquam Road', 'Cancelado Por Abandono', 'H', 1, 1, 1),
(525, '4', '2005', 'non, feugiat nec,', '75356', 'Vienna', 32.8094568, -96.889555, 'Amela H. Benjamin', '195', '9230 Nec Avenue', 'Transferido', 'Wie', 1, 1, 4),
(526, '1', '1998', 'eu, eleifend nec, malesuada', '30208', 'Saint-Prime', 43.957114, 4.048207, 'Imani O. Rasmussen', '853', '718-2515 Lorem. Rd.', 'Cursando', 'QC', 1, 1, 4),
(527, '3', '2012', 'vulputate dui, nec', '71217', 'Dalkeith', 32.49, -92.1, 'Debra H. Solomon', '245', '5301 Eleifend Rd.', 'Cursando', 'Midlothian', 1, 1, 1),
(528, '5', '2007', 'Quisque porttitor eros nec', '66-716', 'Casalvieri', 34.7398316, -92.26330159999999, 'Deborah D. Alford', '676', '1260 Elit Rd.', 'Cancelado Por Abandono', 'Lazio', 1, 1, 3),
(529, '2', '1993', 'at sem molestie sodales.', '771229', 'Siculiana', 37.1725185, 128.4775199, 'August T. Ramirez', '333', '682-1301 Non, Rd.', 'Cursando', 'SIC', 1, 1, 1),
(530, '5', '1991', 'Quisque ac libero', '9508', 'Osgoode', 34.4198608, -92.52661069999999, 'Keegan E. Whitaker', '718', '9049 Non, Street', 'Formado', 'ON', 1, 1, 4),
(531, '5', '2011', 'iaculis odio. Nam', '45562', 'Meerut Cantonment', -7.005372599999999, 108.3979331, 'Brynn J. Dillard', '1096', '749-3561 Enim, Street', 'Cursando', 'Uttar Pradesh', 1, 1, 1),
(532, '2', '2017', 'scelerisque, lorem ipsum', '52653-328', 'Hastings', NULL, NULL, 'Hedley E. Giles', '392', '530-2205 Elementum Street', 'Formado', 'North Island', 1, 1, 3),
(533, '4', '2010', 'vel arcu eu odio', '13-324', 'Winnipeg', 53.4243483, 19.7514562, 'Barrett N. House', '1031', 'P.O. Box 510, 1050 Duis Ave', 'Cancelado Por Abandono', 'Manitoba', 1, 1, 3),
(534, '5', '2006', 'In faucibus. Morbi', '30076', 'Georgia', 34.0567006, -84.3436881, 'Audra K. Holland', '803', '335-6185 At Avenue', 'Cursando', 'Georgia', 1, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Campus`
--

CREATE TABLE `Campus` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Campus`
--

INSERT INTO `Campus` (`id`, `nome`) VALUES
(1, 'Foz do Iguaçu');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Centro`
--

CREATE TABLE `Centro` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Centro`
--

INSERT INTO `Centro` (`id`, `nome`, `campus_id`) VALUES
(1, 'CECE', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Curso`
--

CREATE TABLE `Curso` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `turno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campus_id` bigint(20) DEFAULT NULL,
  `centro_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Curso`
--

INSERT INTO `Curso` (`id`, `nome`, `turno`, `campus_id`, `centro_id`) VALUES
(1, 'Ciência da Computação', 'Integral', 1, 1),
(2, 'Matemática', 'Matutino', 1, 1),
(3, 'Engenharia Elétrica', 'Integral', 1, 1),
(4, 'Engenharia Mecânica', 'Integral', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `id` bigint(20) NOT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomeUsuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `primeiroNome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundoNome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_76mdv3lndjj1cmyohm02gkruw` (`campus_id`),
  ADD KEY `FK_9lt46q9dj9d6o3970k9m6tfp8` (`centro_id`),
  ADD KEY `FK_3s1xslcdrbmwoo40a1gbhnixk` (`curso_id`);

--
-- Índices de tabela `Campus`
--
ALTER TABLE `Campus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Centro`
--
ALTER TABLE `Centro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8i15r9ty9i5k51mt73wry6wtb` (`campus_id`);

--
-- Índices de tabela `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_k0syv0pm1kk2df52i3a63jck5` (`campus_id`),
  ADD KEY `FK_9qjj4tjlto6amnl4628732ktp` (`centro_id`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `Aluno`
--
ALTER TABLE `Aluno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;
--
-- AUTO_INCREMENT de tabela `Campus`
--
ALTER TABLE `Campus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `Centro`
--
ALTER TABLE `Centro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FK_3s1xslcdrbmwoo40a1gbhnixk` FOREIGN KEY (`curso_id`) REFERENCES `Curso` (`id`),
  ADD CONSTRAINT `FK_76mdv3lndjj1cmyohm02gkruw` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`id`),
  ADD CONSTRAINT `FK_9lt46q9dj9d6o3970k9m6tfp8` FOREIGN KEY (`centro_id`) REFERENCES `Centro` (`id`);

--
-- Restrições para tabelas `Centro`
--
ALTER TABLE `Centro`
  ADD CONSTRAINT `FK_8i15r9ty9i5k51mt73wry6wtb` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`id`);

--
-- Restrições para tabelas `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `FK_9qjj4tjlto6amnl4628732ktp` FOREIGN KEY (`centro_id`) REFERENCES `Centro` (`id`),
  ADD CONSTRAINT `FK_k0syv0pm1kk2df52i3a63jck5` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
