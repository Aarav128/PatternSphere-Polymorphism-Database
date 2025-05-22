-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 22, 2025 at 06:57 AM
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
-- Table structure for table `pattern_head`
--

CREATE TABLE `pattern_head` (
  `nid` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `title` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pattern_head`
--

INSERT INTO `pattern_head` (`nid`, `type`, `language`, `title`) VALUES
(200, 'pattern', 'en', 'Civic Intelligence'),
(201, 'pattern', 'en', 'The Commons'),
(202, 'pattern', 'en', 'The Good Life'),
(203, 'pattern', 'en', 'Social Dominance Attenuation'),
(204, 'pattern', 'en', 'Health as a Universal Right'),
(205, 'pattern', 'en', 'Global Citizenship'),
(206, 'pattern', 'en', 'Political Settings'),
(207, 'pattern', 'en', 'Social Responsibility'),
(208, 'pattern', 'en', 'Matrifocal Orientation'),
(209, 'pattern', 'en', 'Collective Decision-Making'),
(210, 'pattern', 'en', 'Memory and Responsibility'),
(211, 'pattern', 'en', 'Working Class Consciousness'),
(212, 'pattern', 'en', 'Back to the Roots'),
(213, 'pattern', 'en', 'Demystification and Reenchantment'),
(214, 'pattern', 'en', 'Translation'),
(215, 'pattern', 'en', 'Linguistic Diversity'),
(216, 'pattern', 'en', 'Education and Values'),
(217, 'pattern', 'en', 'Dematerialization'),
(218, 'pattern', 'en', 'Transforming Institutions'),
(219, 'pattern', 'en', 'Teaching to Transgress'),
(220, 'pattern', 'en', 'Fair Trade'),
(221, 'pattern', 'en', 'Sustainable Design'),
(222, 'pattern', 'en', 'Anti-Racism'),
(223, 'pattern', 'en', 'Spiritually Grounded Activism'),
(224, 'pattern', 'en', 'Cyberpower'),
(225, 'pattern', 'en', 'Earth\\\'s Vital Signs'),
(226, 'pattern', 'en', 'Big-Picture Health Information'),
(227, 'pattern', 'en', 'Whole Cost'),
(228, 'pattern', 'en', 'Indicators'),
(229, 'pattern', 'en', 'Public Agenda'),
(230, 'pattern', 'en', 'Democratic Political Settings'),
(231, 'pattern', 'en', 'Big Tent for Social Change'),
(232, 'pattern', 'en', 'Opportunity Spaces'),
(233, 'pattern', 'en', 'Strategic Capacity'),
(234, 'pattern', 'en', 'Media Literacy'),
(235, 'pattern', 'en', 'Participatory Design'),
(236, 'pattern', 'en', 'Citizen Science'),
(237, 'pattern', 'en', 'Mobile Intelligence'),
(238, 'pattern', 'en', 'Techno-Criticism'),
(239, 'pattern', 'en', 'World Citizen Parliament'),
(240, 'pattern', 'en', 'Economic Conversion'),
(241, 'pattern', 'en', 'Strengthening International Law'),
(242, 'pattern', 'en', 'International Networks of Alternative Media'),
(243, 'pattern', 'en', 'Design Stance'),
(244, 'pattern', 'en', 'Open Action and Research Network'),
(245, 'pattern', 'en', 'Alternative Progress Indices'),
(246, 'pattern', 'en', 'Meaningful Maps'),
(247, 'pattern', 'en', 'Citizen Access to Simulations'),
(248, 'pattern', 'en', 'Culturally Situated Design Tools'),
(249, 'pattern', 'en', 'Conversational Support Across Boundaries'),
(250, 'pattern', 'en', 'Truth and Reconciliation Commissions'),
(251, 'pattern', 'en', 'Online Deliberation'),
(252, 'pattern', 'en', 'Alternative Media in Hostile Environments'),
(253, 'pattern', 'en', 'Mutual Help Medical Websites'),
(254, 'pattern', 'en', 'Indigenous Media'),
(255, 'pattern', 'en', 'Peace Education'),
(256, 'pattern', 'en', 'Intermediate Technologies'),
(257, 'pattern', 'en', 'Durable Assets'),
(258, 'pattern', 'en', 'Public Library'),
(259, 'pattern', 'en', 'Digital Emancipation'),
(260, 'pattern', 'en', 'Community Networks'),
(261, 'pattern', 'en', 'Online Community Service Engine'),
(262, 'pattern', 'en', 'Community Currencies'),
(263, 'pattern', 'en', 'Transparency'),
(264, 'pattern', 'en', 'Privacy'),
(265, 'pattern', 'en', 'Media Diversity'),
(266, 'pattern', 'en', 'Ethics of Community Informatics Research and Practice'),
(267, 'pattern', 'en', 'Free and Fair Elections'),
(268, 'pattern', 'en', 'Equal Access to Justice'),
(269, 'pattern', 'en', 'E-Consultation as Mediation'),
(270, 'pattern', 'en', 'Participatory Budgeting'),
(271, 'pattern', 'en', 'Transaction Tax'),
(272, 'pattern', 'en', 'Powerful Remittances'),
(273, 'pattern', 'en', 'Positive Health Information'),
(274, 'pattern', 'en', 'Accessibility of Online Information'),
(275, 'pattern', 'en', 'Open Access Scholarly Publishing'),
(276, 'pattern', 'en', 'Mobile ICT Learning Facilities'),
(277, 'pattern', 'en', 'Grassroots Public Policy Development'),
(278, 'pattern', 'en', 'Multi-Party Negotiation for Conflict Resolution'),
(279, 'pattern', 'en', 'Users\\\' IT Quality Network'),
(280, 'pattern', 'en', 'Academic Technology Investments'),
(281, 'pattern', 'en', 'Wholesome Design for Wicked Problems'),
(282, 'pattern', 'en', 'Voices of the Unheard'),
(283, 'pattern', 'en', 'Design for Unintended Use'),
(284, 'pattern', 'en', 'Civic Capabilities'),
(285, 'pattern', 'en', 'Strategic Frame'),
(286, 'pattern', 'en', 'Value Sensitive Design'),
(287, 'pattern', 'en', 'Future Design'),
(288, 'pattern', 'en', 'Experimental School'),
(289, 'pattern', 'en', 'Service-Learning'),
(290, 'pattern', 'en', 'Citizen Journalism'),
(291, 'pattern', 'en', 'Document Centered Discussion'),
(292, 'pattern', 'en', 'Citizen Diplomacy'),
(293, 'pattern', 'en', 'Mirror Institutions'),
(294, 'pattern', 'en', 'Patient Access to Medical Records'),
(295, 'pattern', 'en', 'Citizenship Schools'),
(296, 'pattern', 'en', 'Community Building Journalism'),
(297, 'pattern', 'en', 'Informal Learning Groups'),
(298, 'pattern', 'en', 'Appreciative Collaboration'),
(299, 'pattern', 'en', 'Sustainability Appraisal'),
(300, 'pattern', 'en', 'Shared Vision'),
(301, 'pattern', 'en', 'Community Animators'),
(302, 'pattern', 'en', 'Online Anti-Poverty Community'),
(303, 'pattern', 'en', 'Sense of Struggle'),
(304, 'pattern', 'en', 'Self-Help Groups'),
(305, 'pattern', 'en', 'Self-Designed Development'),
(306, 'pattern', 'en', 'Engaged Tourism'),
(307, 'pattern', 'en', 'Appropriating Technology'),
(308, 'pattern', 'en', 'Control of Self Representation'),
(309, 'pattern', 'en', 'Homemade Media'),
(310, 'pattern', 'en', 'Arts of Resistance'),
(311, 'pattern', 'en', 'Labor Visions'),
(312, 'pattern', 'en', 'Universal Voice Mail'),
(313, 'pattern', 'en', 'The Power of Story'),
(314, 'pattern', 'en', 'Public Domain Characters'),
(315, 'pattern', 'en', 'Everyday Heroism'),
(316, 'pattern', 'en', 'Telecenters'),
(317, 'pattern', 'en', 'Thinking Communities'),
(318, 'pattern', 'en', 'Great Good Place'),
(319, 'pattern', 'en', 'Soap Operas with Civic Messages'),
(320, 'pattern', 'en', 'Emergency Communication Systems'),
(321, 'pattern', 'en', 'Community Inquiry'),
(322, 'pattern', 'en', 'Illegitimate Theater'),
(323, 'pattern', 'en', 'Environmental Impact Remediation'),
(324, 'pattern', 'en', 'Open Source Search Technology'),
(325, 'pattern', 'en', 'Socially Responsible Video Games'),
(326, 'pattern', 'en', 'Open Source Everything'),
(327, 'pattern', 'en', 'Power Research'),
(328, 'pattern', 'en', 'Citizens\\\' Tribunal'),
(329, 'pattern', 'en', 'Whistle Blowing'),
(330, 'pattern', 'en', 'Tactical Media'),
(331, 'pattern', 'en', 'Media Intervention'),
(332, 'pattern', 'en', 'Peaceful Public Demonstrations'),
(333, 'pattern', 'en', 'Activist Road Trip'),
(334, 'pattern', 'en', 'Follow The Money'),
(335, 'pattern', 'en', 'Retreat and Reflection');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pattern_head`
--
ALTER TABLE `pattern_head`
  ADD PRIMARY KEY (`nid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
