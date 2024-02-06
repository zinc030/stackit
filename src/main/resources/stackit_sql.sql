/*
 Navicat Premium Data Transfer

 Source Server         : local_mariadb
 Source Server Type    : MariaDB
 Source Server Version : 110102
 Source Host           : localhost:3306
 Source Schema         : blaze

 Target Server Type    : MariaDB
 Target Server Version : 110102
 File Encoding         : 65001

 Date: 06/02/2024 15:20:34
*/

Drop DATABASE IF EXISTS `stack_it`;
CREATE DATABASE stack_it;
USE stack_it;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for analysis_image
-- ----------------------------
DROP TABLE IF EXISTS `analysis_image`;
CREATE TABLE `analysis_image`  (
  `id` bigint(20) NOT NULL,
  `analysis_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `week_start_date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of analysis_image
-- ----------------------------

-- ----------------------------
-- Table structure for analysis_image_seq
-- ----------------------------
DROP TABLE IF EXISTS `analysis_image_seq`;
CREATE TABLE `analysis_image_seq`  (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL,
  `increment` bigint(21) NOT NULL,
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL,
  `cycle_count` bigint(21) NOT NULL 
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of analysis_image_seq
-- ----------------------------
INSERT INTO `analysis_image_seq` VALUES (1, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

-- ----------------------------
-- Table structure for awards
-- ----------------------------
DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year_received` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKr7cny6c0c8o3qliscb81psq6u`(`resume_id`) USING BTREE,
  CONSTRAINT `FKr7cny6c0c8o3qliscb81psq6u` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of awards
-- ----------------------------

-- ----------------------------
-- Table structure for certificates
-- ----------------------------
DROP TABLE IF EXISTS `certificates`;
CREATE TABLE `certificates`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year_obtained` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpigjjvduir8qrfylksdounwfg`(`resume_id`) USING BTREE,
  CONSTRAINT `FKpigjjvduir8qrfylksdounwfg` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of certificates
-- ----------------------------

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num_emp` int(11) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 'OpenAI', 770, 'OpenAI is a U.S. based artificial intelligence (AI) research organization founded in December 2015, researching artificial intelligence with the goal of developing \"safe and beneficial\" artificial general intelligence, which it defines as \"highly autonomous systems that outperform humans at most economically valuable work\".[5] As one of the leading organizations of the AI Spring,[6][7][8] it has developed several large language models, advanced image generation models, and previously, released open-source models.[9][10] Its release of ChatGPT has been credited with starting the artificial intelligence spring.');
INSERT INTO `companies` VALUES (2, 'Google', 139995, 'Google LLC is an American multinational technology company focusing on artificial intelligence, online advertising, search engine technology, cloud computing, computer software, quantum computing, e-commerce, and consumer electronics. It has been referred to as \"the most powerful company in the world\" and as one of the world\'s most valuable brands due to its market dominance, data collection, and technological advantages in the field of artificial intelligence. Google\'s parent company Alphabet Inc. is one of the five Big Tech companies, alongside Amazon, Apple Inc., Meta, and Microsoft. ');
INSERT INTO `companies` VALUES (3, 'Microsoft', 238000, 'Microsoft Corporation is an American multinational technology corporation headquartered in Redmond, Washington. Microsoft\'s best-known software products are the Windows line of operating systems, the Microsoft 365 suite of productivity applications, and the Edge web browser. Its flagship hardware products are the Xbox video game consoles and the Microsoft Surface lineup of touchscreen personal computers. Microsoft ranked No. 14 in the 2022 Fortune 500 rankings of the largest United States corporations by total revenue;[3] it was the world\'s largest software maker by revenue as of 2022. It is considered one of the Big Five American information technology companies, alongside Alphabet (parent company of Google), Amazon, Apple, and Meta (parent company of Facebook). ');
INSERT INTO `companies` VALUES (4, 'Netflix', 12800, 'Netflix, Inc. is an American media company founded in 1997 by Reed Hastings and Marc Randolph in Scotts Valley, California and currently based in Los Gatos, California. It owns and operates an eponymous over-the-top subscription video on-demand service, which showcases acquired and original programming as well as third-party content licensed from other production companies and distributors. Netflix is also the first (and so far only) streaming media company to be a member of the Motion Picture Association. ');
INSERT INTO `companies` VALUES (5, 'Apple', 161000, 'Apple Inc. (formerly Apple Computer, Inc.) is a multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services. Devices include the iPhone, iPad, Mac, Apple Watch, and Apple TV; operating systems include iOS and macOS; and software applications and services include iTunes, iCloud, and Apple Music. ');
INSERT INTO `companies` VALUES (6, 'Adobe', 29239, 'Adobe Inc., formerly Adobe Systems Incorporated, is an American multinational computer software company incorporated in Delaware[4] and headquartered in San Jose, California. It has historically specialized in software for the creation and publication of a wide range of content, including graphics, photography, illustration, animation, multimedia/video, motion pictures, and print. Its flagship products include Adobe Photoshop image editing software; Adobe Illustrator vector-based illustration software; Adobe Acrobat Reader and the Portable Document Format (PDF); and a host of tools primarily for audio-visual content creation, editing and publishing. Adobe offered a bundled solution of its products named Adobe Creative Suite, which evolved into a subscription software as a service (SaaS) offering named Adobe Creative Cloud.[5] The company also expanded into digital marketing software and in 2021 was considered one of the top global leaders in Customer Experience Management (CXM).');
INSERT INTO `companies` VALUES (7, 'Niantic', 800, 'Niantic, Inc. (/naɪˈæntɪk/ ny-AN-tik)[2] is an American software development company based in San Francisco. Niantic is best known for developing the augmented reality mobile games Ingress and Pokémon Go. The company was formed as Niantic Labs in 2010 as an internal startup within Google. The company became an independent entity in October 2015 when Google restructured under Alphabet Inc.[3] Niantic has additional offices in Bellevue, Los Angeles, Sunnyvale, Seattle, Lawrence, Tokyo, London, Hamburg, and Zurich.');

-- ----------------------------
-- Table structure for company_review_reports
-- ----------------------------
DROP TABLE IF EXISTS `company_review_reports`;
CREATE TABLE `company_review_reports`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_review_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3l0om8ipu12e868ilkn34bijj`(`company_review_id`) USING BTREE,
  INDEX `FK5bk42y9sldioo09a30kp2nvjy`(`user_id`) USING BTREE,
  CONSTRAINT `FK3l0om8ipu12e868ilkn34bijj` FOREIGN KEY (`company_review_id`) REFERENCES `company_reviews` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5bk42y9sldioo09a30kp2nvjy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company_review_reports
-- ----------------------------

-- ----------------------------
-- Table structure for company_reviews
-- ----------------------------
DROP TABLE IF EXISTS `company_reviews`;
CREATE TABLE `company_reviews`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `con` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(6) NULL DEFAULT NULL,
  `pro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rating` tinyint(4) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sw_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_date` datetime(6) NULL DEFAULT NULL,
  `vote_count` int(11) NOT NULL DEFAULT 0,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK6i7rutwg0181bvji5m6noj3ve`(`user_id`, `company_id`, `sw_field`) USING BTREE,
  INDEX `FKkpjxpw5kl37cad0twqje6cq63`(`company_id`) USING BTREE,
  CONSTRAINT `FKjlwevafsv6wcpvt0jg5tfs1f0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkpjxpw5kl37cad0twqje6cq63` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `degree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjyor7xegks1vh01tajsof6gb4`(`resume_id`) USING BTREE,
  CONSTRAINT `FKjyor7xegks1vh01tajsof6gb4` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of education
-- ----------------------------

-- ----------------------------
-- Table structure for helpful_votes
-- ----------------------------
DROP TABLE IF EXISTS `helpful_votes`;
CREATE TABLE `helpful_votes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK7385ycgwtavlufo8crg8b3m0n`(`user_id`, `review_id`) USING BTREE,
  INDEX `FK33rjy035wuhcio57qplry4l2g`(`review_id`) USING BTREE,
  CONSTRAINT `FK33rjy035wuhcio57qplry4l2g` FOREIGN KEY (`review_id`) REFERENCES `company_reviews` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtjmd1qxspgubw6oxkrkxhe6nx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of helpful_votes
-- ----------------------------

-- ----------------------------
-- Table structure for job_posts
-- ----------------------------
DROP TABLE IF EXISTS `job_posts`;
CREATE TABLE `job_posts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company_id` bigint(20) NULL DEFAULT NULL,
  `sw_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `salary` decimal(38, 2) NULL DEFAULT NULL,
  `employment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `seniority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(6) NULL DEFAULT NULL,
  `updated_date` datetime(6) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKdo1ciglrqsfeh828xjf622bvr`(`company_id`) USING BTREE,
  CONSTRAINT `FKdo1ciglrqsfeh828xjf622bvr` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_posts
-- ----------------------------
INSERT INTO `job_posts` VALUES (1, 'Software Frontend Development Engineer- TypeScript', 6, 'FRONTEND', 124000.00, 'FULLTIME', 'ENTRY', 'Our Company\r\n\r\nChanging the world through digital experiences is what Adobe’s all about. We give everyone—from emerging artists to global brands—everything they need to design and deliver exceptional digital experiences! We’re passionate about empowering people to create beautiful and powerful images, videos, and apps, and transform how companies interact with customers across every screen. \r\n\r\nWe’re on a mission to hire the very best and are committed to creating exceptional employee experiences where everyone is respected and has access to equal opportunity. We realize that new ideas can come from everywhere in the organization, and we know the next big idea could be yours!\r\n\r\n\r\n \r\nThe challenge\r\n\r\nAdobe Express is an all-in-one design, photo, and video tool to make content creation easy. Quickly and easily make spectacular social content, videos, logos, and more to stand out on social and beyond.\r\n\r\nThe Express team is on a mission to build the most sophisticated, delightful and innovative editing experience for everything image, video and beyond, by pushing the boundaries of web technologies.\r\n\r\nWe are looking for an expert front-end engineer to add to the Imaging team, well rounded in the topics of web, browsers, design, architecture and image processing.\r\n\r\nWe are working in a large-scale project, yet as an independent autonomous team, and you will be able to take ownership and contribute to significant parts of the product, bringing life to features used by millions of users.\r\n\r\nWhat you’ll do\r\n\r\n    Build amazing features in the Adobe Express product\r\n    Write high quality, production ready code\r\n    Use advanced web technologies\r\n    Apply groundbreaking technologies including AI/ML image and content generation\r\n    Contribute to an architecturally complex project\r\n    Be part of a team of exceptional engineers, designers, product and customer-experience experts\r\n    Operate a high reliability and stability SaaS product\r\n    Have the opportunity to define and influence features, priorities and roadmap\r\n    Work as part of a distributed team, active member of product and project communication channels\r\n\r\nWhat you need to succeed\r\n\r\n    Excellent proficiency in JavaScript, TypeScript, and in-depth knowledge of browser web technologies\r\n    Proficient in using/configuring the tooling to build, test and deliver large JavaScript/TypeScript applications (npm, rush, testing frameworks, node.js, headless)\r\n    Experience doing image processing, manipulation, compositing, or computer vision\r\n    Experience working effectively and operating independently in large software projects\r\n    Experience with web components, or proficient in one mainstream UI frameworks (React, Angular, etc.)\r\n    Design and architecture experience for complex front-end applications\r\n    Experience in improving memory and time performance in applications (web or native)\r\n    Knowledge and experience of browser technologies like WebGL, wasm, web workers, service workers, caching, local storage, debugging and profiling tools\r\n    Experience doing agile estimation, planning and working in an agile team\r\n    Customer insight and passion for a delightful user experience\r\n\r\nWhat will set you apart\r\n\r\nThese are nice to haves and should not discourage you from applying\r\n\r\n    Substantial public git portfolio to showcase your skills and passion for coding\r\n    Proven experience in anything computer vision, graphic rendering, 2D or 3D, AR/VR, 3D engines\r\n    Notable public media content (blogs, channels) or public presentations\r\n    Individual research or papers on any relevant technical topics\r\n\r\nOur compensation reflects the cost of labor across several  U.S. geographic markets, and we pay differently based on those defined markets. The U.S. pay range for this position is $124,000 -- $234,200 annually. Pay within this range varies by work location and may also depend on job-related knowledge, skills, and experience. Your recruiter can share more about the specific salary range for the job location during the hiring process.\r\n\r\nAt Adobe, for sales roles starting salaries are expressed as total target compensation (TTC = base + commission), and short-term incentives are in the form of sales commission plans.  Non-sales roles starting salaries are expressed as base salary and short-term incentives are in the form of the Annual Incentive Plan (AIP).\r\n\r\nIn addition, certain roles may be eligible for long-term incentives in the form of a new hire equity award.\r\n\r\nAdobe is proud to be an Equal Employment Opportunity and affirmative action employer. We do not discriminate based on gender, race or color, ethnicity or national origin, age, disability, religion, sexual orientation, gender identity or expression, veteran status, or any other applicable characteristics protected by law. Learn more.\r\n \r\n\r\nAdobe aims to make Adobe.com accessible to any and all users. If you have a disability or special need that requires accommodation to navigate our website or complete the application process, email accommodations@adobe.com or call (408) 536-3015.\r\n\r\nAdobe values a free and open marketplace for all employees and has policies in place to ensure that we do not enter into illegal agreements with other companies to not recruit or hire each other’s employees.', 'San Francisco, California, United States of America', '2024-01-04 09:56:09.000000', NULL, 'https://careers.adobe.com/us/en/job/R142206/Software-Frontend-Development-Engineer-TypeScript');
INSERT INTO `job_posts` VALUES (2, '2024 Intern - Data Engineer', 6, 'DATA_ENGINEER', 93600.00, 'INTERNSHIP', 'INTERNSHIP', 'Our Company\r\n\r\nChanging the world through digital experiences is what Adobe’s all about. We give everyone—from emerging artists to global brands—everything they need to design and deliver exceptional digital experiences! We’re passionate about empowering people to create beautiful and powerful images, videos, and apps, and transform how companies interact with customers across every screen. \r\n\r\nWe’re on a mission to hire the very best and are committed to creating exceptional employee experiences where everyone is respected and has access to equal opportunity. We realize that new ideas can come from everywhere in the organization, and we know the next big idea could be yours!\r\n\r\n\r\n \r\n\r\nThe Opportunity\r\n\r\nThe Adobe Data Science team is looking for summer interns. The team applies AI and machine learning techniques to big customer data to address and challenge business problems, such as driving go-to-market strategies, sales prioritization, increasing product engagement and customer service improvement.\r\n\r\nAll 2024 Adobe interns will be ‘co-located hybrid. This means that interns will be assigned to an Adobe office location, but in-office schedules will be flexible and determined by team. All interns must live in the same state, country, and within commuting distance of their assigned Adobe office so they can be on-site as needed.\r\n\r\nWhat You’ll Do\r\n\r\n· Extract and analyze data to understand the customer product life cycle and value realization from the product\r\n\r\n· Identify and report product features of high and low usage\r\n\r\n· Develop dashboards/reports that provide useful insights to business leaders\r\n\r\n· Develop scripts to automate data extraction from product databases\r\n\r\n· Develop in-house analytical tools that improve the productivity and efficiency of analytical tasks\r\n\r\nWhat You Need to Succeed\r\n\r\n· Currently enrolled full time and pursuing a Master’s in Statistics, Mathematics, or Engineering is desired; or equivalent experience required\r\n\r\n· Solid understanding of SQL and R/Python\r\n\r\n· Understanding of statistical modeling/machine learning/ data mining concepts, and a track record solving problems with these methods.\r\n\r\n· Ability to apply statistical/machine learning techniques such as hypothesis testing, time series forecasting, linear and logistic regression, random forests, etc.\r\n\r\n· Ability to participate in a full-time internship between May-September\r\n\r\nOur compensation reflects the cost of labor across several  U.S. geographic markets, and we pay differently based on those defined markets. The U.S. pay range for this position is $45.00 -- $55.00 hourly. Your recruiter can share more about the specific pay rate for your job location during the hiring process.\r\n\r\nAdobe is proud to be an Equal Employment Opportunity and affirmative action employer. We do not discriminate based on gender, race or color, ethnicity or national origin, age, disability, religion, sexual orientation, gender identity or expression, veteran status, or any other applicable characteristics protected by law. Learn more.\r\n \r\n\r\nAdobe aims to make Adobe.com accessible to any and all users. If you have a disability or special need that requires accommodation to navigate our website or complete the application process, email accommodations@adobe.com or call (408) 536-3015.\r\n\r\nAdobe values a free and open marketplace for all employees and has policies in place to ensure that we do not enter into illegal agreements with other companies to not recruit or hire each other’s employees.', 'San Jose, California, United States', '2023-11-15 10:00:07.000000', NULL, 'https://careers.adobe.com/us/en/job/ADOBUSR141238EXTERNALENUS/');
INSERT INTO `job_posts` VALUES (3, 'Software Engineer, Fullstack', 7, 'FULLSTACK', 135000.00, 'FULLTIME', 'ENTRY', 'Niantic’s mission is to use emerging technology to enrich our experiences as human beings in the physical world. We build products that inspire movement, exploration, and face-to-face social interaction.\r\n\r\nNiantic’s Geodata Team is seeking an adventurous Software Engineer, Server/Full Stack. We seek engineers with strong technical background, great execution, and a self-starter mentality. The ideal candidate loves to jump into the unknown, clarify ambiguities, quickly learn from failures, and break down vague ideas into concrete tasks.\r\n\r\nResponsibilities\r\n\r\n    Create robust, low-latency, scalable systems that support Niantic’s products.\r\n    Design the RPC protocols and implement server-side features in Java.\r\n    Architect and implement web features in Javascript/Typescript.\r\n    Build well-designed, reusable UI components that can be shared across Niantic’s web applications.\r\n    Participate in code reviews, write unit tests, and conduct troubleshooting to ensure uptime for live systems.\r\n    Collaborate with cross-functional team members and stakeholders to cultivate strong working relationships with project team members, including regular and reliable attendance and participation in meetings.\r\n    Required in-office 2 days on Tuesday and Wednesday.\r\n\r\nQualifications\r\n\r\n    BS, MS, or PhD in Computer Science, or a related technical field.\r\n    Proficiency in one of the following: Java, Groovy, React, or JavaScript concepts like asynchronous programming, closure types.\r\n    Familiar with Node and Express for backend development.\r\n    Ability to work in a fast-paced environment and handle stress appropriately and/or ability to solve practical problems and be sufficiently adaptable to handle dynamic situations with little advance notice.\r\n    Experience working on cross-functional teams with ability to communicate effectively through written and verbal communications, including synchronous interactions with others.\r\n\r\nPlus If...\r\n\r\n    Delivered solutions to production environments, and provided tools to monitor, support and mitigate any issues.\r\n    Familiarity with Kubernetes, infrastructure as code (such as Terraform).\r\n    Experience with deployment on hosting providers, such as Google Cloud, Azure or AWS.\r\n    Experience building web applications involving manipulation of geospatial, customer management, or analytics data.\r\n    Experience mentoring junior engineers or leading projects.\r\n\r\nThe total compensation package for this position includes a new hire offer base salary range of $135,000 - $150,000 + bonus + equity + benefits.\r\n\r\nIndividual pay within this salary range is determined by work location and additional factors, including assessed job-related skills, experience, and relevant education or training. Your recruiter can answer any questions about new hire total compensation during the hiring process. An overview of benefit offerings for your location can be found on the careers page.\r\n\r\nJoin the Niantic team!\r\n\r\nNiantic\'s global-scale augmented reality platform and digital map powers spatial computing experiences in the real world. Incubated out of the Maps team at Google, Niantic first created Ingress and then Pokémon GO, a cultural phenomenon and hit game played by tens of millions of people each month. Niantic’s Lightship platform, which powers Pokémon GO, also supports the company\'s other games including Pikmin Bloom, Peridot and Monster Hunter Now. Developers use Niantic’s platform to build their own AR applications and experiences, either with the Lightship Platform or directly through the web with 8th Wall.\r\n\r\nWe believe that cultivating a workplace where our people are supported and included is essential to creating great products our community will love. Our mission emphasizes seeking and hiring diverse voices, including those who are traditionally underrepresented in the technology industry, and we consider this to be one of the most important values we hold close.\r\n\r\nNiantic is a hybrid first company. We believe that in person interaction and collaboration fosters creativity, a sense of community, and is critical to our future success as a company. Our hybrid work schedules allow for a mix of remote and in-office work.\r\n\r\nWe\'re a hard-working, fun, and exciting group who value intellectual curiosity and a passion for problem-solving! We have growing offices located in San Francisco, Sunnyvale, Palo Alto, Bellevue, Kansas, London, Tokyo, Hamburg, Hyderabad, and Zurich.', 'San Francisco, California, United States of America', '2024-01-20 10:04:33.000000', NULL, 'https://boards.greenhouse.io/niantic/jobs/7069819002');
INSERT INTO `job_posts` VALUES (4, 'Software Engineer, Backend', 1, 'BACKEND', 160000.00, 'FULLTIME', 'ENTRY', 'About The Team\r\n\r\nWe bring OpenAI\'s technology to the world through products like ChatGPT and the OpenAI API.\r\n\r\nWe seek to learn from deployment and distribute the benefits of AI, while ensuring that this powerful tool is used responsibly and safely. Safety is more important to us than unfettered growth.\r\n\r\nAbout The Role\r\n\r\nAs OpenAI scales, we’re looking for experienced, problem-solving engineers to build new products and scale our systems. Our success depends on our ability to quickly iterate on products while also ensuring that they are performant and reliable.\r\n\r\nYou’ll work in a deeply iterative, collaborative, fast-paced environment to bring our technology to millions of users around the world, and ensure it’s delivered with safety and reliability in mind.\r\n\r\nIn This Role, You Will\r\n\r\n    Design and build the development and production platforms that power ChatGPT, enabling reliability and security at scale\r\n    Partner with researchers, engineers, product managers, and designers to bring new features and research capabilities to the world\r\n    Accelerate engineering productivity by empowering your fellow engineers with excellent tooling and systems\r\n    Help create a diverse, equitable, and inclusive culture that makes all feel welcome while enabling radical candor and the challenging of group think\r\n    Like all other teams, we are responsible for the reliability of the systems we build. This includes an on-call rotation to respond to critical incidents as needed\r\n\r\nYou Might Thrive In This Role If You\r\n\r\n    Have meaningful experience with building (and rebuilding) production systems to deliver new product capabilities and to handle increasing scale\r\n    Care deeply about the end user experience and take pride in building products to solve customer needs\r\n    Have a humble attitude, an eagerness to help your colleagues, and a desire to do whatever it takes to make the team succeed\r\n    Own problems end-to-end, and are willing to pick up whatever knowledge you\'re missing to get the job done\r\n    Build tools to accelerate your own (and your teammates’) workflows, but only when off-the-shelf solutions won’t do\r\n    Have been a startup founder or an early-stage engineer\r\n\r\nCompensation, Benefits And Perks\r\n\r\nTotal compensation also includes generous equity and benefits.\r\n\r\n    Medical, dental, and vision insurance for you and your family\r\n    Mental health and wellness support\r\n    401(k) plan with 4% matching\r\n    Unlimited time off and 18+ company holidays per year\r\n    Paid parental leave (20 weeks) and family-planning support\r\n    Annual learning & development stipend ($1,500 per year)\r\n\r\nAnnual Salary Range\r\n\r\n$160,000—$385,000 USD\r\n\r\nAbout OpenAI\r\n\r\nOpenAI is an AI research and deployment company dedicated to ensuring that general-purpose artificial intelligence benefits all of humanity. We push the boundaries of the capabilities of AI systems and seek to safely deploy them to the world through our products. AI is an extremely powerful tool that must be created with safety and human needs at its core, and to achieve our mission, we must encompass and value the many different perspectives, voices, and experiences that form the full spectrum of humanity.\r\n\r\nWe are an equal opportunity employer and do not discriminate on the basis of race, religion, national origin, gender, sexual orientation, age, veteran status, disability or any other legally protected status.\r\n\r\nFor US Based Candidates: Pursuant to the San Francisco Fair Chance Ordinance, we will consider qualified applicants with arrest and conviction records.\r\n\r\nWe are committed to providing reasonable accommodations to applicants with disabilities, and requests can be made via this link.\r\n\r\nOpenAI Global Applicant Privacy Policy\r\n\r\nAt OpenAI, we believe artificial intelligence has the potential to help people solve immense global challenges, and we want the upside of AI to be widely shared. Join us in shaping the future of technology. ', 'San Francisco, California, United States of America', '2024-01-25 10:11:10.000000', NULL, 'https://boards.greenhouse.io/embed/job_app?token=4937768004&gh_src=fa4a4d7b4us');
INSERT INTO `job_posts` VALUES (5, 'Analytics Data Engineer, Applied Engineering', 1, 'DATA_ENGINEER', 245000.00, 'FULLTIME', 'ENTRY', 'About The Team\r\n\r\nThe Applied team works across research, engineering, product, and design to bring OpenAI’s technology to consumers and businesses.\r\n\r\nWe seek to learn from deployment and distribute the benefits of AI, while ensuring that this powerful tool is used responsibly and safely. Safety is more important to us than unfettered growth.\r\n\r\nAbout The Role\r\n\r\nWe\'re seeking a Data Engineer to take the lead in building our data pipelines and core tables for OpenAI. These pipelines are crucial for powering analyses, safety systems that guide business decisions, product growth, and prevent bad actors. If you\'re passionate about working with data and are eager to create solutions with significant impact, we\'d love to hear from you. This role also provides the opportunity to collaborate closely with the researchers behind ChatGPT and help them train new models to deliver to users. As we continue our rapid growth, we value data-driven insights, and your contributions will play a pivotal role in our trajectory. Join us in shaping the future of OpenAI!\r\n\r\nIn This Role, You Will\r\n\r\n    Design, build and manage our data pipelines, ensuring all user event data is seamlessly integrated into our data warehouse.\r\n    Develop canonical datasets to track key product metrics including user growth, engagement, and revenue.\r\n    Work collaboratively with various teams, including, Infrastructure, Data Science, Product, Marketing, Finance, and Research to understand their data needs and provide solutions.\r\n    Implement robust and fault-tolerant systems for data ingestion and processing.\r\n    Participate in data architecture and engineering decisions, bringing your strong experience and knowledge to bear.\r\n    Ensure the security, integrity, and compliance of data according to industry and company standards.\r\n\r\nYou Might Thrive In This Role If You\r\n\r\n    Have 3+ years of experience as a data engineer and 8+ years of any software engineering experience(including data engineering).\r\n    Proficiency in at least one programming language commonly used within Data Engineering, such as Python, Scala, or Java.\r\n    Experience with distributed processing technologies and frameworks, such as Hadoop, Flink and distributed storage systems (e.g., HDFS, S3).\r\n    Expertise with any of ETL schedulers such as Airflow, Dagster, Prefect or similar frameworks.\r\n    Solid understanding of Spark and ability to write, debug and optimize Spark code.\r\n\r\nThis role is exclusively based in our San Francisco HQ. We offer relocation assistance to new employees.\r\n\r\nCompensation, Benefits And Perks\r\n\r\nTotal compensation also includes generous equity and benefits.\r\n\r\n    Medical, dental, and vision insurance for you and your family\r\n    Mental health and wellness support\r\n    401(k) plan with 4% matching\r\n    Unlimited time off and 18+ company holidays per year\r\n    Paid parental leave (20 weeks) and family-planning support\r\n    Annual learning & development stipend ($1,500 per year)\r\n\r\nAnnual Salary Range\r\n\r\n$245,000—$385,000 USD\r\n\r\nAbout OpenAI\r\n\r\nOpenAI is an AI research and deployment company dedicated to ensuring that general-purpose artificial intelligence benefits all of humanity. We push the boundaries of the capabilities of AI systems and seek to safely deploy them to the world through our products. AI is an extremely powerful tool that must be created with safety and human needs at its core, and to achieve our mission, we must encompass and value the many different perspectives, voices, and experiences that form the full spectrum of humanity.\r\n\r\nWe are an equal opportunity employer and do not discriminate on the basis of race, religion, national origin, gender, sexual orientation, age, veteran status, disability or any other legally protected status.\r\n\r\nFor US Based Candidates: Pursuant to the San Francisco Fair Chance Ordinance, we will consider qualified applicants with arrest and conviction records.\r\n\r\nWe are committed to providing reasonable accommodations to applicants with disabilities, and requests can be made via this link.\r\n\r\nOpenAI Global Applicant Privacy Policy\r\n\r\nAt OpenAI, we believe artificial intelligence has the potential to help people solve immense global challenges, and we want the upside of AI to be widely shared. Join us in shaping the future of technology. ', 'San Francisco, California, United States of America', '2024-01-25 10:13:25.000000', NULL, 'https://boards.greenhouse.io/openai/jobs/4984172004?t=fa4a4d7b4us');
INSERT INTO `job_posts` VALUES (6, 'Data Engineer(L5)', 4, 'DATA_ENGINEER', 150000.00, 'FULLTIME', NULL, 'At Netflix, our mission is to entertain the world. With 200+ million paid members in over 190 countries on millions of devices; enjoying TV series, documentaries, and feature films across a wide variety of genres and languages - Netflix is reinventing entertainment from end to end. We are revolutionizing how shows and movies are produced, pushing technological boundaries to efficiently deliver streaming video at a massive scale over the internet, and continuously improving the end-to-end user experience with Netflix across their member journey.\r\n\r\nWe pride ourselves on using data to inform our decision-making as we work towards our mission. This requires curating data across various domains such as Growth, Finance, Product, Content, and Studio. All of this data collection and curation is made possible thanks to the amazing Data Engineers of Netflix who bring this data to life.\r\n\r\nData Engineering at Netflix is a role that requires building systems to process data efficiently and modeling the data to power analytics. These solutions can range from batch data pipelines that bring to life business metrics to real-time processing services that integrate with our core product features. In addition, we require our Data Engineers to have a rich understanding of large distributed systems on which our data solutions rely. Candidates should have knowledge across several of these skill sets and usually need to be deep in at least one. As a Data Engineer, you also need to have strong communication skills since you will need to collaborate with business, engineering, and data science teams to enable a culture of learning. Learn more about the work of data engineers at Netflix.\r\n\r\nLocation of work: We are considering candidates who are willing to relocate to Los Gatos, California, as well as fully-remote candidates (remote in the US with occasional visits to Los Gatos) depending on the team your skills are most aligned with.\r\n\r\nWho are you?\r\n\r\n\r\n    You strive to write elegant code, and you\'re comfortable with picking up new technologies independently\r\n    You are proficient in at least one major programming language (e.g. Java, Scala, Python) and comfortable working with SQL\r\n    You enjoy helping teams push the boundaries of analytical insights, creating new product features using data, and powering machine learning models\r\n    You have a strong background in at least one of the following: distributed data processing or software engineering of data services, or data modeling\r\n    You are familiar with big data technologies like Spark or Flink and comfortable working with web-scale datasets\r\n    You have an eye for detail, good data intuition, and a passion for data quality\r\n    You appreciate the importance of great documentation and data debugging skills\r\n    You relate to and embody many of the aspects of the Netflix Culture. You love working independently while also collaborating and giving/receiving candid feedback\r\n    You are comfortable working in a rapidly changing environment with ambiguous requirements. You are nimble and take intelligent risks\r\n\r\n\r\nOur compensation structure consists solely of an annual salary; we do not have bonuses. You choose each year how much of your compensation you want in salary versus stock options. To determine your personal top of market compensation, we rely on market indicators and consider your specific job family, background, skills, and experience to determine your compensation in the market range. The range for this role is $150,000 - $750,000.\r\n\r\nNetflix provides comprehensive benefits including Health Plans, Mental Health support, a 401(k) Retirement Plan with employer match, Stock Option Program, Disability Programs, Health Savings and Flexible Spending Accounts, Family-forming benefits, and Life and Serious Injury Benefits. We also offer paid leave of absence programs. Full-time hourly employees accrue 35 days annually for paid time off to be used for vacation, holidays, and sick paid time off. Full-time salaried employees are immediately entitled to flexible time off. See more detail about our Benefits here.\r\n\r\nNetflix is a unique culture and environment. Learn more here. ', 'Remote, United States', '2024-01-11 10:16:39.000000', NULL, 'https://jobs.netflix.com/jobs/301551734');
INSERT INTO `job_posts` VALUES (7, 'Full Stack Engineer 5 - Experimentation Platform', 4, 'FULLSTACK', 150000.00, 'FULLTIME', NULL, 'Netflix is one of the world\'s leading streaming entertainment services, with over 247 million members in over 190 countries enjoying TV series, documentaries, feature films, and mobile games across various genres and languages. Members can play, pause, and resume watching as they want, anytime, anywhere, and change their plans anytime.\r\n\r\nA culture of experimentation and data-informed decision-making allows Netflix to continuously evolve and improve all aspects of the product, delivering more joy to existing members and attracting new members from around the globe. The nerve center of experimentation at Netflix is our internal Experimentation Platform, which provides flexible solutions for designing, launching, and analyzing experiments and archiving results – all at a massive scale.\r\n\r\nWe are looking to add a broadly experienced, frontend-focused senior software engineer to our team to continue to help us build great internal products for the design and analysis of experiments.\r\n\r\nFront-end engineering on this team has some unique aspects. As described here, one of our core product strategies is to cede control of the visual representation of many experiment results to data scientists and engineers who build bespoke reports that are executed and rendered by our systems. But we also support less code-and-stats savvy users, from designers to product managers to executives. How do we enable such a broad suite of users to safely navigate a complex product that is a mix of infrastructure built by our team and reports contributed by power users? How do we deliver and distinguish between UI experiences targeted at decision-making (which need strict statistical controls) and those geared at exploration (which require low latency)? Where do we cede control to users, and where do we need to remain opinionated?\r\n\r\nWe work on a broad and evolving tech stack to build software systems for processing large data sets, performing statistical analysis, and representing results in human consumable formats. Although this role is primarily frontend engineering, we are ideally looking for someone who can also contribute to additional aspects of our stack. Our frontend is built in JavaScript/TypeScript. Much of our backend systems and APIs, including the mechanism for user contributions, are in Python. We also partner closely with data and platform engineering teams.\r\n\r\n\r\nYou Are\r\n\r\n\r\n    Experienced building and maintaining medium to large single-page applications. We currently work with TypeScript, React, Node.js, CSS, etc., but adapting to changing technology is an important strength.\r\n    Experienced with or have been exposed to some combination of data science workflows, data engineering, backend development in Python, API development, or data visualization.\r\n    A self-motivated engineer who thrives on direct and regular contact with our users and believes that fast user feedback and iteration results in better products.\r\n    Passionate about building high-impact, performant user experiences for platform tools with a highly technical user base, with a knack for simplifying user flows through complex systems\r\n    Independent, proactive, and able to deliver high-quality code that solves ambiguous user needs with minimal guidance. You unblock yourself as needed\r\n    Self-motivated and enjoy a variety of interdisciplinary collaboration models – from leading projects to jumping in at the last minute to get a project over the line. Our experimentation platform team brings together front and back end engineering, data science, design, and product management, and we aim to be much more than the sum of these parts.\r\n\r\n\r\nCulture\r\n\r\nNetflix offers amazing colleagues and a rapid pace of innovation. We embrace diversity and inclusion, and we are always on the lookout for stunning colleagues who bring new perspectives. Our unique culture emphasizes Freedom & Responsibility and permeates our way of work - hopefully, it resonates with you as much as it does with us.\r\n\r\n\r\nMore About Experimentation At Netflix\r\n\r\nCurious to learn more? Read up on experimentation culture at Netflix.\r\n\r\nAt Netflix, we carefully consider a wide range of compensation factors to determine your personal top of market. We rely on market indicators to determine compensation and consider your specific job, skills, and experience to get it right. These considerations can cause your compensation to vary and will also be dependent on your location.\r\n\r\nThe overall market range for roles in this area of Netflix is typically $150,000 - $750,000.\r\n\r\nThis market range is based on total compensation (vs. only base salary), which is in line with our compensation philosophy. Netflix is a unique culture and environment. Learn more here. ', 'Los Gatos, California, United States of America', '2024-01-11 10:18:27.000000', NULL, 'https://jobs.netflix.com/jobs/302454268');
INSERT INTO `job_posts` VALUES (8, 'Data Scientist: Internship Opportunities', 3, 'DATA_SCIENCE', 61080.00, 'INTERNSHIP', 'INTERNSHIP', 'Come build community, explore your passions and do your best work at Microsoft with thousands of students from every corner of the world. This opportunity will allow you to bring your aspirations, talent, potential—and excitement for the journey ahead. \r\n\r\nData Scientists at Microsoft use machine learning, statistics, experiments, and more to build and improve great products while making business impact. As a Data Scientist intern you will collaborate with stakeholders, formulate approaches to solve problems and use algorithms and data sources in the context of business and engineering needs. You will also be able to combine your engineering abilities with analytical skills to make customer experiences better. Our Data Scientists use innovative methods, algorithms, and tools daily to drive results throughout Microsoft devices, operating systems, products, and services and provide novel insights into business and customer scenarios.\r\n\r\nAt Microsoft, Interns work on real-world projects in collaboration with teams across the world, while having fun along the way. You’ll be empowered to build community, explore your passions and achieve your goals. This is your chance to bring your solutions and ideas to life while working on cutting-edge technology.\r\n\r\nMicrosoft’s mission is to empower every person and every organization on the planet to achieve more. As employees we come together with a growth mindset, innovate to empower others, and collaborate to realize our shared goals. Each day we build on our values of respect, integrity, and accountability to create a culture of inclusion where everyone can thrive at work and beyond.\r\n\r\nPlease note this application is only for internships based in our Redmond, Washington office. For internships in other offices in the United States, please see our Careers site.\r\n\r\nResponsibilities\r\n\r\nAs a Data Scientist Intern you will:\r\n\r\n    Formulate approaches to solve problems using well defined algorithms and data sources\r\n    Incorporate an understanding of product functionality and customer perspective to provide context for those problems\r\n    Use data exploration techniques to discover new questions or opportunities within your problem area and propose applicability and limitations of the data\r\n    Interpret the results of their analysis, validate their approach, and learn to monitor, analyze, and iterate to continuously improve\r\n    Engage with peer stakeholders to produce clear, compelling, actionable insights that influence product and service improvements that will impact millions of customers.\r\n    Participate in the peer review process and act on feedback while learning innovative methods, algorithms, and tools to increase the impact and applicability of your results\r\n\r\nQualifications\r\n\r\nRequired Qualifications:\r\n\r\n    Currently pursuing a Bachelor\'s or Master\'s in Computer Science, Mathematics, Economics, Statistics, Applied Sciences like Biostatistics, Physics, Chemistry, Computational Neurology and or other quant-focused field\r\n        Must have at least one additional quarter/semester of school remaining following the completion of the internship.  \r\n\r\nPreferred Qualifications\r\n\r\n    Some Engineering experience and or project course work using large data systems on SQL, Hadoop, etc.\r\n    Proficiency using one or more programming or scripting language to work with data such as: Python, Perl, or C#.\r\n    Some experience and or project course work performing data analysis and applying statistics working with tools such as: Excel, R, MATLAB, AMPL, or SAS.\r\n    Some experience and or project course work with product and service telemetry systems.\r\n    Some A/B Testing or experimentation (this can be from conducting real life science experiments, hypothesis testing in stats etc.) Not required but ideal.\r\n    Some experience or course work applying basic ML to a type of data and or used algorithms to conduct experiments on data.\r\n\r\nThe base pay range for this internship is USD $5,090 - $10,120 per month. There is a different range applicable to specific work locations, within the San Francisco Bay area and New York City metropolitan area, and the base pay range for this role in those locations is USD $6,690 - $11,030 per month.\r\n\r\nCertain roles may be eligible for benefits and other compensation. Find additional benefits and pay information here: https://careers.microsoft.com/us/en/us-intern-pay\r\n\r\n  \r\n\r\n#AISES\r\n\r\n#AT\r\n\r\n#GHC\r\n\r\n#NSBE\r\n\r\n#SHPE\r\n\r\n#SWE\r\n\r\nMicrosoft is an equal opportunity employer. Consistent with applicable law, all qualified applicants will receive consideration for employment without regard to age, ancestry, citizenship, color, family or medical care leave, gender identity or expression, genetic information, immigration status, marital status, medical condition, national origin, physical or mental disability, political affiliation, protected veteran or military status, race, ethnicity, religion, sex (including pregnancy), sexual orientation, or any other characteristic protected by applicable local laws, regulations and ordinances. If you need assistance and/or a reasonable accommodation due to a disability during the application process, read more about requesting accommodations. ', 'Redmond, Washington, United States of America', '2024-01-18 10:21:46.000000', NULL, 'https://jobs.careers.microsoft.com/us/en/job/1602310/Data-Scientist:-Internship-Opportunities');
INSERT INTO `job_posts` VALUES (9, 'Senior Software Engineer - Front End', 3, 'FRONTEND', 145800.00, 'FULLTIME', 'SENIOR', 'Microsoft’s Azure Data engineering team is leading the transformation of analytics in the world of data with products like databases, data integration, big data analytics, messaging & real-time analytics, and business intelligence. The products of our portfolio include Microsoft Fabric, Azure SQL DB, Azure Cosmos DB, Azure PostgreSQL, Azure Data Factory, Azure Synapse Analytics, Azure Service Bus, Azure Event Grid, and Power BI. Our mission is to build the data platform for the age of AI, powering a new class of data-first applications and driving a data culture.\r\n\r\nWithin Azure Data, the messaging and real-time analytics team provides comprehensive solutions and a robust platform that enables users to ingest high granularity signals (real-time & observability) and complex data, converting those into a competitive advantage in real-time for both end users and modern applications.  \r\n\r\nAs part of Data Activator, we’re creating the future of real-time intelligence products. In effect, we’re augmenting reality with timely, data-driven insights. We’re making it easy for people to make sense of the millions of events happening around them and see what actions to take every second of every day. We’re looking for a Senior Software Engineer - Front End to develop amazing user experiences for our applications and platform tools so people can easily extract the full value of their data. You will solve challenging technical problems and apply the latest open-source web technologies to build modern user interfaces that are performant, reliable, secure, responsive, and accessible. They include web technologies, such as React, TypeScript, JavaScript, jQuery, HTML5, and D3. \r\n\r\n \r\n\r\nMicrosoft’s mission is to empower every person and every organization on the planet to achieve more. As employees we come together with a growth mindset, innovate to empower others, and collaborate to realize our shared goals. Each day we build on our values of respect, integrity, and accountability to create a culture of inclusion where everyone can thrive at work and beyond.\r\n\r\nResponsibilities\r\n\r\n    Deliver world-class user experiences and features to customers on time\r\n    Drive engineering improvements continuously to ship more rapidly and efficiently with higher quality\r\n    Contribute to the product vision, roadmap, architecture, and planning\r\n    Collaborate with partner teams to deliver new value in our product and across Microsoft’s products\r\n    Work with customers to understand their pain points and make them successful\r\n    Foster a culture of excellence, inclusion, collaboration, and customer focus\r\n    Embody our culture and values\r\n\r\nQualifications\r\n\r\nRequired/Minimum Qualifications\r\n\r\n    Bachelor\'s degree in computer science, or related technical discipline AND 4+ years technical engineering experience with coding in languages including, but not limited to, C, C++, C#, Java, JavaScript, React or Python\r\n        OR equivalent experience. \r\n    3+ years experience with front end development.\r\n\r\nOther Requirements\r\n\r\nAbility to meet Microsoft, customer and/or government security screening requirements are required for this role. These requirements include, but are not limited to the following specialized security screenings: Microsoft Cloud Background Check:\r\n\r\n    This position will be required to pass the Microsoft Cloud background check upon hire/transfer and every two years thereafter.\r\n\r\nPreferred/Additional Qualifications\r\n\r\n    Bachelor\'s Degree in Computer Science or related technical field AND 8+ years technical engineering experience with coding in languages including, but not limited to, C, C++, C#, Java, JavaScript, React, or Python.\r\n        OR Master\'s Degree in Computer Science or related technical field AND 6+ years technical engineering experience with coding in languages including, but not limited to, C, C++, C#, Java, JavaScript, React or Python\r\n        OR equivalent experience. \r\n    Systematic problem solving with clean, modular design thinking\r\n    Track record in software engineering, including design, coding, code reviews, testing, and devops\r\n    Experience with building, deploying, and operating applications and services on cloud platforms (e.g., Azure, AWS, GCP)\r\n    Experience using AI models and Copilot\r\n    Experience with using data visualization technologies (e.g., D3, Highcharts)\r\n    Growth mindset to learn, seek diverse viewpoints, and stay current with industry trends and techniques\r\n    Startup mentality to move and iterate rapidly, work across disciplines, and focus on customers\r\n\r\nSoftware Engineering IC4 - The typical base pay range for this role across the U.S. is USD $112,000 - $218,400 per year. There is a different range applicable to specific work locations, within the San Francisco Bay area and New York City metropolitan area, and the base pay range for this role in those locations is USD $145,800 - $238,600 per year.\r\n\r\nCertain roles may be eligible for benefits and other compensation. Find additional benefits and pay information here: https://careers.microsoft.com/us/en/us-corporate-pay\r\n\r\n#azdat #azuredata #MRTA #DataActivator #AI #realtime #action #timeseries\r\n\r\nMicrosoft is an equal opportunity employer. Consistent with applicable law, all qualified applicants will receive consideration for employment without regard to age, ancestry, citizenship, color, family or medical care leave, gender identity or expression, genetic information, immigration status, marital status, medical condition, national origin, physical or mental disability, political affiliation, protected veteran or military status, race, ethnicity, religion, sex (including pregnancy), sexual orientation, or any other characteristic protected by applicable local laws, regulations and ordinances. If you need assistance and/or a reasonable accommodation due to a disability during the application process, read more about requesting accommodations. ', 'Redmond, Washington, United States of America', '2023-12-18 10:24:51.000000', NULL, 'https://jobs.careers.microsoft.com/us/en/job/1670821/Senior-Software-Engineer---Front-End');
INSERT INTO `job_posts` VALUES (10, 'Sr. Fullstack Developer', 3, 'FULLSTACK', NULL, 'CONTRACT', 'MID_SENIOR', 'Sr. Fullstack Software Engineer:\r\n\r\n\r\nDevelop software programs of a complex nature, including operating systems, applications and/or network products. Develop project plans, functional specifications and schedules for these products. Design and perform analysis on complex programs and systems. Assist in determining product requirements, technical specifications, and enhancements. Develop front-end web applications and back-end API services. Develop software using HTML, JavaScript, TypeScript, NodeJS, ASP.NET, C#, React, Angular. Develop extensions for M365 Products. Collaborate with the broader software engineering team to integrate solutions in products.\r\n\r\n\r\nQualifications:\r\n\r\n8+ years of full-stack software engineering experience building and releasing web services\r\n\r\n    Industry experience with C#, .NET Core, Java, TypeScript/JavaScript or similar\r\n    Experience integrating software apps/tools into M365 products/platforms\r\n    Strong design, implementation and testing skills\r\n    Ability to deploy services into microservice architecture (Dockers, Containerization, Kubernetes)\r\n    4+ years of experience w/ CI/CD development & deployment\r\n    Industry experience troubleshooting, investigating, and fixing production issues in large scale cloud and/or hosted environments\r\n    Demonstrated ability to write reliable, low defect, unit tested code\r\n    Ability to work and communicate effectively across disciplines and teams\r\n    Passion for delivering customer impact and value\r\n    BS degree in Computer Science, Engineering, and/or equivalent industry experience\r\n\r\n\r\nPreferred Qualifications:\r\n\r\n    Master’s Degree in C.S., Engineering, and/or equivalent industry experience\r\n    Experience with building infrastructure using Microsoft Azure technology\r\n    Good experience with AKS (Kubernetes).\r\n    Experience with microservices\r\n    Pipeline Deployment experience, especially Ev2', 'United States', '2024-01-20 10:27:03.000000', NULL, NULL);
INSERT INTO `job_posts` VALUES (11, 'Big Data Platform DevOps Engineer, Enterprise Systems', 5, 'DEVOPS', 170700.00, 'FULLTIME', 'MID_SENIOR', 'You like to automate anything which you do and you document it for the benefit of others. You are an independent problem-solver who is self-directed and capable of exhibiting deftness to handle multiple simultaneous competing priorities and deliver solutions in a timely manner. Provide incident resolution for all technical production issues. Create and maintain accurate, up-to-date documentation reflecting configuration, and responsible for writing justifications, training users in complex topics, writing status reports, documenting procedures, and interacting with other Apple staff and management. \r\n\r\nProvide guidance to improve the stability, security, efficiency, and scalability of systems. Determine future needs for capacity and investigate new products and/or features. Strong troubleshooting ability will be used daily; will take steps on their own to isolate issues and resolve root causes through investigative analysis in environments where the candidate has little knowledge/experience/documentation. Administer and ensure the proper execution of the backup systems. Provide 24x7 on-call support to handle urgent critical issues.\r\n\r\n    Experience architecting, building, monitoring, and operating large-scale complex data processing systems in Java/Scala like Spark, Flink, and Kafka in public clouds like AWS and GCP.\r\n    In-depth knowledge and experience in one or more large-scale distributed technologies including but not limited to: Hadoop ecosystem, Beam, Kafka, Samza, Flink, Storm, Flume, HBase, Cassandra, Redshift, Vertica, and Spark.\r\n    Experience in big data storage platforms and query engines with knowledge of cutting-edge technologies like Trino, Hive, Iceberg, Delta Lake, and Hudi.\r\n    Experience with containers and container orchestration platforms such as Docker and Kubernetes.\r\n    Strong proficiency with Helm and Kustomize for managing Kubernetes applications and configurations.\r\n    Passionate about operational excellence through proper automation and engineering processes using programming languages Go, Python, Java, or other JVM languages\r\n    Proficient in working with Linux or other POSIX operating systems, shell scripting, and networking technologies.\r\n    Proficient in best practices and enforcement for data security and data governance\r\n    Should be highly proactive with a keen focus on improving the uptime availability of our mission-critical services\r\n    Excellent verbal and written communication skills, able to collaborate cross-functionally with program managers and engineering partners\r\n    Comfortable working in a fast-paced environment while continuously evaluating new technologies. We are dedicated to the goal of building a culturally diverse and pluralistic team that reflects the multicultural variety of our customers.', 'Santa Clara Valley (Cupertino), California, United States', '2023-12-21 10:31:07.000000', NULL, 'https://jobs.apple.com/en-us/details/200515456/big-data-platform-devops-engineer-enterprise-systems?team=SFTWR');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_bot` bit(1) NOT NULL,
  `timestamp` datetime(6) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `publish_date` date NOT NULL,
  `sw_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stacks_used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `years` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKj2704p63s8hodba61hqrf9mk8`(`resume_id`) USING BTREE,
  CONSTRAINT `FKj2704p63s8hodba61hqrf9mk8` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `self_introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpv0whudowxosfu792veo6s2c0`(`user_id`) USING BTREE,
  CONSTRAINT `FKpv0whudowxosfu792veo6s2c0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_ofx66keruapi6vyqpv6f2or37`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ROLE_ADMIN');
INSERT INTO `roles` VALUES (2, 'ROLE_USER');

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKgbvruf9elre1eq2lsv96gdoxo`(`resume_id`) USING BTREE,
  CONSTRAINT `FKgbvruf9elre1eq2lsv96gdoxo` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for user_bookmarked_job_posts
-- ----------------------------
DROP TABLE IF EXISTS `user_bookmarked_job_posts`;
CREATE TABLE `user_bookmarked_job_posts`  (
  `user_id` bigint(20) NOT NULL,
  `job_post_id` bigint(20) NOT NULL,
  INDEX `FKnmyvcr52up8x39p0nnbyroemc`(`job_post_id`) USING BTREE,
  INDEX `FK8s7cguylguvlupicwsqdkq80p`(`user_id`) USING BTREE,
  CONSTRAINT `FK8s7cguylguvlupicwsqdkq80p` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnmyvcr52up8x39p0nnbyroemc` FOREIGN KEY (`job_post_id`) REFERENCES `job_posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bookmarked_job_posts
-- ----------------------------

-- ----------------------------
-- Table structure for user_preference
-- ----------------------------
DROP TABLE IF EXISTS `user_preference`;
CREATE TABLE `user_preference`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_preference
-- ----------------------------

-- ----------------------------
-- Table structure for user_preference_fields
-- ----------------------------
DROP TABLE IF EXISTS `user_preference_fields`;
CREATE TABLE `user_preference_fields`  (
  `user_preference_id` bigint(20) NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `FKofx3og10g4650cy5ywd6gsdxe`(`user_preference_id`) USING BTREE,
  CONSTRAINT `FKofx3og10g4650cy5ywd6gsdxe` FOREIGN KEY (`user_preference_id`) REFERENCES `user_preference` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_preference_fields
-- ----------------------------

-- ----------------------------
-- Table structure for user_preference_seq
-- ----------------------------
DROP TABLE IF EXISTS `user_preference_seq`;
CREATE TABLE `user_preference_seq`  (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL,
  `increment` bigint(21) NOT NULL,
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL ,
  `cycle_count` bigint(21) NOT NULL 
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of user_preference_seq
-- ----------------------------
INSERT INTO `user_preference_seq` VALUES (1, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_6dotkott2kjsp8vw4d0m25fb7`(`email`) USING BTREE,
  UNIQUE INDEX `UK_2ty1xmrrgtn89xt7kyxx6ta7h`(`nickname`) USING BTREE,
  UNIQUE INDEX `UK_r43af9ap4edm43mmtq01oddj6`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user0@test.com', 'Jane Doe', 'DancingDolphin', '$2a$10$C7RaHyVeGOl2/lgtZhxMo.PzfbJvBbmoTNfQlnbccuHJ3n0PqvWHm', 'user0');

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FKj6m8fwv7oqv74fcehir1a9ffy`(`role_id`) USING BTREE,
  INDEX `FK2o0jvgh89lemvvo17cbqvdxaa`(`user_id`) USING BTREE,
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 2);

-- ----------------------------
-- Table structure for users_seq
-- ----------------------------
DROP TABLE IF EXISTS `users_seq`;
CREATE TABLE `users_seq`  (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL ,
  `increment` bigint(21) NOT NULL ,
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL ,
  `cycle_count` bigint(21) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of users_seq
-- ----------------------------
INSERT INTO `users_seq` VALUES (50001, 1, 9223372036854775806, 1, 50, 1000, 0, 0);

-- ----------------------------
-- Table structure for work_experience
-- ----------------------------
DROP TABLE IF EXISTS `work_experience`;
CREATE TABLE `work_experience`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `years` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resume_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlho647rchg4fd13e5mhpsdbmh`(`resume_id`) USING BTREE,
  CONSTRAINT `FKlho647rchg4fd13e5mhpsdbmh` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_experience
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
