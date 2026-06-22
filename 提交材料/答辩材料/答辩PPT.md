% SpringCloud 微服务大作业答辩
% 软件工程2班 郑文杰
% 2026-06-22

# 1. 项目概述

- 项目名称：SpringCloud 微服务大作业
- 项目背景：基于黑马头条实训项目完成微服务架构实践
- 项目目标：完成前后端源码整理、数据库部署、服务运行与提交材料准备

# 2. 技术栈

- 后端：Spring Boot、Spring Cloud、Spring Cloud Alibaba
- 数据库：MySQL
- 注册配置中心：Nacos
- 文件存储：MinIO
- 网关：Spring Cloud Gateway

# 3. 系统结构

- 用户服务 `leadnews-user`
- 文章服务 `leadnews-article`
- 自媒体服务 `leadnews-wemedia`
- APP 网关 `leadnews-app-gateway`
- 自媒体网关 `leadnews-wemedia-gateway`

# 4. 项目目录

- 后端源码：`微服务大作业/软件/chapter111/heima-leadnews`
- 前端源码：`微服务大作业/软件/app-web`
- 自媒体前端：`微服务大作业/软件/wemedia-web/wemedia-web`
- 数据库脚本：`微服务大作业/数据库`

# 5. 主要成果

- 完成前后端源码整理
- 完成数据库脚本归档
- 补充部署说明 README
- 准备答辩 PPT 与团队分工表

# 6. 数据库设计

- 用户库：`leadnews_user`
- 文章库：`leadnews_article`
- 自媒体库：`leadnews_wemedia`
- 支持统一 SQL 导入

# 7. 部署流程

- 导入数据库
- 启动 Nacos、MySQL、MinIO
- 修改配置文件
- 启动微服务
- 部署前端页面

# 8. 项目亮点

- 使用微服务架构拆分业务模块
- 通过网关统一转发请求
- 支持配置中心与对象存储
- 材料整理齐全，便于最终提交

# 9. 问题与优化

- 当前线上访问地址仍需后续部署后补充
- 可继续优化自动化测试和持续部署
- 可补充更多业务模块与接口联调

# 10. 总结

- 本次实训掌握了 SpringCloud 微服务项目结构与部署流程
- 完成了源码、数据库、文档、答辩材料的统一整理
- 具备后续继续扩展和优化的基础

# 11. 答辩结束

- 感谢老师聆听
- 请老师指正
