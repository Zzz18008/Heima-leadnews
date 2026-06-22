CREATE DATABASE IF NOT EXISTS leadnews_wemedia DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE leadnews_wemedia;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `wm_channel`;
CREATE TABLE `wm_channel`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道描述',
  `is_default` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '是否默认频道',
  `status` tinyint(0) UNSIGNED NULL DEFAULT NULL,
  `ord` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '默认排序',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '频道信息表' ROW_FORMAT = Dynamic;


INSERT INTO `wm_channel` VALUES (1, 'Java', '后端框架', 1, 1, 1, '2021-04-18 12:25:30');
INSERT INTO `wm_channel` VALUES (2, 'MySQL', '轻量级数据库', 1, 1, 4, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (3, 'Vue', '阿里前端框架', 1, 1, 5, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (4, 'Python', '未来的语言', 1, 1, 6, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (5, 'Weex', '向未来致敬', 1, 1, 7, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (6, '大数据', '不会，则不要说自己是搞互联网的', 1, 1, 10, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (7, '其他', '其他', 1, 1, 12, '2021-04-18 10:55:41');


DROP TABLE IF EXISTS `wm_material`;
CREATE TABLE `wm_material`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '自媒体用户ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片地址',
  `type` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '素材类型\r\n            0 图片\r\n            1 视频',
  `is_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否收藏',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文素材信息表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `wm_news`;
CREATE TABLE `wm_news`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '自媒体用户ID',
  `title` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图文内容',
  `type` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章布局\r\n            0 无图文章\r\n            1 单图文章\r\n            3 多图文章',
  `channel_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '图文频道ID',
  `labels` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `submited_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `status` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '当前状态\r\n            0 草稿\r\n            1 提交（待审核）\r\n            2 审核失败\r\n            3 人工审核\r\n            4 人工审核通过\r\n            8 审核通过（待发布）\r\n            9 已发布',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '定时发布时间，不定时则为空',
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拒绝理由',
  `article_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '发布库文章ID',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '//图片用逗号分隔',
  `enable` tinyint(0) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文内容信息表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `wm_news_material`;
CREATE TABLE `wm_news_material`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '素材ID',
  `news_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '图文ID',
  `type` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '引用类型\r\n            0 内容引用\r\n            1 主图引用',
  `ord` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '引用排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文引用素材信息表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `wm_user`;
CREATE TABLE `wm_user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `nickname` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '状态\r\n            0 暂时不可用\r\n            1 永久不可用\r\n            9 正常可用',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `type` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '账号类型\r\n            0 个人 \r\n            1 企业\r\n            2 子账号',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体用户信息表' ROW_FORMAT = Dynamic;


INSERT INTO `wm_user` VALUES (1102, 'admin', 'admin', '123456', '管理', NULL, '13234567657', 1, NULL, NULL, NULL, '2023-03-14 09:35:13');

SET FOREIGN_KEY_CHECKS = 1;
