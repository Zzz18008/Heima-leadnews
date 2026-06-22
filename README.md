# SpringCloud实训

本项目为 黑马头条 - 资讯网络平台实训作业，包含后端微服务源码、前端静态页面、数据库脚本、答辩材料和部署说明。项目 GitHub 仓库地址如下：

- GitHub: `https://github.com/Zzz18008/SpringCloud-.git`

## 1. 提交内容说明

按照老师要求，压缩包内应包含以下内容：

1. 源代码：前后端源码文件夹，并提供 Gitee/GitHub 仓库地址
2. 文档：《实训报告.doc》
3. 数据库文件：`.sql` 文件，包含建表语句和必要的初始化数据
4. 答辩材料：团队组织与分工表、最终答辩 PPT
5. 部署说明：`README.md`，说明本地或服务器部署方式，并提供线上访问链接

## 2. 项目结构

```text
黑马头条/
├── README.md
├── 黑马头条/
│   ├── 数据库/
│   └── 软件/
│       ├── app-web/
│       ├── wemedia-web/
│       ├── chapter111/heima-leadnews/
│       ├── plugins/
│       └── 其他配套软件
└── 提交材料/
    ├── 数据库文件/
    
```

## 3. 核心源码说明

后端核心工程目录：

- `黑马头条/软件/chapter111/heima-leadnews`

后端主要模块：

- `heima-leadnews-common`
- `heima-leadnews-model`
- `heima-leadnews-service`
- `heima-leadnews-gateway`
- `heima-leadnews-file-starter`

前端目录：

- 用户端：`黑马头条/软件/app-web`
- 自媒体端：`黑马头条/软件/wemedia-web/wemedia-web`

## 4. 运行环境

- JDK 11
- Maven 3.6+
- MySQL 8.x
- Nacos
- MinIO

## 5. 数据库导入

项目现有数据库脚本：

- `黑马头条/数据库/leadnews_user.sql`
- `黑马头条/数据库/leadnews_article.sql`
- `黑马头条/数据库/leadnews_wemedia.sql`

也可直接使用整理后的统一脚本：

- `提交材料/数据库文件/all-init.sql`

导入示例：

```bash
mysql -uroot -p < "提交材料/数据库文件/all-init.sql"
```

## 6. 本地部署步骤

### 6.1 启动基础环境

1. 启动 MySQL
2. 启动 Nacos
3. 启动 MinIO

### 6.2 导入数据库

执行 `leadnews_user.sql`、`leadnews_article.sql`、`leadnews_wemedia.sql`，或直接执行 `all-init.sql`。

### 6.3 启动后端服务

进入目录：

```bash
cd "黑马头条/软件/chapter111/heima-leadnews"
```

打包：

```bash
mvn clean package -DskipTests
```

推荐启动顺序：

1. `leadnews-user`
2. `leadnews-article`
3. `leadnews-wemedia`
4. `leadnews-app-gateway`
5. `leadnews-wemedia-gateway`

### 6.4 前端访问

- 用户端入口：`黑马头条/软件/app-web/index.html`
- 自媒体端入口：`黑马头条/软件/wemedia-web/wemedia-web/index.html`

可通过 Nginx 或本地静态服务器部署。

## 7. 配置说明

项目中部分服务使用本地配置，部分服务依赖 Nacos 配置。

重要配置文件包括：

- `heima-leadnews-service/heima-leadnews-user/src/main/resources/bootstrap.yml`
- `heima-leadnews-service/heima-leadnews-article/src/main/resources/bootstrap.yml`
- `heima-leadnews-service/heima-leadnews-wemedia/src/main/resources/application.yml`
- `heima-leadnews-gateway/heima-leadnews-app-gateway/src/main/resources/application.yml`

运行前请根据本机实际环境修改：

- MySQL 用户名和密码
- MinIO 地址、账号和密码
- Nacos 地址

## 8. 线上访问链接

当前本地材料中未发现已经完成的公网部署地址，因此暂时无法提供有效线上访问链接。若后续部署到服务器，可在此补充：

- 前台访问链接：
- 自媒体端链接：
- 接口网关链接：

## 9. 仓库地址

- GitHub：`https://github.com/Zzz18008/SpringCloud-.git`

