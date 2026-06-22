-- 使用数据库
USE leadnews_article;

-- 插入测试文章数据
INSERT INTO `ap_article` (`id`, `title`, `author_id`, `author_name`, `channel_id`, `channel_name`, `layout`, `flag`, `images`, `labels`, `likes`, `collection`, `comment`, `views`, `publish_time`, `created_time`, `static_url`) 
VALUES (
    2063919352767434753, 
    '新型工业化激发经济发展新动能', 
    1, 
    '测试作者', 
    2, 
    '机器人', 
    1, 
    0, 
    '["https://example.com/image1.jpg"]', 
    '工业化,人工智能,经济发展', 
    100, 
    50, 
    20, 
    1000, 
    NOW(), 
    NOW(), 
    NULL
);

-- 插入文章配置
INSERT INTO `ap_article_config` (`id`, `article_id`, `is_comment`, `is_forward`, `is_down`, `is_delete`) 
VALUES (
    (SELECT FLOOR(RAND() * 1000000000000000) + 1), 
    2063919352767434753, 
    TRUE, 
    TRUE, 
    FALSE, 
    FALSE
);

-- 插入文章内容（JSON格式）
INSERT INTO `ap_article_content` (`id`, `article_id`, `content`) 
VALUES (
    (SELECT FLOOR(RAND() * 1000000000000000) + 1), 
    2063919352767434753, 
    '[
        {"type": "text", "value": "新时代新征程，为中国式现代化构筑强大物质技术基础，实现新型工业化是必然选择。"},
        {"type": "text", "value": "中央经济工作会议提出，要大力推进新型工业化，发展数字经济，加快推动人工智能发展。"},
        {"type": "text", "value": "为不断增强推进新型工业化的动力与活力指明了方向。"},
        {"type": "image", "value": "https://example.com/industry-image.jpg"},
        {"type": "text", "value": "工业化是现代化的前提和基础，立足新发展阶段推进新型工业化，能够为我国经济发展提供新的强大动力，从而保障强国建设、民族复兴的宏伟目标顺利实现。"}
    ]'
);

-- 查询验证
SELECT a.id, a.title, a.author_name, a.channel_name, ac.content 
FROM ap_article a 
LEFT JOIN ap_article_content ac ON a.id = ac.article_id 
WHERE a.id = 2063919352767434753;
