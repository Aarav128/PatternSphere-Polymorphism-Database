-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 02, 2025 at 05:12 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `25_new_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `pattern_head_with_author`
--

CREATE TABLE `pattern_head_with_author` (
  `nid` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `title` text,
  `author_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pattern_head_with_author`
--

INSERT INTO `pattern_head_with_author` (`nid`, `type`, `language`, `title`, `author_name`) VALUES
(213, 'pattern', 'en', 'Demystification and Reenchantment', 'Kenneth Gillgren'),
(200, 'pattern', 'en', 'Civic Intelligence', 'Douglas Schuler'),
(202, 'pattern', 'en', 'The Good Life', 'Gary Chapman'),
(214, 'pattern', 'en', 'Translation', 'Douglas Schuler'),
(231, 'pattern', 'en', 'Big Tent for Social Change', 'Mary Reister'),
(232, 'pattern', 'en', 'Opportunity Spaces', 'Douglas Schuler'),
(203, 'pattern', 'en', 'Social Dominance Attenuation', 'Douglas Schuler'),
(215, 'pattern', 'en', 'Linguistic Diversity', 'Douglas Schuler'),
(233, 'pattern', 'en', 'Strategic Capacity', 'Douglas Schuler'),
(216, 'pattern', 'en', 'Education and Values', 'John Thomas'),
(234, 'pattern', 'en', 'Media Literacy', 'Mark Lipton'),
(235, 'pattern', 'en', 'Participatory Design', 'Douglas Schuler'),
(217, 'pattern', 'en', 'Dematerialization', 'Burl Humana'),
(204, 'pattern', 'en', 'Health as a Universal Right', 'Douglas Schuler'),
(236, 'pattern', 'en', 'Citizen Science', 'Stewart Dutfield'),
(237, 'pattern', 'en', 'Mobile Intelligence', 'Douglas Schuler'),
(238, 'pattern', 'en', 'Techno-Criticism', 'Douglas Schuler'),
(218, 'pattern', 'en', 'Transforming Institutions', 'Brian Beaton'),
(239, 'pattern', 'en', 'World Citizen Parliament', 'Douglas Schuler'),
(205, 'pattern', 'en', 'Global Citizenship', 'Douglas Schuler'),
(201, 'pattern', 'en', 'The Commons', 'David Bollier'),
(206, 'pattern', 'en', 'Political Settings', 'Jonathan Barker'),
(240, 'pattern', 'en', 'Economic Conversion', 'Lloyd Dumas'),
(219, 'pattern', 'en', 'Teaching to Transgress', 'John Thomas'),
(207, 'pattern', 'en', 'Social Responsibility', 'Stewart Dutfield'),
(241, 'pattern', 'en', 'Strengthening International Law', 'Richard Falk'),
(242, 'pattern', 'en', 'International Networks of Alternative Media', 'Dorothy Kidd'),
(220, 'pattern', 'en', 'Fair Trade', 'Burl Humana'),
(243, 'pattern', 'en', 'Design Stance', 'Rob Knapp'),
(221, 'pattern', 'en', 'Sustainable Design', 'Rob Knapp'),
(244, 'pattern', 'en', 'Open Action and Research Network', 'Douglas Schuler'),
(208, 'pattern', 'en', 'Matrifocal Orientation', 'Lori Blewett'),
(250, 'pattern', 'en', 'Truth and Reconciliation Commissions', 'Helena Meyer-Knapp'),
(245, 'pattern', 'en', 'Alternative Progress Indices', 'Burl Humana'),
(251, 'pattern', 'en', 'Online Deliberation', 'Matt Powell'),
(246, 'pattern', 'en', 'Meaningful Maps', 'Andy Dearden'),
(222, 'pattern', 'en', 'Anti-Racism', 'Lori Blewett'),
(209, 'pattern', 'en', 'Collective Decision-Making', 'Valerie Brown'),
(223, 'pattern', 'en', 'Spiritually Grounded Activism', 'Helena Meyer-Knapp'),
(252, 'pattern', 'en', 'Alternative Media in Hostile Environments', 'Douglas Schuler'),
(247, 'pattern', 'en', 'Citizen Access to Simulations', 'Alan Borning'),
(253, 'pattern', 'en', 'Mutual Help Medical Websites', 'Andy Dearden'),
(248, 'pattern', 'en', 'Culturally Situated Design Tools', 'Ron Eglash'),
(224, 'pattern', 'en', 'Cyberpower', 'Kate Williams'),
(210, 'pattern', 'en', 'Memory and Responsibility', 'Douglas Schuler'),
(254, 'pattern', 'en', 'Indigenous Media', 'Douglas Schuler'),
(225, 'pattern', 'en', 'Earth\\\'s Vital Signs', 'Jenny Frankel-Reed'),
(226, 'pattern', 'en', 'Big-Picture Health Information', 'Jenny Epstein'),
(227, 'pattern', 'en', 'Whole Cost', 'Douglas Schuler'),
(249, 'pattern', 'en', 'Conversational Support Across Boundaries', 'John Thomas'),
(211, 'pattern', 'en', 'Working Class Consciousness', 'Steve Zeltzer'),
(255, 'pattern', 'en', 'Peace Education', 'Helena Meyer-Knapp'),
(212, 'pattern', 'en', 'Back to the Roots', 'Douglas Schuler'),
(269, 'pattern', 'en', 'E-Consultation as Mediation', 'David Newman'),
(228, 'pattern', 'en', 'Indicators', 'Douglas Schuler'),
(256, 'pattern', 'en', 'Intermediate Technologies', 'Justin Smith'),
(270, 'pattern', 'en', 'Participatory Budgeting', 'Andrew Gordon'),
(257, 'pattern', 'en', 'Durable Assets', 'Justin Smith'),
(271, 'pattern', 'en', 'Transaction Tax', 'Burl Humana'),
(229, 'pattern', 'en', 'Public Agenda', 'Douglas Schuler'),
(258, 'pattern', 'en', 'Public Library', 'Stewart Dutfield'),
(286, 'pattern', 'en', 'Value Sensitive Design', 'Batya Friedman'),
(287, 'pattern', 'en', 'Future Design', 'Douglas Schuler'),
(259, 'pattern', 'en', 'Digital Emancipation', 'Gilson Schwartz'),
(272, 'pattern', 'en', 'Powerful Remittances', 'Scott Robinson'),
(260, 'pattern', 'en', 'Community Networks', 'Peter Day'),
(273, 'pattern', 'en', 'Positive Health Information', 'Jenny Epstein'),
(288, 'pattern', 'en', 'Experimental School', 'Douglas Schuler'),
(261, 'pattern', 'en', 'Online Community Service Engine', 'Fiorella De Cindio'),
(230, 'pattern', 'en', 'Democratic Political Settings', 'Jonathan Barker'),
(274, 'pattern', 'en', 'Accessibility of Online Information', 'Robert Luke'),
(289, 'pattern', 'en', 'Service-Learning', 'Norman Clark'),
(275, 'pattern', 'en', 'Open Access Scholarly Publishing', 'John Thomas'),
(276, 'pattern', 'en', 'Mobile ICT Learning Facilities', 'Grant Hearn'),
(290, 'pattern', 'en', 'Citizen Journalism', 'Lewis A. Friedland'),
(262, 'pattern', 'en', 'Community Currencies', 'Burl Humana'),
(291, 'pattern', 'en', 'Document Centered Discussion', 'Todd Davies'),
(306, 'pattern', 'en', 'Engaged Tourism', 'Christine Ciancetta'),
(263, 'pattern', 'en', 'Transparency', 'John B. Adams'),
(277, 'pattern', 'en', 'Grassroots Public Policy Development', 'Douglas Schuler'),
(292, 'pattern', 'en', 'Citizen Diplomacy', 'Douglas Schuler'),
(307, 'pattern', 'en', 'Appropriating Technology', 'Ron Eglash'),
(278, 'pattern', 'en', 'Multi-Party Negotiation for Conflict Resolution', 'Helena Meyer-Knapp'),
(293, 'pattern', 'en', 'Mirror Institutions', 'Douglas Schuler'),
(279, 'pattern', 'en', 'Users\\\' IT Quality Network', 'Aake Walldius'),
(264, 'pattern', 'en', 'Privacy', 'Douglas Schuler'),
(294, 'pattern', 'en', 'Patient Access to Medical Records', 'Amir Hannan'),
(308, 'pattern', 'en', 'Control of Self Representation', 'Douglas Schuler'),
(295, 'pattern', 'en', 'Citizenship Schools', 'Lewis A. Friedland'),
(309, 'pattern', 'en', 'Homemade Media', 'Douglas Schuler'),
(280, 'pattern', 'en', 'Academic Technology Investments', 'Sarah Stein'),
(265, 'pattern', 'en', 'Media Diversity', 'Douglas Schuler'),
(296, 'pattern', 'en', 'Community Building Journalism', 'Peter Miller'),
(310, 'pattern', 'en', 'Arts of Resistance', 'Douglas Schuler'),
(297, 'pattern', 'en', 'Informal Learning Groups', 'Justin Smith'),
(281, 'pattern', 'en', 'Wholesome Design for Wicked Problems', 'Rob Knapp'),
(311, 'pattern', 'en', 'Labor Visions', 'Nancy Brigham'),
(298, 'pattern', 'en', 'Appreciative Collaboration', 'Stewart Dutfield'),
(266, 'pattern', 'en', 'Ethics of Community Informatics Research and Practice', 'Randy Stoecker'),
(312, 'pattern', 'en', 'Universal Voice Mail', 'Jenn Brandon'),
(299, 'pattern', 'en', 'Sustainability Appraisal', 'Nick Plant'),
(267, 'pattern', 'en', 'Free and Fair Elections', 'Douglas Schuler'),
(313, 'pattern', 'en', 'The Power of Story', 'Rebecca Chamberlain'),
(282, 'pattern', 'en', 'Voices of the Unheard', 'John Thomas'),
(300, 'pattern', 'en', 'Shared Vision', 'Stewart Dutfield'),
(268, 'pattern', 'en', 'Equal Access to Justice', 'Donald J Horowitz'),
(301, 'pattern', 'en', 'Community Animators', 'Justin Smith'),
(314, 'pattern', 'en', 'Public Domain Characters', 'John Thomas'),
(283, 'pattern', 'en', 'Design for Unintended Use', 'Erik Stolterman'),
(302, 'pattern', 'en', 'Online Anti-Poverty Community', 'Penny Goldsmith'),
(284, 'pattern', 'en', 'Civic Capabilities', 'Justin Smith'),
(315, 'pattern', 'en', 'Everyday Heroism', 'Douglas Schuler'),
(303, 'pattern', 'en', 'Sense of Struggle', 'Douglas Schuler'),
(285, 'pattern', 'en', 'Strategic Frame', 'Douglas Schuler'),
(322, 'pattern', 'en', 'Illegitimate Theater', 'Mark Harrison'),
(323, 'pattern', 'en', 'Environmental Impact Remediation', 'Douglas Schuler'),
(304, 'pattern', 'en', 'Self-Help Groups', 'Justin Smith'),
(324, 'pattern', 'en', 'Open Source Search Technology', 'Douglas Schuler'),
(305, 'pattern', 'en', 'Self-Designed Development', 'Justin Smith'),
(325, 'pattern', 'en', 'Socially Responsible Video Games', 'Douglas Schuler'),
(326, 'pattern', 'en', 'Open Source Everything', 'John Thomas'),
(316, 'pattern', 'en', 'Telecenters', 'Michel J. Menou'),
(317, 'pattern', 'en', 'Thinking Communities', 'Aldo de Moor'),
(327, 'pattern', 'en', 'Power Research', 'Douglas Schuler'),
(328, 'pattern', 'en', 'Citizens\\\' Tribunal', 'Douglas Schuler'),
(329, 'pattern', 'en', 'Whistle Blowing', 'Tom Carpenter'),
(318, 'pattern', 'en', 'Great Good Place', 'Douglas Schuler'),
(319, 'pattern', 'en', 'Soap Operas with Civic Messages', 'Douglas Schuler'),
(330, 'pattern', 'en', 'Tactical Media', 'Alessandra Renzi'),
(320, 'pattern', 'en', 'Emergency Communication Systems', 'Douglas Schuler'),
(321, 'pattern', 'en', 'Community Inquiry', 'Ann Bishop'),
(331, 'pattern', 'en', 'Media Intervention', 'Douglas Schuler'),
(332, 'pattern', 'en', 'Peaceful Public Demonstrations', 'Douglas Schuler'),
(333, 'pattern', 'en', 'Activist Road Trip', 'Douglas Schuler'),
(334, 'pattern', 'en', 'Follow The Money', 'Burl Humana'),
(335, 'pattern', 'en', 'Retreat and Reflection', 'Douglas Schuler');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
