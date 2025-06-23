-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 23, 2025 at 04:46 PM
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
  `title` text,
  `author_name` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `pattern_set` varchar(255) DEFAULT 'Liberating Voices'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pattern_head_with_author`
--

INSERT INTO `pattern_head_with_author` (`nid`, `type`, `title`, `author_name`, `pattern_set`) VALUES
(213, 'pattern', 'Demystification and Reenchantment', 'Kenneth Gillgren', 'Liberating Voices'),
(200, 'pattern', 'Civic Intelligence', 'Douglas Schuler', 'Liberating Voices'),
(202, 'pattern', 'The Good Life', 'Gary Chapman', 'Liberating Voices'),
(214, 'pattern', 'Translation', 'Douglas Schuler', 'Liberating Voices'),
(231, 'pattern', 'Big Tent for Social Change', 'Mary Reister', 'Liberating Voices'),
(232, 'pattern', 'Opportunity Spaces', 'Douglas Schuler', 'Liberating Voices'),
(203, 'pattern', 'Social Dominance Attenuation', 'Douglas Schuler', 'Liberating Voices'),
(215, 'pattern', 'Linguistic Diversity', 'Douglas Schuler', 'Liberating Voices'),
(233, 'pattern', 'Strategic Capacity', 'Douglas Schuler', 'Liberating Voices'),
(216, 'pattern', 'Education and Values', 'John Thomas', 'Liberating Voices'),
(234, 'pattern', 'Media Literacy', 'Mark Lipton', 'Liberating Voices'),
(235, 'pattern', 'Participatory Design', 'Douglas Schuler', 'Liberating Voices'),
(217, 'pattern', 'Dematerialization', 'Burl Humana', 'Liberating Voices'),
(204, 'pattern', 'Health as a Universal Right', 'Douglas Schuler', 'Liberating Voices'),
(236, 'pattern', 'Citizen Science', 'Stewart Dutfield', 'Liberating Voices'),
(237, 'pattern', 'Mobile Intelligence', 'Douglas Schuler', 'Liberating Voices'),
(238, 'pattern', 'Techno-Criticism', 'Douglas Schuler', 'Liberating Voices'),
(218, 'pattern', 'Transforming Institutions', 'Brian Beaton', 'Liberating Voices'),
(239, 'pattern', 'World Citizen Parliament', 'Douglas Schuler', 'Liberating Voices'),
(205, 'pattern', 'Global Citizenship', 'Douglas Schuler', 'Liberating Voices'),
(201, 'pattern', 'The Commons', 'David Bollier', 'Liberating Voices'),
(206, 'pattern', 'Political Settings', 'Jonathan Barker', 'Liberating Voices'),
(240, 'pattern', 'Economic Conversion', 'Lloyd Dumas', 'Liberating Voices'),
(219, 'pattern', 'Teaching to Transgress', 'John Thomas', 'Liberating Voices'),
(207, 'pattern', 'Social Responsibility', 'Stewart Dutfield', 'Liberating Voices'),
(241, 'pattern', 'Strengthening International Law', 'Richard Falk', 'Liberating Voices'),
(242, 'pattern', 'International Networks of Alternative Media', 'Dorothy Kidd', 'Liberating Voices'),
(220, 'pattern', 'Fair Trade', 'Burl Humana', 'Liberating Voices'),
(243, 'pattern', 'Design Stance', 'Rob Knapp', 'Liberating Voices'),
(221, 'pattern', 'Sustainable Design', 'Rob Knapp', 'Liberating Voices'),
(244, 'pattern', 'Open Action and Research Network', 'Douglas Schuler', 'Liberating Voices'),
(208, 'pattern', 'Matrifocal Orientation', 'Lori Blewett', 'Liberating Voices'),
(250, 'pattern', 'Truth and Reconciliation Commissions', 'Helena Meyer-Knapp', 'Liberating Voices'),
(245, 'pattern', 'Alternative Progress Indices', 'Burl Humana', 'Liberating Voices'),
(251, 'pattern', 'Online Deliberation', 'Matt Powell', 'Liberating Voices'),
(246, 'pattern', 'Meaningful Maps', 'Andy Dearden', 'Liberating Voices'),
(222, 'pattern', 'Anti-Racism', 'Lori Blewett', 'Liberating Voices'),
(209, 'pattern', 'Collective Decision-Making', 'Valerie Brown', 'Liberating Voices'),
(223, 'pattern', 'Spiritually Grounded Activism', 'Helena Meyer-Knapp', 'Liberating Voices'),
(252, 'pattern', 'Alternative Media in Hostile Environments', 'Douglas Schuler', 'Liberating Voices'),
(247, 'pattern', 'Citizen Access to Simulations', 'Alan Borning', 'Liberating Voices'),
(253, 'pattern', 'Mutual Help Medical Websites', 'Andy Dearden', 'Liberating Voices'),
(248, 'pattern', 'Culturally Situated Design Tools', 'Ron Eglash', 'Liberating Voices'),
(224, 'pattern', 'Cyberpower', 'Kate Williams', 'Liberating Voices'),
(210, 'pattern', 'Memory and Responsibility', 'Douglas Schuler', 'Liberating Voices'),
(254, 'pattern', 'Indigenous Media', 'Douglas Schuler', 'Liberating Voices'),
(225, 'pattern', 'Earth\\\'s Vital Signs', 'Jenny Frankel-Reed', 'Liberating Voices'),
(226, 'pattern', 'Big-Picture Health Information', 'Jenny Epstein', 'Liberating Voices'),
(227, 'pattern', 'Whole Cost', 'Douglas Schuler', 'Liberating Voices'),
(249, 'pattern', 'Conversational Support Across Boundaries', 'John Thomas', 'Liberating Voices'),
(211, 'pattern', 'Working Class Consciousness', 'Steve Zeltzer', 'Liberating Voices'),
(255, 'pattern', 'Peace Education', 'Helena Meyer-Knapp', 'Liberating Voices'),
(212, 'pattern', 'Back to the Roots', 'Douglas Schuler', 'Liberating Voices'),
(269, 'pattern', 'E-Consultation as Mediation', 'David Newman', 'Liberating Voices'),
(228, 'pattern', 'Indicators', 'Douglas Schuler', 'Liberating Voices'),
(256, 'pattern', 'Intermediate Technologies', 'Justin Smith', 'Liberating Voices'),
(270, 'pattern', 'Participatory Budgeting', 'Andrew Gordon', 'Liberating Voices'),
(257, 'pattern', 'Durable Assets', 'Justin Smith', 'Liberating Voices'),
(271, 'pattern', 'Transaction Tax', 'Burl Humana', 'Liberating Voices'),
(229, 'pattern', 'Public Agenda', 'Douglas Schuler', 'Liberating Voices'),
(258, 'pattern', 'Public Library', 'Stewart Dutfield', 'Liberating Voices'),
(286, 'pattern', 'Value Sensitive Design', 'Batya Friedman', 'Liberating Voices'),
(287, 'pattern', 'Future Design', 'Douglas Schuler', 'Liberating Voices'),
(259, 'pattern', 'Digital Emancipation', 'Gilson Schwartz', 'Liberating Voices'),
(272, 'pattern', 'Powerful Remittances', 'Scott Robinson', 'Liberating Voices'),
(260, 'pattern', 'Community Networks', 'Peter Day', 'Liberating Voices'),
(273, 'pattern', 'Positive Health Information', 'Jenny Epstein', 'Liberating Voices'),
(288, 'pattern', 'Experimental School', 'Douglas Schuler', 'Liberating Voices'),
(261, 'pattern', 'Online Community Service Engine', 'Fiorella De Cindio', 'Liberating Voices'),
(230, 'pattern', 'Democratic Political Settings', 'Jonathan Barker', 'Liberating Voices'),
(274, 'pattern', 'Accessibility of Online Information', 'Robert Luke', 'Liberating Voices'),
(289, 'pattern', 'Service-Learning', 'Norman Clark', 'Liberating Voices'),
(275, 'pattern', 'Open Access Scholarly Publishing', 'John Thomas', 'Liberating Voices'),
(276, 'pattern', 'Mobile ICT Learning Facilities', 'Grant Hearn', 'Liberating Voices'),
(290, 'pattern', 'Citizen Journalism', 'Lewis A. Friedland', 'Liberating Voices'),
(262, 'pattern', 'Community Currencies', 'Burl Humana', 'Liberating Voices'),
(291, 'pattern', 'Document Centered Discussion', 'Todd Davies', 'Liberating Voices'),
(306, 'pattern', 'Engaged Tourism', 'Christine Ciancetta', 'Liberating Voices'),
(263, 'pattern', 'Transparency', 'John B. Adams', 'Liberating Voices'),
(277, 'pattern', 'Grassroots Public Policy Development', 'Douglas Schuler', 'Liberating Voices'),
(292, 'pattern', 'Citizen Diplomacy', 'Douglas Schuler', 'Liberating Voices'),
(307, 'pattern', 'Appropriating Technology', 'Ron Eglash', 'Liberating Voices'),
(278, 'pattern', 'Multi-Party Negotiation for Conflict Resolution', 'Helena Meyer-Knapp', 'Liberating Voices'),
(293, 'pattern', 'Mirror Institutions', 'Douglas Schuler', 'Liberating Voices'),
(279, 'pattern', 'Users\\\' IT Quality Network', 'Aake Walldius', 'Liberating Voices'),
(264, 'pattern', 'Privacy', 'Douglas Schuler', 'Liberating Voices'),
(294, 'pattern', 'Patient Access to Medical Records', 'Amir Hannan', 'Liberating Voices'),
(308, 'pattern', 'Control of Self Representation', 'Douglas Schuler', 'Liberating Voices'),
(295, 'pattern', 'Citizenship Schools', 'Lewis A. Friedland', 'Liberating Voices'),
(309, 'pattern', 'Homemade Media', 'Douglas Schuler', 'Liberating Voices'),
(280, 'pattern', 'Academic Technology Investments', 'Sarah Stein', 'Liberating Voices'),
(265, 'pattern', 'Media Diversity', 'Douglas Schuler', 'Liberating Voices'),
(296, 'pattern', 'Community Building Journalism', 'Peter Miller', 'Liberating Voices'),
(310, 'pattern', 'Arts of Resistance', 'Douglas Schuler', 'Liberating Voices'),
(297, 'pattern', 'Informal Learning Groups', 'Justin Smith', 'Liberating Voices'),
(281, 'pattern', 'Wholesome Design for Wicked Problems', 'Rob Knapp', 'Liberating Voices'),
(311, 'pattern', 'Labor Visions', 'Nancy Brigham', 'Liberating Voices'),
(298, 'pattern', 'Appreciative Collaboration', 'Stewart Dutfield', 'Liberating Voices'),
(266, 'pattern', 'Ethics of Community Informatics Research and Practice', 'Randy Stoecker', 'Liberating Voices'),
(312, 'pattern', 'Universal Voice Mail', 'Jenn Brandon', 'Liberating Voices'),
(299, 'pattern', 'Sustainability Appraisal', 'Nick Plant', 'Liberating Voices'),
(267, 'pattern', 'Free and Fair Elections', 'Douglas Schuler', 'Liberating Voices'),
(313, 'pattern', 'The Power of Story', 'Rebecca Chamberlain', 'Liberating Voices'),
(282, 'pattern', 'Voices of the Unheard', 'John Thomas', 'Liberating Voices'),
(300, 'pattern', 'Shared Vision', 'Stewart Dutfield', 'Liberating Voices'),
(268, 'pattern', 'Equal Access to Justice', 'Donald J Horowitz', 'Liberating Voices'),
(301, 'pattern', 'Community Animators', 'Justin Smith', 'Liberating Voices'),
(314, 'pattern', 'Public Domain Characters', 'John Thomas', 'Liberating Voices'),
(283, 'pattern', 'Design for Unintended Use', 'Erik Stolterman', 'Liberating Voices'),
(302, 'pattern', 'Online Anti-Poverty Community', 'Penny Goldsmith', 'Liberating Voices'),
(284, 'pattern', 'Civic Capabilities', 'Justin Smith', 'Liberating Voices'),
(315, 'pattern', 'Everyday Heroism', 'Douglas Schuler', 'Liberating Voices'),
(303, 'pattern', 'Sense of Struggle', 'Douglas Schuler', 'Liberating Voices'),
(285, 'pattern', 'Strategic Frame', 'Douglas Schuler', 'Liberating Voices'),
(322, 'pattern', 'Illegitimate Theater', 'Mark Harrison', 'Liberating Voices'),
(323, 'pattern', 'Environmental Impact Remediation', 'Douglas Schuler', 'Liberating Voices'),
(304, 'pattern', 'Self-Help Groups', 'Justin Smith', 'Liberating Voices'),
(324, 'pattern', 'Open Source Search Technology', 'Douglas Schuler', 'Liberating Voices'),
(305, 'pattern', 'Self-Designed Development', 'Justin Smith', 'Liberating Voices'),
(325, 'pattern', 'Socially Responsible Video Games', 'Douglas Schuler', 'Liberating Voices'),
(326, 'pattern', 'Open Source Everything', 'John Thomas', 'Liberating Voices'),
(316, 'pattern', 'Telecenters', 'Michel J. Menou', 'Liberating Voices'),
(317, 'pattern', 'Thinking Communities', 'Aldo de Moor', 'Liberating Voices'),
(327, 'pattern', 'Power Research', 'Douglas Schuler', 'Liberating Voices'),
(328, 'pattern', 'Citizens\\\' Tribunal', 'Douglas Schuler', 'Liberating Voices'),
(329, 'pattern', 'Whistle Blowing', 'Tom Carpenter', 'Liberating Voices'),
(318, 'pattern', 'Great Good Place', 'Douglas Schuler', 'Liberating Voices'),
(319, 'pattern', 'Soap Operas with Civic Messages', 'Douglas Schuler', 'Liberating Voices'),
(330, 'pattern', 'Tactical Media', 'Alessandra Renzi', 'Liberating Voices'),
(320, 'pattern', 'Emergency Communication Systems', 'Douglas Schuler', 'Liberating Voices'),
(321, 'pattern', 'Community Inquiry', 'Ann Bishop', 'Liberating Voices'),
(331, 'pattern', 'Media Intervention', 'Douglas Schuler', 'Liberating Voices'),
(332, 'pattern', 'Peaceful Public Demonstrations', 'Douglas Schuler', 'Liberating Voices'),
(333, 'pattern', 'Activist Road Trip', 'Douglas Schuler', 'Liberating Voices'),
(334, 'pattern', 'Follow The Money', 'Burl Humana', 'Liberating Voices'),
(335, 'pattern', 'Retreat and Reflection', 'Douglas Schuler', 'Liberating Voices');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
