-- 创建用户数据库
CREATE DATABASE IF NOT EXISTS leadnews_user DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE leadnews_user;

-- 创建用户表
CREATE TABLE IF NOT EXISTS `ap_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `salt` VARCHAR(32) DEFAULT NULL COMMENT '密码、通信等加密盐',
  `name` VARCHAR(20) DEFAULT NULL COMMENT '用户名',
  `password` VARCHAR(64) DEFAULT NULL COMMENT '密码,md5加密',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `image` VARCHAR(255) DEFAULT NULL COMMENT '头像',
  `sex` TINYINT(1) DEFAULT '0' COMMENT '0男 1女',
  `is_certification` TINYINT(1) DEFAULT '0' COMMENT '是否实名认证',
  `area` VARCHAR(20) DEFAULT NULL COMMENT '地区',
  `birthday` DATE DEFAULT NULL COMMENT '生日',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='APP用户信息表';

-- 插入测试用户数据
-- 手机号: 13511223456
-- 密码: 123456 (MD5加密后需要加上盐值)
-- 这里使用一个简单的示例,实际项目中应该使用 BCrypt 或其他安全方式加密
INSERT INTO `ap_user` (`id`, `salt`, `name`, `password`, `phone`, `image`, `sex`, `is_certification`, `area`, `birthday`, `created_time`) 
VALUES 
(1, 'abc123xyz', '测试用户', MD5(CONCAT('123456', 'abc123xyz')), '13511223456', NULL, 0, 0, '北京', '1990-01-01', NOW())
ON DUPLICATE KEY UPDATE phone='13511223456';

-- 查询验证
SELECT * FROM ap_user WHERE phone='13511223456';
