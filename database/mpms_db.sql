-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 09:34 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `mpms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_list`
--

CREATE TABLE `inquiry_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text DEFAULT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiry_list`
--

INSERT INTO `inquiry_list` (`id`, `fullname`, `contact`, `email`, `subject`, `message`, `status`, `date_created`, `date_updated`) VALUES
(2, 'Mark Cooper', '09123456789', 'mcooper@sample.com', 'Sample Inquiry', 'This is a sample inquiry only', 1, '2022-05-26 14:13:47', '2022-05-26 14:14:12'),
(4, 'John Smith', '0978945645', 'jsmith@sample.com', 'Sample Inquiry #2', 'This is my sample question.', 0, '2022-05-26 15:32:54', '2022-05-26 15:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `quote_list`
--

CREATE TABLE `quote_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `fullname` text NOT NULL,
  `email` text DEFAULT NULL,
  `contact` text NOT NULL,
  `origin` text NOT NULL,
  `destination` text NOT NULL,
  `schedule` date NOT NULL,
  `remarks` text NOT NULL,
  `admin_remarks` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `quote_list` (`id`, `code`, `fullname`, `email`, `contact`, `origin`, `destination`, `schedule`, `remarks`, `admin_remarks`, `status`, `date_created`, `date_updated`) VALUES
(2, '2022052600001', 'Mark Cooper', 'mcooper@sample.com', '09123456789', 'Sample Origin', 'Sample Destination', '2022-06-08', 'Nullam vitae ullamcorper metus. Praesent tempor nunc eu malesuada varius. Donec porta cursus purus, ac tincidunt nibh placerat congue. Nunc lorem nibh, volutpat ac tortor vitae, fermentum hendrerit dolor. Duis et nisl egestas velit faucibus interdum et ut arcu. Pellentesque porttitor neque ut neque consequat condimentum. Proin molestie fermentum mi ut molestie. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Donec at ligula eu velit eleifend dignissim eu non lacus. Vivamus et blandit erat. Aliquam blandit orci eget congue finibus. Maecenas ornare mi risus. In hac habitasse platea dictumst. Nunc ac dictum elit. Cras sed rhoncus lacus, vitae pharetra dolor. Pellentesque a ante quis nisl blandit ultricies. Vivamus rhoncus blandit sapien eget dapibus. Nulla mollis sapien ut vestibulum tempus. Donec convallis hendrerit rhoncus.', 1, '2022-05-26 15:24:48', '2022-05-26 15:26:01'),
(3, '2022052600002', 'John Smith', 'jsmith@sample.com', '0978945645', 'Address 101', 'Address 102', '2022-06-07', 'Sample only', '', 0, '2022-05-26 15:32:20', '2022-05-26 15:32:20');



CREATE TABLE `quote_services` (
  `quote_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `quote_services` (`quote_id`, `service_id`) VALUES
(2, 2),
(2, 4),
(2, 1),
(3, 3);



CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `service_list` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Packers &amp; Movers', '&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut felis leo, dictum sit amet lectus consequat, interdum condimentum lacus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam vitae ante auctor tellus feugiat scelerisque vel ultrices metus. Curabitur est mi, feugiat eu lorem ut, accumsan tempus odio. Proin ut tortor molestie, lacinia sem quis, sodales dolor. Ut lectus ligula, dictum a porttitor id, sollicitudin id ligula.&lt;/span&gt;', 'uploads/services//1_wp1.jpg?v=1653542956', 1, 0, '2022-05-26 13:29:16', '2022-05-26 13:34:48'),
(2, 'Car Transport', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Vestibulum eu finibus libero. Donec lobortis tortor et libero porta venenatis. In imperdiet facilisis lobortis. Suspendisse in elementum elit. Quisque vitae ex mi. Sed euismod pulvinar elit, vitae bibendum felis faucibus vitae. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce pellentesque purus et tempor rutrum. Suspendisse in suscipit dui, id molestie neque. Nunc varius vulputate maximus. Quisque vitae odio id felis bibendum posuere.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;&amp;lt;script&amp;gt;alert(1)&amp;lt;/script&amp;gt;&lt;/span&gt;&lt;/p&gt;', 'uploads/services//wp2.jpg?v=1653542991', 1, 0, '2022-05-26 13:29:51', '2022-05-26 13:33:31'),
(3, 'Office Things', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Etiam nec convallis sem. Praesent vehicula pellentesque nibh, eu gravida metus ultricies nec. Praesent et massa ac libero condimentum maximus non eu lacus. Nam massa elit, suscipit ut ex sed, lobortis blandit urna. Nam elementum feugiat felis eu pulvinar. Phasellus sed tortor lacinia, aliquam felis at, accumsan dui. Vivamus eu diam sit amet risus feugiat ultrices. Duis ut sapien quam.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', NULL, 1, 0, '2022-05-26 14:15:54', '2022-05-26 14:15:54'),
(4, 'House Furniture', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Donec iaculis tortor feugiat, interdum neque vehicula, sollicitudin ipsum. Mauris sem dui, placerat a pulvinar sed, tincidunt eget purus. Etiam sit amet dolor blandit, rhoncus ex nec, laoreet velit. In eget iaculis augue. Suspendisse eget enim ut sem luctus aliquam. Aliquam vulputate ullamcorper velit, porta feugiat massa faucibus in. Donec id finibus dui. Ut varius tortor quis porta accumsan. Pellentesque bibendum ullamcorper arcu ut varius. Phasellus a efficitur libero. Cras et ex eget arcu rhoncus rutrum vel eget lorem. Nulla egestas quis magna in congue.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', NULL, 1, 0, '2022-05-26 14:17:51', '2022-05-26 14:17:51');



CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Packers and Movers Management System'),
(6, 'short_name', 'PMMS- PHP'),
(11, 'logo', 'uploads/logo.png?v=1653541594'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1653541595'),
(17, 'phone', '456-987-1231'),
(18, 'mobile', '09123456987 / 094563212222 '),
(19, 'email', 'info@sample.com'),
(20, 'address', '7087 Henry St. Clifton Park, NY 12065');



CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';



INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-05-16 14:17:49'),
(7, 'John', 'D', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 2, '2022-05-26 11:04:16', '2022-05-26 11:04:16');


ALTER TABLE `inquiry_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `quote_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `quote_services`
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `service_id` (`service_id`);


ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quote_list`
--
ALTER TABLE `quote_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quote_services`
--
ALTER TABLE `quote_services`
  ADD CONSTRAINT `quote_id_fk_qs` FOREIGN KEY (`quote_id`) REFERENCES `quote_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `service_id_fk_qs` FOREIGN KEY (`service_id`) REFERENCES `service_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;
