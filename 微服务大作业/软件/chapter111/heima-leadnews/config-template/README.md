# Nacos 配置中心配置指南

## 问题描述
登录时提示"用户或密码错误",原因是 Nacos 配置中心缺少必要的配置。

## 解决步骤

### 1. 导入数据库

执行 `init-user-db.sql` 脚本创建数据库和测试用户:

```bash
mysql -u root -p < init-user-db.sql
```

**测试用户信息:**
- 手机号: `13511223456`
- 密码: `123456`

### 2. 配置 Nacos 配置中心

#### 方式一:通过 Nacos 控制台手动配置(推荐)

1. 访问 Nacos 控制台: http://localhost:8848/nacos
   - 用户名: `nacos`
   - 密码: `nacos`

2. 点击左侧菜单 "配置管理" -> "配置列表"

3. 点击 "+" 号创建新配置

4. **创建网关配置:**
   - Data ID: `heima-leadnews-app-gateway.yml`
   - Group: `DEFAULT_GROUP`
   - 配置格式: `YAML`
   - 配置内容: 复制 `heima-leadnews-app-gateway.yml` 文件的内容
   - 点击 "发布"

5. **创建用户服务配置:**
   - Data ID: `leadnews-user.yml`
   - Group: `DEFAULT_GROUP`
   - 配置格式: `YAML`
   - 配置内容: 复制 `leadnews-user.yml` 文件的内容
   - **注意**: 修改数据库密码为你实际的 MySQL 密码
   - 点击 "发布"

#### 方式二:使用 API 导入配置

```bash
# 导入网关配置
curl -X POST "http://127.0.0.1:8848/nacos/v1/cs/configs" \
  -d "dataId=heima-leadnews-app-gateway.yml" \
  -d "group=DEFAULT_GROUP" \
  -d "username=nacos" \
  -d "password=nacos" \
  -d "type=yaml" \
  --data-urlencode "content@heima-leadnews-app-gateway.yml"

# 导入用户服务配置
curl -X POST "http://127.0.0.1:8848/nacos/v1/cs/configs" \
  -d "dataId=leadnews-user.yml" \
  -d "group=DEFAULT_GROUP" \
  -d "username=nacos" \
  -d "password=nacos" \
  -d "type=yaml" \
  --data-urlencode "content@leadnews-user.yml"
```

### 3. 重启服务

配置完成后,需要重启相关服务使配置生效:

1. 在 IDEA 中停止 `heima-leadnews-app-gateway` 服务
2. 重新启动 `heima-leadnews-app-gateway` 服务
3. 在 IDEA 中停止 `heima-leadnews-user` 服务
4. 重新启动 `heima-leadnews-user` 服务

### 4. 验证配置

检查服务是否成功从 Nacos 读取配置:

```bash
# 查看网关日志,应该能看到路由加载信息
tail -f /path/to/gateway/logs/app.log | grep "Route"

# 测试登录接口
curl -X POST http://localhost:8802/app/v1/user/login \
  -H "Content-Type: application/json" \
  -d '{"phone":"13511223456","password":"123456"}'
```

如果返回 token 而不是 404,说明配置成功!

## 常见问题

### Q1: 仍然返回 404
- 检查 Nacos 中配置是否正确发布
- 检查网关服务是否已重启
- 查看网关日志是否有错误信息

### Q2: 数据库连接失败
- 检查 MySQL 是否启动
- 检查 `leadnews-user.yml` 中的数据库密码是否正确
- 确认数据库 `leadnews_user` 是否存在

### Q3: 密码错误
- 确认数据库中用户记录的 salt 值与代码中使用的加密方式一致
- 查看用户服务的日志,了解具体的密码验证逻辑

## 其他服务配置

如果项目还有其他微服务(文章、搜索、行为、评论等),也需要在 Nacos 中创建对应的配置文件:

- `leadnews-article.yml` - 文章服务配置
- `leadnews-search.yml` - 搜索服务配置
- `leadnews-behavior.yml` - 行为服务配置
- `leadnews-comment.yml` - 评论服务配置

每个服务的配置类似 `leadnews-user.yml`,主要区别是数据库名称不同。
