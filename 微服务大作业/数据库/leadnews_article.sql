CREATE DATABASE IF NOT EXISTS leadnews_article DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE leadnews_article;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `ap_article`;
CREATE TABLE `ap_article`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `author_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章作者的ID',
  `author_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者昵称',
  `channel_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章所属频道ID',
  `channel_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道名称',
  `layout` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章布局\r\n            0 无图文章\r\n            1 单图文章\r\n            2 多图文章',
  `flag` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章标记\r\n            0 普通文章\r\n            1 热点文章\r\n            2 置顶文章\r\n            3 精品文章\r\n            4 大V 文章',
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文章图片\r\n            多张逗号分隔',
  `labels` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文章标签最多3个 逗号分隔',
  `likes` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数量',
  `collection` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '收藏数量',
  `comment` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '评论数量',
  `views` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '阅读数量',
  `province_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '省市',
  `city_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '市区',
  `county_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '区县',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `sync_status` tinyint(1) NULL DEFAULT 0 COMMENT '同步状态',
  `origin` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '来源',
  `static_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691284001146327043 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章信息表，存储已发布的文章' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `ap_article_config`;
CREATE TABLE `ap_article_config`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章ID',
  `is_comment` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '是否可评论',
  `is_forward` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '是否转发',
  `is_down` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '是否下架',
  `is_delete` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691284001184075778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP已发布文章配置表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `ap_article_content`;
CREATE TABLE `ap_article_content`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '文章ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1691284001192464386 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP已发布文章内容表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
