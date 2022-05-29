-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30-Maio-2022 às 00:29
-- Versão do servidor: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mvcdelphi`
--
CREATE DATABASE IF NOT EXISTS `mvcdelphi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mvcdelphi`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Cidade` varchar(40) NOT NULL,
  `UF` varchar(2) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`Codigo`, `Nome`, `Cidade`, `UF`) VALUES
(1, 'Jean', 'Monte Alto', 'SP'),
(2, 'Jessica', 'Monte Alto', 'SP'),
(3, 'Joao', 'Taquaritinga', 'SP'),
(4, 'Samuel', 'Ribeirao Preto', 'SP'),
(5, 'Carolina', 'Matao', 'SP'),
(6, 'Izilda', 'Chapeco', 'SC'),
(7, 'Renan Munhoz', 'Curitiba', 'PR'),
(8, 'Vitoria', 'Catanduva', 'SP'),
(9, 'Katherine', 'Monte Azul', 'SP'),
(10, 'Afranio', 'Monte Alto', 'SP'),
(11, 'Pedro', 'Sao Paulo', 'SP'),
(12, 'Luiz', 'Campinas', 'SP'),
(13, 'Augusto', 'Belem', 'PA'),
(14, 'Felipe', 'Rio de Janeiro', 'RJ'),
(15, 'Jose Roberto', 'Londrina', 'PR'),
(16, 'Maria', 'Taquaritinga', 'SP'),
(17, 'Jaqueline', 'Uberaba', 'MG'),
(18, 'Flavia', 'Araraquara', 'SP'),
(19, 'Silvio', 'Monte Alto', 'SP'),
(20, 'Lucas', 'Chapeco', 'SC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `CodPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Emissao` date NOT NULL,
  `CodCliente` int(11) NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`CodPedido`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_itens`
--

CREATE TABLE IF NOT EXISTS `pedido_itens` (
  `CodPedItens` int(11) NOT NULL AUTO_INCREMENT,
  `CodPedido` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Valor` float NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`CodPedItens`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(60) NOT NULL,
  `Preco` float NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`Codigo`, `Descricao`, `Preco`) VALUES
(1, 'Computador', 1000),
(2, 'Mouse', 35),
(3, 'Lapis', 2.8),
(4, 'Monitor', 98),
(5, 'VideoGame', 1500),
(6, 'HD', 320.78),
(7, 'Tesoura', 23),
(8, 'Mesa de Computador', 800),
(9, 'Capinha para Celular', 29.9),
(10, 'Travesseiro', 54),
(11, 'Cortina', 100),
(12, 'Cama', 200),
(13, 'Carregador de Celular', 64.5),
(14, 'Teclado', 100),
(15, 'Fone de Ouvido', 19.6),
(16, 'Mochila', 86),
(17, 'Pelicula para Celular', 8),
(18, 'Balanca', 52),
(19, 'Televisao', 1800),
(20, 'Controle Remoto', 67.8);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
